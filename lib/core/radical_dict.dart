import 'kanji_reading_dict.dart';

/// 康熙 214 部首各部首的笔画数 (部首序号 1..214 对应下标 0..213)。
const List<int> kRadicalStrokes = [
  // 1 画 (1-6)
  1, 1, 1, 1, 1, 1,
  // 2 画 (7-29)
  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  // 3 画 (30-60)
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
  // 4 画 (61-94)
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
  // 5 画 (95-117)
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
  // 6 画 (118-146)
  6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
  // 7 画 (147-166)
  7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
  // 8 画 (167-175)
  8, 8, 8, 8, 8, 8, 8, 8, 8,
  // 9 画 (176-186)
  9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
  // 10 画 (187-194)
  10, 10, 10, 10, 10, 10, 10, 10,
  // 11 画 (195-200)
  11, 11, 11, 11, 11, 11,
  // 12 画 (201-204)
  12, 12, 12, 12,
  // 13 画 (205-208)
  13, 13, 13, 13,
  // 14 画 (209-210)
  14, 14,
  // 15 画 (211)
  15,
  // 16 画 (212-213)
  16, 16,
  // 17 画 (214)
  17,
];

/// 按部首笔画数归类的部首序号列表 (笔画 1..17 -> 部首序号列表)。
final Map<int, List<int>> kRadicalsGroupedByStrokes = _buildRadicalGroups();

Map<int, List<int>> _buildRadicalGroups() {
  final map = <int, List<int>>{};
  for (var i = 0; i < kRadicalStrokes.length; i++) {
    final stroke = kRadicalStrokes[i];
    final radicalNumber = i + 1;
    (map[stroke] ??= []).add(radicalNumber);
  }
  return map;
}

/// 字典中每个部首实际收录的汉字数量缓存 (部首序号 1..214 -> 汉字数)。
final Map<int, int> kRadicalKanjiCounts = _countRadicalKanji();

Map<int, int> _countRadicalKanji() {
  final counts = <int, int>{};
  for (final reading in kanjiReadingDict.values) {
    if (reading.radical > 0 && reading.radical <= 214) {
      counts[reading.radical] = (counts[reading.radical] ?? 0) + 1;
    }
  }
  return counts;
}

/// 获取某个部首序号对应的汉字字形。
String getRadicalChar(int radicalNumber) {
  if (radicalNumber < 1 || radicalNumber > kKangxiRadicals.length) {
    return '';
  }
  return kKangxiRadicals[radicalNumber - 1];
}

/// 获取某个部首序号对应的笔画数。
int getRadicalStroke(int radicalNumber) {
  if (radicalNumber < 1 || radicalNumber > kRadicalStrokes.length) {
    return 0;
  }
  return kRadicalStrokes[radicalNumber - 1];
}
