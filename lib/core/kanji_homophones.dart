import 'kanji_reading_dict.dart';

/// 汉字同音反向索引与推荐服务。
///
/// 从核心字典中按音读 (音読み) 与训读 (訓読み) 建立倒排索引，
/// 支持查找与指定汉字共享相同读音的同音常用汉字。
class KanjiHomophones {
  KanjiHomophones._();

  static final RegExp _parensRegex = RegExp(r'[()]');

  /// 预热同音字倒排索引，促使静态表在后台提前加载与排序完成。
  static void warmUp() {
    _onyomiIndex;
    _kunyomiIndex;
  }

  /// 音读倒排索引 (平假名 -> 汉字列表，按使用频率升序排序)。
  static final Map<String, List<KanjiReading>> _onyomiIndex = () {
    final map = <String, List<KanjiReading>>{};
    for (final r in kanjiReadingDict.values) {
      for (final on in r.onyomi) {
        (map[on] ??= []).add(r);
      }
    }
    for (final list in map.values) {
      list.sort((a, b) => a.frequencyRank.compareTo(b.frequencyRank));
    }
    return map;
  }();

  /// 训读倒排索引 (剥离送假名后的假名主体 -> 汉字列表，按使用频率升序排序)。
  static final Map<String, List<KanjiReading>> _kunyomiIndex = () {
    final map = <String, List<KanjiReading>>{};
    for (final r in kanjiReadingDict.values) {
      for (final kun in r.kunyomi) {
        final stripped = kun.replaceAll(_parensRegex, '');
        if (stripped.isNotEmpty) {
          (map[stripped] ??= []).add(r);
        }
      }
    }
    for (final list in map.values) {
      list.sort((a, b) => a.frequencyRank.compareTo(b.frequencyRank));
    }
    return map;
  }();

  /// 获取指定音读平假名的全部同音汉字 (按常用度排序)。
  static List<KanjiReading> getByOnyomi(String reading) {
    return _onyomiIndex[reading] ?? const [];
  }

  /// 获取指定训读平假名的全部同音汉字 (剥离送假名匹配，按常用度排序)。
  static List<KanjiReading> getByKunyomi(String reading) {
    final stripped = reading.replaceAll(_parensRegex, '');
    return _kunyomiIndex[stripped] ?? const [];
  }

  /// 查找与目标汉字共享相同音读或训读的同音常用字候选列表。
  ///
  /// 结果已去重并按报纸使用频率升序排序 (越常用越靠前)，最多返回 [limit] 项。
  static List<KanjiReading> findHomophones(
    KanjiReading target, {
    int limit = 8,
  }) {
    if (!target.hasOnyomi && !target.hasKunyomi) return const [];
    final seen = <String>{target.kanji};
    final onCandidates = <KanjiReading>[];
    final kunCandidates = <KanjiReading>[];

    // 1. 匹配音读同音字
    for (final on in target.onyomi) {
      final list = _onyomiIndex[on];
      if (list != null) {
        for (final r in list) {
          if (seen.add(r.kanji)) {
            onCandidates.add(r);
          }
        }
      }
    }

    // 2. 匹配训读同音字 (如 花 / 鼻 训读均为 はな)
    for (final kun in target.kunyomi) {
      final stripped = kun.replaceAll(_parensRegex, '');
      if (stripped.isEmpty) continue;
      final list = _kunyomiIndex[stripped];
      if (list != null) {
        for (final r in list) {
          if (seen.add(r.kanji)) {
            kunCandidates.add(r);
          }
        }
      }
    }

    onCandidates.sort((a, b) => a.frequencyRank.compareTo(b.frequencyRank));
    kunCandidates.sort((a, b) => a.frequencyRank.compareTo(b.frequencyRank));

    if (onCandidates.isNotEmpty && kunCandidates.isNotEmpty) {
      final merged = <KanjiReading>[];
      final half = (limit / 2).ceil();
      merged.addAll(kunCandidates.take(half));
      merged.addAll(onCandidates.take(limit - merged.length));
      merged.sort((a, b) => a.frequencyRank.compareTo(b.frequencyRank));
      return merged;
    }

    final all = [...onCandidates, ...kunCandidates];
    all.sort((a, b) => a.frequencyRank.compareTo(b.frequencyRank));
    return all.take(limit).toList(growable: false);
  }
}
