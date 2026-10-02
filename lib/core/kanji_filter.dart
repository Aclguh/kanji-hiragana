import 'kana_romaji.dart';
import 'kanji_reading_dict.dart';

/// 字典中表示「无使用频率排名」的哨兵值。
///
/// KANJIDIC2 未收录报纸频率的汉字在生成时统一写成该值
/// (见 `tool/gen_kanji_dict.py`)。一旦设置了频率范围的任一端,
/// 这类汉字即视为不满足条件 —— 否则它们会以「排名 99999」的身份
/// 混进 `1~1000` 之类的结果里。
const int kNoFrequencyRank = 99999;

/// 字典实际覆盖的笔画数范围 (含端点), 如 `(1, 29)`。
///
/// 首次访问时从 [kanjiReadingDict] 统计一次 (O(n), 毫秒级),
/// 字典更新后自动跟随, 不依赖手工维护的硬编码。
final (int, int) kStrokeRange = _computeRange(
  (r) => r.strokes,
  exclude: (_) => false,
);

/// 字典实际覆盖的频率排名范围 (含端点), 已排除 [kNoFrequencyRank] 哨兵。
///
/// 首次访问时从 [kanjiReadingDict] 统计一次。
final (int, int) kFrequencyRange = _computeRange(
  (r) => r.frequencyRank,
  exclude: (rank) => rank <= 0 || rank >= kNoFrequencyRank,
);

(int, int) _computeRange(
  int Function(KanjiReading) pick, {
  required bool Function(int) exclude,
}) {
  var min = 0x7FFFFFFF;
  var max = 0;
  for (final r in kanjiReadingDict.values) {
    final value = pick(r);
    if (exclude(value)) continue;
    if (value < min) min = value;
    if (value > max) max = value;
  }
  return (min, max);
}

/// 排序方式。
///
/// 显示名称由 `AppStrings.sortLabel(name)` 按当前语言给出,
/// 模型层不持有任何界面文案。
enum KanjiSort {
  /// 使用频率 (报纸频率排名, 越常用越靠前)。
  frequency,

  /// 笔画数 (由少到多)。
  strokes,

  /// 学年 (由低到高)。
  grade,

  /// 读音数量 (音读 + 训读, 由多到少)。
  readingCount,
}

/// 筛选条件。
///
/// 所有字段均为「不限」时表示不加该维度限制。
class KanjiFilter {
  /// 学年范围 (含端点)。null 表示不限。
  final int? gradeMin;
  final int? gradeMax;

  /// 笔画范围 (含端点)。null 表示该端不限。
  final int? strokesMin;
  final int? strokesMax;

  /// 使用频率排名范围 (含端点, 越小越常用)。null 表示该端不限。
  final int? frequencyMin;
  final int? frequencyMax;

  /// 读音要求。
  final ReadingRequirement reading;

  /// 按读音反查: 输入平假名片段, 匹配音读或训读中含有该片段的汉字。
  ///
  /// 空字符串表示不限。匹配时训读的送假名括号 (如「まな(ぶ)」中的
  /// 括号与括号内容) 会被剥离, 只比对假名主体; 输入若为片假名会
  /// 先折叠为平假名, 再做子串匹配。
  final String readingQuery;

  /// 按含义搜索: 输入中文或英文含义关键词, 匹配释义中含有该关键词的汉字。
  ///
  /// 空字符串表示不限, 大小写不敏感。
  final String meaningQuery;

  /// 部首筛选 (康熙部首序号 1-214)。null 表示不限。
  final int? radical;

  /// 排序方式。
  final KanjiSort sort;

  const KanjiFilter({
    this.gradeMin,
    this.gradeMax,
    this.strokesMin,
    this.strokesMax,
    this.frequencyMin,
    this.frequencyMax,
    this.reading = ReadingRequirement.any,
    this.readingQuery = '',
    this.meaningQuery = '',
    this.radical,
    this.sort = KanjiSort.frequency,
  });

  /// 默认条件: 不加限制, 按使用频率排序。
  static const KanjiFilter initial = KanjiFilter();

  /// 条件是否全为「不限」。
  bool get isUnfiltered =>
      gradeMin == null &&
      gradeMax == null &&
      strokesMin == null &&
      strokesMax == null &&
      frequencyMin == null &&
      frequencyMax == null &&
      reading == ReadingRequirement.any &&
      readingQuery.isEmpty &&
      meaningQuery.isEmpty &&
      radical == null;

  /// 生效的条件数量 (用于在界面上提示)。
  int get activeCount {
    var n = 0;
    if (gradeMin != null || gradeMax != null) n++;
    if (strokesMin != null || strokesMax != null) n++;
    if (frequencyMin != null || frequencyMax != null) n++;
    if (reading != ReadingRequirement.any) n++;
    if (readingQuery.isNotEmpty) n++;
    if (meaningQuery.isNotEmpty) n++;
    if (radical != null) n++;
    return n;
  }

  KanjiFilter copyWith({
    int? gradeMin,
    int? gradeMax,
    int? strokesMin,
    int? strokesMax,
    int? frequencyMin,
    int? frequencyMax,
    ReadingRequirement? reading,
    String? readingQuery,
    String? meaningQuery,
    int? radical,
    KanjiSort? sort,
    bool clearGrade = false,
    bool clearStrokes = false,
    bool clearFrequency = false,
    bool clearReadingQuery = false,
    bool clearMeaningQuery = false,
    bool clearRadical = false,
  }) {
    return KanjiFilter(
      gradeMin: clearGrade ? null : (gradeMin ?? this.gradeMin),
      gradeMax: clearGrade ? null : (gradeMax ?? this.gradeMax),
      strokesMin: clearStrokes ? null : (strokesMin ?? this.strokesMin),
      strokesMax: clearStrokes ? null : (strokesMax ?? this.strokesMax),
      frequencyMin:
          clearFrequency ? null : (frequencyMin ?? this.frequencyMin),
      frequencyMax:
          clearFrequency ? null : (frequencyMax ?? this.frequencyMax),
      reading: reading ?? this.reading,
      readingQuery:
          clearReadingQuery ? '' : (readingQuery ?? this.readingQuery),
      meaningQuery:
          clearMeaningQuery ? '' : (meaningQuery ?? this.meaningQuery),
      radical: clearRadical ? null : (radical ?? this.radical),
      sort: sort ?? this.sort,
    );
  }

  /// 判断某个汉字是否满足条件。
  bool matches(KanjiReading r) {
    if (radical != null && r.radical != radical) return false;
    if (gradeMin != null && r.grade < gradeMin!) return false;
    // 学年 7 不存在, 但 9/10 是人名用; 用 min/max 区间表达即可。
    if (gradeMax != null && r.grade > gradeMax!) return false;

    if (strokesMin != null && r.strokes < strokesMin!) return false;
    if (strokesMax != null && r.strokes > strokesMax!) return false;

    // 频率只要设了任一端, 就要求该字确有排名。
    if (frequencyMin != null || frequencyMax != null) {
      final rank = r.frequencyRank;
      if (rank >= kNoFrequencyRank) return false;
      if (frequencyMin != null && rank < frequencyMin!) return false;
      if (frequencyMax != null && rank > frequencyMax!) return false;
    }

    switch (reading) {
      case ReadingRequirement.any:
        break;
      case ReadingRequirement.onyomiOnly:
        if (!r.hasOnyomi || r.hasKunyomi) return false;
      case ReadingRequirement.kunyomiOnly:
        if (!r.hasKunyomi || r.hasOnyomi) return false;
      case ReadingRequirement.both:
        if (!r.hasOnyomi || !r.hasKunyomi) return false;
    }

    if (readingQuery.isNotEmpty) {
      if (!_matchesReadingQuery(r, readingQuery)) return false;
    }

    if (meaningQuery.isNotEmpty) {
      if (!_matchesMeaningQuery(r, meaningQuery)) return false;
    }

    return true;
  }

  /// 针对四种排序维度的全量汉字预排只读列表 (懒加载初始化)。
  ///
  /// 全量筛选时直接在对应排序列表中执行条件过滤, 避免每次重复排序 2999 字。
  static final Map<KanjiSort, List<KanjiReading>> _presortedAll = {
    for (final s in KanjiSort.values)
      s: List<KanjiReading>.unmodifiable(
        kanjiReadingDict.values.toList()..sort(comparator(s)),
      ),
  };

  /// 获取按指定规则排好序的全量汉字只读列表。
  static List<KanjiReading> allSorted(KanjiSort sort) => _presortedAll[sort]!;

  /// 对应排序方式的比对器。
  static int Function(KanjiReading, KanjiReading) comparator(KanjiSort sort) {
    return switch (sort) {
      KanjiSort.frequency => (a, b) =>
          a.frequencyRank.compareTo(b.frequencyRank),
      KanjiSort.strokes => (a, b) {
          final c = a.strokes.compareTo(b.strokes);
          return c != 0 ? c : a.frequencyRank.compareTo(b.frequencyRank);
        },
      KanjiSort.grade => (a, b) {
          final c = a.grade.compareTo(b.grade);
          return c != 0 ? c : a.frequencyRank.compareTo(b.frequencyRank);
        },
      KanjiSort.readingCount => (a, b) {
          final ca = a.onyomi.length + a.kunyomi.length;
          final cb = b.onyomi.length + b.kunyomi.length;
          final c = cb.compareTo(ca);
          return c != 0 ? c : a.frequencyRank.compareTo(b.frequencyRank);
        },
    };
  }

  /// [source] 是否就是全量字典或其预排列表 (仅用 identical 判断)。
  ///
  /// 不做「长度等于字典且首元素相同」之类的启发式推断: 任何恰好满足
  /// 这类特征的自定义列表都会被误判为全量, apply 转而返回未按 source
  /// 收窄的结果, 静默产生错误数据。identical 比较只有 5 次, 成本可忽略。
  static bool _isDictionarySource(Iterable<KanjiReading> source) {
    if (identical(source, kanjiReadingDict.values)) return true;
    for (final list in _presortedAll.values) {
      if (identical(source, list)) return true;
    }
    return false;
  }

  /// 应用筛选与排序。
  ///
  /// 若未提供 [source] 或传入全量字典 [kanjiReadingDict.values]，
  /// 会直接在对应预排列表中执行条件过滤，避免每次重复排序。
  /// 若传入自定义数据源，则对筛选后的子集执行排序。
  List<KanjiReading> apply([Iterable<KanjiReading>? source]) {
    if (source == null || _isDictionarySource(source)) {
      return _presortedAll[sort]!.where(matches).toList();
    }
    final out = source.where(matches).toList();
    out.sort(comparator(sort));
    return out;
  }
}

/// 判断 [r] 的音读或训读中是否有包含 [query] 子串的条目。
///
/// - [query] 若含片假名会先折叠为平假名。
/// - 训读中的送假名括号 (如「まな(ぶ)」) 在比对前剥离,
///   只留假名主体参与匹配; 这样输入「まな」即可命中「学」。
bool _matchesReadingQuery(KanjiReading r, String query) {
  final q = katakanaToHiragana(query);
  for (final on in r.onyomi) {
    if (on.contains(q)) return true;
  }
  for (final kun in r.kunyomi) {
    if (_stripOkurigana(kun).contains(q)) return true;
  }
  return false;
}

/// 去掉训读里的送假名括号, 如 「まな(ぶ)」→「まなぶ」。
String _stripOkurigana(String kun) => kun.replaceAll(RegExp(r'[()]'), '');

/// 判断 [r] 的中文或英文释义是否包含 [query] 子串 (不区分大小写)。
bool _matchesMeaningQuery(KanjiReading r, String query) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return true;
  for (final m in r.meanings) {
    if (m.toLowerCase().contains(q)) return true;
  }
  for (final m in r.meaningsEn) {
    if (m.toLowerCase().contains(q)) return true;
  }
  return false;
}

/// 对读音构成的要求。
///
/// 显示名称由 `AppStrings.readingLabel(name)` 按当前语言给出。
enum ReadingRequirement {
  /// 不限。
  any,

  /// 只有音读。
  onyomiOnly,

  /// 只有训读。
  kunyomiOnly,

  /// 音读与训读都有。
  both,
}
