import 'kana_romaji.dart';
import 'kanji_reading_dict.dart';
import 'loanwords_dict.dart';

/// 一个分词结果, 承载「汉字 / 平假名 / 罗马音」的对应关系。
///
/// 采用**双轨读音**策略:
/// - [hiragana] 与 [romaji] 来自 reading(读音), 是规范的假名拼写,
///   例如「東京」=> とうきょう / toukyou。
/// - [pronunciationHiragana] 来自 pronunciation(发音), 反映实际口语,
///   长音以「ー」速记, 例如「東京」=> とーきょー; 助词「は」=> わ。
///
/// 这样标注既符合日语学习规范, 又能展示真实发音差异。
class Morpheme {
  /// 原词(表層形), 如「日本」。
  final String surface;

  /// 词性, 如「名詞」「助詞」。
  final String partOfSpeech;

  /// 词性细分, 如「一般」「固有名詞」「自立」, 无细分时为空字符串。
  final String partOfSpeechDetail;

  /// 读音(片假名), 来自 kuromoji 的 reading, 如「トウキョウ」。
  final String readingKatakana;

  /// 发音(片假名), 来自 kuromoji 的 pronunciation, 如「トーキョー」。
  final String pronunciationKatakana;

  /// 规范平假名(由 reading 转换), 如「とうきょう」。
  final String hiragana;

  /// 罗马音(由 [hiragana] 转换), 如「toukyou」。
  final String romaji;

  /// 发音平假名(由 pronunciation 转换), 如「とーきょー」。
  final String pronunciationHiragana;

  /// 是否为原词含汉字的词(用于高亮真正的「汉字词」)。
  final bool containsKanji;

  /// 基本形/原形(辞書形), 来自 kuromoji 的 basic_form, 如「食べる」。
  /// 若无活用或未知词时回退为 [surface]。
  final String basicForm;

  const Morpheme({
    required this.surface,
    required this.partOfSpeech,
    this.partOfSpeechDetail = '',
    required this.readingKatakana,
    required this.pronunciationKatakana,
    required this.hiragana,
    required this.romaji,
    required this.pronunciationHiragana,
    required this.containsKanji,
    this.basicForm = '',
  });

  /// 从 kuromoji 的 token map 构建。
  ///
  /// reading 与 pronunciation 各自独立回退: 缺失时依次退回对方、
  /// 再退回表層形本身, 保证任何词都有可展示的值。
  factory Morpheme.fromToken(Map<String, dynamic> token) {
    final surface = (token['surface_form'] as String?) ?? '';
    final rawReading = (token['reading'] as String?) ?? '';
    final rawPron = (token['pronunciation'] as String?) ?? '';
    final rawDetail = (token['pos_detail_1'] as String?) ?? '';
    final posDetail =
        (rawDetail.isNotEmpty && rawDetail != '*') ? rawDetail : '';

    String pick(String primary, String fallback) {
      final valid = primary.isNotEmpty && primary != '*';
      return valid ? primary : fallback;
    }

    // 各自独立回退, 最终兜底为原词。
    final readRaw = pick(rawReading, pick(rawPron, surface));
    final pronRaw = pick(rawPron, readRaw);

    // 规范平假名与罗马音取自 reading。
    final hiragana = katakanaToHiragana(readRaw);

    final rawBasic = (token['basic_form'] as String?) ?? '';
    final basicForm =
        (rawBasic.isNotEmpty && rawBasic != '*') ? rawBasic : surface;

    return Morpheme(
      surface: surface,
      partOfSpeech: (token['pos'] as String?) ?? '',
      partOfSpeechDetail: posDetail,
      readingKatakana: readRaw,
      pronunciationKatakana: pronRaw,
      hiragana: hiragana,
      romaji: hiraganaToRomaji(hiragana),
      pronunciationHiragana: katakanaToHiragana(pronRaw),
      containsKanji: surface.runes.any((r) => isKanji(String.fromCharCode(r))),
      basicForm: basicForm,
    );
  }

  /// 是否发生活用(原形与原词不一致, 如「食べ」的原形是「食べる」)。
  bool get isConjugated => basicForm.isNotEmpty && basicForm != surface;

  /// 该词的读音是否与原词一致(即无需注音, 如纯假名词)。
  bool get needsAnnotation => surface != hiragana;

  /// 规范读音与实际发音是否存在差异。
  ///
  /// 两种常见情形:
  /// - 长音速记: とうきょう vs とーきょー
  /// - 助词音变: は(ハ) vs わ(ワ)、を(ヲ) vs お(オ)
  bool get hasPronunciationShift => readingKatakana != pronunciationKatakana;

  /// 是否是助词音变(而非单纯长音速记), 用于界面上的特别提示。
  bool get isParticleShift =>
      hasPronunciationShift &&
      (surface == 'は' || surface == 'へ' || surface == 'を');

  /// 片假名外来语词源信息 (若为词典收录的外来词)。
  LoanwordInfo? get loanword => lookupLoanword(surface);
}

/// 一次完整解析的结果。
class AnalysisResult {
  /// 原始输入文本。
  final String source;

  /// 逐词分析结果 (扁平化全列表)。
  final List<Morpheme> morphemes;

  /// 按段落分组的分词列表。单行输入时包含 1 个段落。
  final List<List<Morpheme>> paragraphs;

  /// 若输入恰好是单个汉字, 这里是该字的音读/训读详情; 否则为 null。
  final KanjiReading? singleKanji;

  const AnalysisResult({
    required this.source,
    required this.morphemes,
    this.paragraphs = const [],
    this.singleKanji,
  });

  /// 全文平假名(规范拼写), 多段落时以换行连接。
  String get fullHiragana => paragraphs.isNotEmpty
      ? paragraphs.map((p) => p.map((m) => m.hiragana).join()).join('\n')
      : morphemes.map((m) => m.hiragana).join();

  /// 全文罗马音, 词间以空格分隔, 多段落时以换行连接。
  String get fullRomaji => paragraphs.isNotEmpty
      ? paragraphs.map((p) => p.map((m) => m.romaji).join(' ')).join('\n')
      : morphemes.map((m) => m.romaji).join(' ');

  /// 全文发音平假名。仅在存在发音差异时与 [fullHiragana] 不同。
  String get fullPronunciation => paragraphs.isNotEmpty
      ? paragraphs
          .map((p) => p.map((m) => m.pronunciationHiragana).join())
          .join('\n')
      : morphemes.map((m) => m.pronunciationHiragana).join();

  /// 导出为 HTML Ruby 标注文本 (如 `<ruby>日本語<rt>にほんご</rt></ruby>`), 多段落时以换行连接。
  String get toHtmlRuby => paragraphs.isNotEmpty
      ? paragraphs.map((p) => p.map((m) {
            if (m.needsAnnotation) {
              return '<ruby>${m.surface}<rt>${m.hiragana}</rt></ruby>';
            }
            return m.surface;
          }).join()).join('\n')
      : morphemes.map((m) {
          if (m.needsAnnotation) {
            return '<ruby>${m.surface}<rt>${m.hiragana}</rt></ruby>';
          }
          return m.surface;
        }).join();

  /// 导出为括号注音文本 (如 `日本語(にほんご)`), 多段落时以换行连接。
  String get toBracketAnnotation => paragraphs.isNotEmpty
      ? paragraphs.map((p) => p.map((m) {
            if (m.needsAnnotation) {
              return '${m.surface}(${m.hiragana})';
            }
            return m.surface;
          }).join()).join('\n')
      : morphemes.map((m) {
          if (m.needsAnnotation) {
            return '${m.surface}(${m.hiragana})';
          }
          return m.surface;
        }).join();

  /// 导出为 Anki 牌组格式 (制表符分隔 TSV: 正面 \t 背面/假名 \t 罗马音 \t 词性/释义 \t 备注)。
  String get toAnkiTsv {
    if (isSingleKanji) {
      final k = singleKanji!;
      final readings = [
        if (k.onyomi.isNotEmpty) '音: ${k.onyomi.join("、")}',
        if (k.kunyomi.isNotEmpty) '训: ${k.kunyomi.join("、")}',
      ].join(' / ');
      final meanings = k.meanings.join('；');
      final note = '笔画: ${k.strokes} | 频率: ${k.frequencyRank}';
      return '${k.kanji}\t$readings\t\t$meanings\t$note';
    }

    final buffer = StringBuffer();
    // 首先输出整句为一张卡片
    buffer.writeln('$source\t$fullHiragana\t$fullRomaji\t完整句\t');

    // 随后输出句子中含汉字或有注音的词汇卡片 (去重)
    final seen = <String>{};
    for (final m in morphemes) {
      if ((m.containsKanji || m.needsAnnotation) && seen.add(m.surface)) {
        final pos = m.partOfSpeechDetail.isNotEmpty
            ? '${m.partOfSpeech}/${m.partOfSpeechDetail}'
            : m.partOfSpeech;
        final note = m.isConjugated ? '原形: ${m.basicForm}' : '';
        buffer.writeln('${m.surface}\t${m.hiragana}\t${m.romaji}\t$pos\t$note');
      }
    }
    return buffer.toString().trimRight();
  }

  /// 是否存在任何发音差异。
  bool get hasAnyPronunciationShift =>
      morphemes.any((m) => m.hasPronunciationShift);

  bool get isEmpty => morphemes.isEmpty;

  /// 是否处于「单汉字详解」模式。
  bool get isSingleKanji => singleKanji != null;
}
