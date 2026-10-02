import 'dart:async';
import 'dart:isolate';

import 'package:kuromoji/kuromoji.dart';

import 'kana_romaji.dart';
import 'kanji_reading_dict.dart';
import 'morpheme.dart';

// kuromoji 未从公共入口导出 Tokenizer 类型, 因此这里显式引入其实现库。
// ignore: implementation_imports
import 'package:kuromoji/src/tokenizer.dart';

/// isolate 消息标签 (主 -> 分词 isolate)。
const _buildTag = 'build';
const _tokenizeTag = 'tokenize';

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
class JapaneseAnalyzer {
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
  final _pending = <int, Completer<List<Map<String, dynamic>>>>{};

  int _nextId = 0;

  /// 是否已就绪 (与分词 isolate 握手完成且词典构建成功)。
  bool get isReady => _tokenizerPort != null;

  /// 预加载词典。重复调用安全(共享同一个 Future)。
  Future<void> warmUp() {
    if (isReady) return Future.value();
    return _initializing ??= _start();
  }

  Future<void> _start() async {
    final port = _port = ReceivePort();
    final handshake = _handshake = Completer<SendPort>();
    port.listen(_onMessage);
    try {
      final isolate = _isolate =
          await Isolate.spawn(_tokenizerMain, port.sendPort);
      isolate.addOnExitListener(port.sendPort, response: const [_exitTag]);
      await handshake.future;
      // 触发词典构建, warmUp 的语义与直接在主 isolate 构建时一致。
      await _send((id) => [_buildTag, id]);
    } catch (e) {
      _reset();
      rethrow;
    }
  }

  /// 发送一条请求并等待回信; [makeMessage] 用分配的请求 id 构造消息。
  Future<List<Map<String, dynamic>>> _send(
    List<Object> Function(int id) makeMessage,
  ) async {
    final port = _tokenizerPort;
    if (port == null) {
      throw StateError('analyzer is not ready');
    }
    final id = _nextId++;
    final completer = Completer<List<Map<String, dynamic>>>();
    _pending[id] = completer;
    port.send(makeMessage(id));
    try {
      return await completer.future;
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
        final tokens =
            (message[2] as List).cast<Map<String, dynamic>>();
        _pending.remove(message[1])?.complete(tokens);
      case _errorTag:
        _pending.remove(message[1])
            ?.completeError(Exception(message[2] as String));
      case _exitTag:
        _onIsolateExited();
    }
  }

  /// 分词 isolate 退出: 使全部在途请求失败并复位状态,
  /// 下次 [warmUp] 会重新 spawn。
  void _onIsolateExited() {
    final pending = List.of(_pending.values);
    _pending.clear();
    for (final completer in pending) {
      completer.completeError(Exception('tokenizer isolate exited'));
    }
    final handshake = _handshake;
    if (handshake != null && !handshake.isCompleted) {
      handshake.completeError(Exception('tokenizer isolate exited'));
    }
    _reset();
  }

  void _reset() {
    _tokenizerPort = null;
    _port?.close();
    _port = null;
    _initializing = null;
  }

  /// 终止分词 isolate 并释放资源。
  ///
  /// 常驻 isolate 会让 `dart run` 这类脚本在 main 返回后仍等待其退出,
  /// 纯 Dart 脚本调用方结束后应显式调用; 应用进程本身常驻, 无需调用。
  void close() {
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    _reset();
  }

  /// 分析一段日语文本, 返回逐词的「汉字 / 平假名 / 罗马音」对应结果。
  ///
  /// 若输入恰好是**单个汉字**, 结果中会附带该字的音读/训读详情
  /// ([AnalysisResult.singleKanji])。
  ///
  /// 若提供了 [isCancelled], 在分词前与分词后会检查该判定条件;
  /// 若已被取消, 则提早返回空结果, 避免后续对象构造与无谓计算。
  Future<AnalysisResult> analyze(
    String text, {
    bool Function()? isCancelled,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return AnalysisResult(source: text, morphemes: const []);
    }

    await warmUp();
    if (isCancelled?.call() ?? false) {
      return AnalysisResult(source: trimmed, morphemes: const []);
    }

    final lines = trimmed.split(RegExp(r'\r?\n'));
    if (lines.length > 1) {
      final paragraphs = <List<Morpheme>>[];
      for (final line in lines) {
        final lineTrimmed = line.trim();
        if (lineTrimmed.isEmpty) continue;
        final lineTokens =
            await _send((id) => [_tokenizeTag, id, lineTrimmed]);
        if (isCancelled?.call() ?? false) {
          return AnalysisResult(source: trimmed, morphemes: const []);
        }
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
      );
    }

    final tokens = await _send((id) => [_tokenizeTag, id, trimmed]);
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
    );
  }

  /// 若 [text] 恰好是单个汉字, 返回其音读/训读详情。
  ///
  /// 判定条件: 长度为 1 个字符(按 rune 计), 且该字符是汉字。
  /// 字典中查不到时返回 null(仍走普通对照流程)。
  KanjiReading? _lookupSingleKanji(String text) {
    final runes = text.runes.toList();
    if (runes.length != 1) return null;

    final char = String.fromCharCode(runes.first);
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
            [_resultTag, id, tokenizer.tokenize(request[2] as String)],
          );
      }
    } catch (e) {
      mainPort.send([_errorTag, id, e.toString()]);
    }
  }
}
