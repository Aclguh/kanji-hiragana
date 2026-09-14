import 'package:kuromoji/kuromoji.dart';

import 'kana_romaji.dart';
import 'kanji_reading_dict.dart';
import 'morpheme.dart';

// kuromoji 未从公共入口导出 Tokenizer 类型, 因此这里显式引入其实现库。
// ignore: implementation_imports
import 'package:kuromoji/src/tokenizer.dart';

/// 日语形态素分析服务。
///
/// 内部持有 kuromoji 的 [Tokenizer]。词典数据随包编译进应用,
/// 因此 **完全离线**, 无需网络请求。
///
/// 初始化耗时约 400ms(仅一次), 建议在应用启动时调用 [warmUp]。
class JapaneseAnalyzer {
  JapaneseAnalyzer._();

  static final JapaneseAnalyzer instance = JapaneseAnalyzer._();

  Tokenizer? _tokenizer;
  Future<void>? _initializing;

  /// 是否已就绪。
  bool get isReady => _tokenizer != null;

  /// 预加载词典。重复调用安全(共享同一个 Future)。
  Future<void> warmUp() {
    if (_tokenizer != null) return Future.value();
    return _initializing ??= _build();
  }

  Future<void> _build() async {
    _tokenizer = await TokenizerBuilder().build();
  }

  /// 分析一段日语文本, 返回逐词的「汉字 / 平假名 / 罗马音」对应结果。
  ///
  /// 若输入恰好是**单个汉字**, 结果中会附带该字的音读/训读详情
  /// ([AnalysisResult.singleKanji])。
  Future<AnalysisResult> analyze(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return AnalysisResult(source: text, morphemes: const []);
    }

    await warmUp();
    final tokens = _tokenizer!.tokenize(trimmed);

    final morphemes = tokens
        .map(Morpheme.fromToken)
        // 过滤掉空白与纯空白 token。
        .where((m) => m.surface.trim().isNotEmpty)
        .toList(growable: false);

    return AnalysisResult(
      source: trimmed,
      morphemes: morphemes,
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
