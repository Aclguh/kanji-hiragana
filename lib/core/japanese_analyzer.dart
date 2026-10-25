import 'dart:async';
import 'dart:isolate';

import 'package:characters/characters.dart';
import 'package:kuromoji/kuromoji.dart';

import 'analyzer_failure.dart';
import 'analyzer_service.dart';
import 'diagnostics.dart';
import 'input_sanitizer.dart';
import 'kana_romaji.dart';
import 'kanji_converter.dart';
import 'kanji_reading_dict.dart';
import 'morpheme.dart';

// kuromoji 未从公共入口导出 Tokenizer 类型, 因此这里显式引入其实现库。
// ignore: implementation_imports
import 'package:kuromoji/src/tokenizer.dart';

/// 单次分析的最大字符数限制，防止超长文本造成内存膨胀与卡顿。
const int kMaxInputLength = 4000;

/// 单次分词请求的默认超时时间。
///
/// 词典构建耗时不计入请求超时; 这里约束的是「请求已发出但 isolate 无回信」。
const Duration kDefaultAnalysisTimeout = Duration(seconds: 15);

final RegExp _lineSplitRegex = RegExp(r'\r?\n');
final RegExp _tokenSplitRegex = RegExp(r'([、。]+|[^、。\r\n]+)');

/// isolate 消息标签 (主 -> 分词 isolate)。
const _buildTag = 'build';
const _tokenizeTag = 'tokenize';
const _tokenizeBatchTag = 'tokenize_batch';
const _hangTag = 'hang';

/// isolate 消息标签 (分词 isolate -> 主)。
const _resultTag = 'result';
const _errorTag = 'error';
const _exitTag = 'exit';

/// 日语形态素分析服务。
///
/// kuromoji 的 [Tokenizer] 与其词典驻留在一个**常驻 isolate** 中。
/// tokenize 是 CPU 密集调用, 留在主 isolate 会在长文本输入时阻塞 UI 帧;
/// 词典构建约 400ms 且对象不可跨 isolate 共享, 因此构建一次后常驻,
/// 而非每次请求重建。
///
/// 消息协议 (位置列表, 内容均为可跨 isolate 复制的纯数据):
/// - 主 -> isolate: `[_buildTag, id]` / `[_tokenizeTag, id, text]`;
/// - isolate -> 主: `[_resultTag, id, tokens]` / `[_errorTag, id, message]`,
///   isolate 退出时经 onExit 发 `[_exitTag]`。
///
/// tokenize 的返回值本身就是纯数据 map, 直接传回;
/// [Morpheme.fromToken] 的提取仍在调用方 isolate 完成。
///
/// 初始化耗时约 400ms(仅一次), 建议在应用启动时调用 [warmUp]。
class JapaneseAnalyzer implements AnalyzerService {
  JapaneseAnalyzer._();

  static final JapaneseAnalyzer instance = JapaneseAnalyzer._();

  /// 主 isolate 的接收端口, 握手与全部回信共用。
  ReceivePort? _port;

  /// 常驻分词 isolate, [close] 时终止。
  Isolate? _isolate;

  /// 分词 isolate 的回信端口, 握手完成后可用。
  SendPort? _tokenizerPort;

  /// 等待握手完成, 由 [_start] 持有。
  Completer<SendPort>? _handshake;

  Future<void>? _initializing;

  /// 在途请求, 按请求 id 配对回信; 支持并发请求 (isolate 侧天然串行)。
  final _pending = <int, Completer<dynamic>>{};

  int _nextId = 0;

  /// 每次启动 isolate 的代号, 用于忽略旧 isolate 迟到的退出通知。
  int _generation = 0;

  /// 是否已就绪 (与分词 isolate 握手完成且词典构建成功)。
  bool get isReady => _tokenizerPort != null;

  /// 预加载词典。重复调用安全(共享同一个 Future)。
  @override
  Future<void> warmUp() {
    if (isReady) return Future.value();
    return _initializing ??= _start();
  }

  Future<void> _start() async {
    final port = _port = ReceivePort();
    final handshake = _handshake = Completer<SendPort>();
    port.listen(_onMessage);
    try {
      final generation = ++_generation;
      final isolate = _isolate =
          await Isolate.spawn(_tokenizerMain, port.sendPort);
      isolate.addOnExitListener(
        port.sendPort,
        response: [_exitTag, generation],
      );
      await handshake.future;
      // 触发词典构建, warmUp 的语义与直接在主 isolate 构建时一致。
      await _send(
        (id) => [_buildTag, id],
        timeout: kDefaultAnalysisTimeout,
      );
    } catch (e) {
      final isolate = _isolate;
      _isolate = null;
      isolate?.kill(priority: Isolate.immediate);
      _reset();
      rethrow;
    }
  }

  /// 发送一条请求并等待回信; [makeMessage] 用分配的请求 id 构造消息。
  Future<List<Map<String, dynamic>>> _send(
    List<Object> Function(int id) makeMessage, {
    required Duration timeout,
  }) async {
    final port = _tokenizerPort;
    if (port == null) {
      throw const AnalyzerNotReady();
    }
    final id = _nextId++;
    final completer = Completer<dynamic>();
    _pending[id] = completer;
    port.send(makeMessage(id));
    try {
      final result = await completer.future.timeout(timeout);
      return (result as List).cast<Map<String, dynamic>>();
    } on TimeoutException catch (error) {
      _pending.remove(id);
      throw AnalyzerTimeout(timeout, error);
    } finally {
      _pending.remove(id);
    }
  }

  /// 发送多行文本批量分词请求并等待回信。
  Future<List<List<Map<String, dynamic>>>> _sendBatch(
    List<String> lines, {
    required Duration timeout,
  }) async {
    final port = _tokenizerPort;
    if (port == null) {
      throw const AnalyzerNotReady();
    }
    final id = _nextId++;
    final completer = Completer<dynamic>();
    _pending[id] = completer;
    port.send([_tokenizeBatchTag, id, lines]);
    try {
      final result = await completer.future.timeout(timeout) as List;
      return result
          .map((lineTokens) => (lineTokens as List).cast<Map<String, dynamic>>())
          .toList(growable: false);
    } on TimeoutException catch (error) {
      _pending.remove(id);
      throw AnalyzerTimeout(timeout, error);
    } finally {
      _pending.remove(id);
    }
  }

  void _onMessage(Object? message) {
    if (message is SendPort) {
      _tokenizerPort = message;
      _handshake?.complete(message);
      return;
    }
    if (message is! List || message.isEmpty) return;
    switch (message[0]) {
      case _resultTag:
        _pending.remove(message[1])?.complete(message[2]);
      case _errorTag:
        _pending.remove(message[1])?.completeError(
              AnalyzerTokenizeError(message: message[2] as String),
            );
      case _exitTag:
        final generation = message.length > 1 ? message[1] as int? : null;
        _onIsolateExited(generation);
    }
  }

  /// 让全部在途请求失败, 避免 isolate 退出后请求永久悬挂。
  void _failPending(AnalyzerFailure failure) {
    final pending = List.of(_pending.values);
    _pending.clear();
    for (final completer in pending) {
      completer.completeError(failure);
    }
    final handshake = _handshake;
    if (handshake != null && !handshake.isCompleted) {
      handshake.completeError(failure);
    }
  }

  /// 分词 isolate 退出: 使全部在途请求失败并复位状态,
  /// 下次 [warmUp] 会重新 spawn。
  ///
  /// [generation] 非空时只处理当前 isolate 的退出通知, 避免旧 isolate
  /// 在重建过程中迟到, 把新 isolate 的状态一并清掉。
  void _onIsolateExited([int? generation]) {
    if (generation != null && generation != _generation) return;
    _failPending(const AnalyzerIsolateExited());
    _reset();
  }

  /// 失败后重建 isolate; 只由可重试错误调用。
  Future<void> _recover() async {
    final isolate = _isolate;
    _isolate = null;
    _failPending(const AnalyzerIsolateExited());
    isolate?.kill(priority: Isolate.immediate);
    _reset();
    await warmUp();
  }

  void _reset() {
    _generation++;
    _tokenizerPort = null;
    _isolate = null;
    _handshake = null;
    _port?.close();
    _port = null;
    _initializing = null;
  }

  /// 终止分词 isolate 并释放资源。
  ///
  /// 常驻 isolate 会让 `dart run` 这类脚本在 main 返回后仍等待其退出,
  /// 纯 Dart 脚本调用方结束后应显式调用; 应用进程本身常驻, 无需调用。
  void close() {
    final isolate = _isolate;
    _isolate = null;
    _failPending(const AnalyzerIsolateExited('closed'));
    isolate?.kill(priority: Isolate.immediate);
    _reset();
  }

  /// 仅供测试环境模拟分词 isolate 异常崩溃与退出。
  void simulateCrashForTesting() {
    final generation = _generation;
    _isolate?.kill(priority: Isolate.immediate);
    _onIsolateExited(generation);
  }

  /// 仅供测试环境模拟 isolate 收到消息后不再回信 (阻塞其事件循环)。
  void simulateHangForTesting() {
    _tokenizerPort?.send(const [_hangTag, -1]);
  }

  /// 分析一段日语文本, 返回逐词的「汉字 / 平假名 / 罗马音」对应结果。
  ///
  /// 若输入恰好是**单个汉字**, 结果中会附带该字的音读/训读详情
  /// ([AnalysisResult.singleKanji])。
  ///
  /// 若提供了 [isCancelled], 在分词前与分词后会检查该判定条件;
  /// 若已被取消, 则提早返回空结果, 避免后续对象构造与无谓计算。
  /// 若遇 isolate 意外退出且未被取消, 自动重启并重试一次。
  @override
  Future<AnalysisResult> analyze(
    String text, {
    bool Function()? isCancelled,
    Duration timeout = kDefaultAnalysisTimeout,
  }) async {
    final converted = KanjiConverter.toJapaneseKanji(text);
    final cleaned = InputSanitizer.clean(converted, maxLength: kMaxInputLength);
    final rawTrimmed = converted.trim();
    if (cleaned.isEmpty) {
      return AnalysisResult(source: converted, morphemes: const []);
    }

    final bool isTruncated = rawTrimmed.characters.length > kMaxInputLength;
    final trimmed = cleaned;

    try {
      return await _analyzeInternal(
        trimmed,
        isTruncated,
        isCancelled,
        timeout,
      );
    } on AnalyzerFailure catch (failure, stackTrace) {
      DiagnosticsLog.instance.record(
        'analyzer',
        failure,
        stackTrace: stackTrace,
      );
      if (failure.retryable && !(isCancelled?.call() ?? false)) {
        await _recover();
        return await _analyzeInternal(
          trimmed,
          isTruncated,
          isCancelled,
          timeout,
        );
      }
      rethrow;
    }
  }

  Future<AnalysisResult> _analyzeInternal(
    String trimmed,
    bool isTruncated,
    bool Function()? isCancelled,
    Duration timeout,
  ) async {
    await warmUp();
    if (isCancelled?.call() ?? false) {
      return AnalysisResult(source: trimmed, morphemes: const []);
    }

    final rawLines = trimmed.split(_lineSplitRegex);
    final validLines = rawLines.map((l) => l.trim()).where((l) => l.isNotEmpty).toList();

    if (validLines.length > 1) {
      final batchTokens = await _sendBatch(validLines, timeout: timeout);
      if (isCancelled?.call() ?? false) {
        return AnalysisResult(source: trimmed, morphemes: const []);
      }

      final paragraphs = <List<Morpheme>>[];
      for (final lineTokens in batchTokens) {
        final ms = lineTokens
            .map(Morpheme.fromToken)
            .where((m) => m.surface.trim().isNotEmpty)
            .toList(growable: false);
        if (ms.isNotEmpty) {
          paragraphs.add(ms);
        }
      }
      final allMorphemes =
          paragraphs.expand((p) => p).toList(growable: false);
      return AnalysisResult(
        source: trimmed,
        morphemes: allMorphemes,
        paragraphs: paragraphs,
        singleKanji: _lookupSingleKanji(trimmed),
        isTruncated: isTruncated,
      );
    }

    final tokens = await _send(
      (id) => [_tokenizeTag, id, trimmed],
      timeout: timeout,
    );
    if (isCancelled?.call() ?? false) {
      return AnalysisResult(source: trimmed, morphemes: const []);
    }

    final morphemes = tokens
        .map(Morpheme.fromToken)
        // 过滤掉空白与纯空白 token。
        .where((m) => m.surface.trim().isNotEmpty)
        .toList(growable: false);

    return AnalysisResult(
      source: trimmed,
      morphemes: morphemes,
      paragraphs: morphemes.isNotEmpty ? [morphemes] : const [],
      singleKanji: _lookupSingleKanji(trimmed),
      isTruncated: isTruncated,
    );
  }

  /// 批量分析一组独立的日语文本 (如生词本批量导出场景)。
  ///
  /// 利用常驻 isolate 的批量分词能力一次性处理全部文本,
  /// 避免大量逐条请求造成的串行 IPC 往返开销。
  @override
  Future<List<AnalysisResult>> analyzeBatch(
    List<String> texts, {
    bool Function()? isCancelled,
    Duration timeout = kDefaultAnalysisTimeout,
  }) async {
    if (texts.isEmpty) return const [];
    try {
      return await _analyzeBatchInternal(texts, isCancelled, timeout);
    } on AnalyzerFailure catch (failure, stackTrace) {
      DiagnosticsLog.instance.record(
        'analyzer-batch',
        failure,
        stackTrace: stackTrace,
      );
      if (failure.retryable && !(isCancelled?.call() ?? false)) {
        await _recover();
        return await _analyzeBatchInternal(texts, isCancelled, timeout);
      }
      rethrow;
    }
  }

  Future<List<AnalysisResult>> _analyzeBatchInternal(
    List<String> texts,
    bool Function()? isCancelled,
    Duration timeout,
  ) async {
    await warmUp();
    if (isCancelled?.call() ?? false) return const [];

    final prepared = texts.map((text) {
      final converted = KanjiConverter.toJapaneseKanji(text);
      final cleaned =
          InputSanitizer.clean(converted, maxLength: kMaxInputLength);
      final rawTrimmed = converted.trim();
      return (
        converted: converted,
        cleaned: cleaned,
        isTruncated: rawTrimmed.characters.length > kMaxInputLength,
      );
    }).toList(growable: false);

    final nonEmptyIndices = <int>[];
    final nonEmptyLines = <String>[];
    for (var i = 0; i < prepared.length; i++) {
      if (prepared[i].cleaned.isNotEmpty) {
        nonEmptyIndices.add(i);
        nonEmptyLines.add(prepared[i].cleaned);
      }
    }

    final batchTokens = nonEmptyLines.isNotEmpty
        ? await _sendBatch(nonEmptyLines, timeout: timeout)
        : const <List<Map<String, dynamic>>>[];

    if (isCancelled?.call() ?? false) return const [];

    final results = List<AnalysisResult?>.filled(prepared.length, null);
    for (var j = 0; j < nonEmptyIndices.length; j++) {
      final i = nonEmptyIndices[j];
      final item = prepared[i];
      final tokens = batchTokens[j];
      final morphemes = tokens
          .map(Morpheme.fromToken)
          .where((m) => m.surface.trim().isNotEmpty)
          .toList(growable: false);
      results[i] = AnalysisResult(
        source: item.cleaned,
        morphemes: morphemes,
        paragraphs: morphemes.isNotEmpty ? [morphemes] : const [],
        singleKanji: _lookupSingleKanji(item.cleaned),
        isTruncated: item.isTruncated,
      );
    }

    for (var i = 0; i < prepared.length; i++) {
      results[i] ??= AnalysisResult(
        source: prepared[i].converted,
        morphemes: const [],
      );
    }

    return results.cast<AnalysisResult>();
  }

  /// 若 [text] 恰好是单个汉字, 返回其音读/训读详情。
  ///
  /// 判定条件: 长度为 1 个字符(按 rune 计), 且该字符是汉字。
  /// 字典中查不到时返回 null(仍走普通对照流程)。
  KanjiReading? _lookupSingleKanji(String text) {
    final runes = text.runes.toList();
    if (runes.length != 1) return null;

    final rawChar = String.fromCharCode(runes.first);
    final char = KanjiConverter.toJapaneseKanji(rawChar);
    if (!isKanji(char)) return null;

    return kanjiReadingDict[char];
  }
}

/// 分词 isolate 入口: 握手后逐条处理请求, 词典首次使用时构建并常驻。
Future<void> _tokenizerMain(SendPort mainPort) async {
  final port = ReceivePort();
  mainPort.send(port.sendPort);
  Tokenizer? tokenizer;
  await for (final message in port) {
    final request = message as List<Object?>;
    final id = request[1] as int;
    try {
      switch (request[0]) {
        case _buildTag:
          tokenizer ??= await TokenizerBuilder().build();
          mainPort.send([_resultTag, id, const <Map<String, dynamic>>[]]);
        case _tokenizeTag:
          tokenizer ??= await TokenizerBuilder().build();
          mainPort.send(
            [_resultTag, id, _tokenizeSafe(tokenizer, request[2] as String)],
          );
        case _tokenizeBatchTag:
          tokenizer ??= await TokenizerBuilder().build();
          final lines = (request[2] as List).cast<String>();
          final batch = lines.map((l) => _tokenizeSafe(tokenizer!, l)).toList();
          mainPort.send([_resultTag, id, batch]);
        case _hangTag:
          // 测试钩子: 永久阻塞 isolate 事件循环, 模拟无回信。
          await Completer<void>().future;
      }
    } catch (e) {
      mainPort.send([_errorTag, id, e.toString()]);
    }
  }
}

/// 安全调用 kuromoji 分词并保留日文句读标点。
///
/// kuromoji 内部通过 `split(RegExp(r'[、。]'))` 切分句子; 若文本以标点结尾、
/// 或包含连续标点与空白, 会产生空字符串片段传入其 ViterbiLattice,
/// 触发其 EOS 节点指向自身的死循环并耗尽内存崩溃。
/// 因此预先按标点与换行提取非空文本片段调用 kuromoji,
/// 并将提取到的句读标点 (、与。) 转换为标准记号 Token, 按原顺序插回 Token 列表。
List<Map<String, dynamic>> _tokenizeSafe(Tokenizer tokenizer, String text) {
  if (text.isEmpty) return const [];
  final allTokens = <Map<String, dynamic>>[];
  final matches = _tokenSplitRegex.allMatches(text);
  for (final m in matches) {
    final segment = m.group(0)!;
    if (segment.startsWith('、') || segment.startsWith('。')) {
      for (final rune in segment.runes) {
        final char = String.fromCharCode(rune);
        final isKuten = char == '。';
        allTokens.add({
          'surface_form': char,
          'pos': '記号',
          'pos_detail_1': isKuten ? '句点' : '読点',
          'reading': char,
          'pronunciation': char,
          'basic_form': char,
        });
      }
    } else {
      final trimmed = segment.trim();
      if (trimmed.isNotEmpty) {
        allTokens.addAll(tokenizer.tokenize(trimmed));
      }
    }
  }
  return allTokens;
}

