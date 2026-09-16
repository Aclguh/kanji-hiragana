import 'kanji_reading_dict.dart';

/// 字典中表示「无使用频率排名」的哨兵值。
///
/// KANJIDIC2 未收录报纸频率的汉字在生成时统一写成该值
/// (见 `tool/gen_kanji_dict.py`)。一旦设置了频率范围的任一端,
/// 这类汉字即视为不满足条件 —— 否则它们会以「排名 99999」的身份
/// 混进 `1~1000` 之类的结果里。
const int kNoFrequencyRank = 99999;

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
      reading == ReadingRequirement.any;

  /// 生效的条件数量 (用于在界面上提示)。
  int get activeCount {
    var n = 0;
    if (gradeMin != null || gradeMax != null) n++;
    if (strokesMin != null || strokesMax != null) n++;
    if (frequencyMin != null || frequencyMax != null) n++;
    if (reading != ReadingRequirement.any) n++;
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
    KanjiSort? sort,
    bool clearGrade = false,
    bool clearStrokes = false,
    bool clearFrequency = false,
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
      sort: sort ?? this.sort,
    );
  }

  /// 判断某个汉字是否满足条件。
  bool matches(KanjiReading r) {
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
    return true;
  }

  /// 应用筛选与排序。
  List<KanjiReading> apply(Iterable<KanjiReading> source) {
    final out = source.where(matches).toList();
    out.sort(switch (sort) {
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
    });
    return out;
  }
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
