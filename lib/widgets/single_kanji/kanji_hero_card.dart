import 'package:flutter/material.dart';

import '../../core/kanji_filter.dart';
import '../../core/kanji_reading_dict.dart';
import '../../core/strings.dart';
import '../../theme.dart';
import '../app_scopes.dart';

/// 单汉字主卡片: 大号字形、中英释义与笔画/学年/频率/部首元信息。
class KanjiHeroCard extends StatelessWidget {
  final KanjiReading reading;

  const KanjiHeroCard({super.key, required this.reading});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    final meanings =
        s.language == AppLanguage.en && reading.meaningsEn.isNotEmpty
            ? reading.meaningsEn
            : reading.meanings;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 84,
            height: 84,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.kanjiHighlight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colors.kanjiHighlight.withValues(alpha: 0.4),
              ),
            ),
            child: Text(
              reading.kanji,
              style: TextStyle(
                color: colors.kanjiHighlight,
                fontSize: 46,
                fontWeight: FontWeight.w600,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (meanings.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: meanings
                        .map(
                          (m) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: colors.surfaceVariant,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              m,
                              style: TextStyle(
                                color: colors.textPrimary,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 14,
                  runSpacing: 4,
                  children: [
                    _metaItem(context, s.labelStrokes, '${reading.strokes}'),
                    _metaItem(
                      context,
                      s.labelGrade,
                      _gradeLabel(s, reading.grade),
                    ),
                    _metaItem(
                      context,
                      s.labelFrequency,
                      _frequencyLabel(s, reading.frequencyRank),
                    ),
                    if (reading.radical > 0)
                      _metaItem(
                        context,
                        s.labelRadical,
                        reading.radicalChar.isNotEmpty
                            ? '${reading.radicalChar} (${reading.radical})'
                            : '${reading.radical}',
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metaItem(BuildContext context, String label, String value) {
    final colors = AppTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label ',
          style: TextStyle(color: colors.textSecondary, fontSize: 11),
        ),
        Text(
          value,
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  static String _gradeLabel(AppStrings s, int grade) {
    if (grade >= 1 && grade <= 6) return s.gradeNumbered(grade);
    if (grade == 8) return s.gradeCommon;
    if (grade == 9 || grade == 10) return s.gradeNameUse;
    return s.gradeOther;
  }

  static String _frequencyLabel(AppStrings s, int rank) {
    if (rank >= kNoFrequencyRank) return s.frequencyUnranked;
    return 'No.$rank';
  }
}
