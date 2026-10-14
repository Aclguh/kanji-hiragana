import 'package:flutter/material.dart';

import '../../core/kanji_reading_dict.dart';
import '../../core/strings.dart';
import '../../theme.dart';

/// 同音汉字推荐分组。
class HomophonesGroup extends StatelessWidget {
  final List<KanjiReading> homophones;
  final ValueChanged<String>? onWordTap;

  const HomophonesGroup({
    super.key,
    required this.homophones,
    this.onWordTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    const color = Color(0xFF369B78);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 16,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                s.homophoneHeading,
                style: const TextStyle(
                  color: color,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  s.homophoneHint,
                  style: TextStyle(
                    color: colors.textSecondary.withValues(alpha: 0.8),
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  s.homophoneBadge(homophones.length),
                  style: const TextStyle(color: color, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: homophones.map((k) {
              final meaning = s.language == AppLanguage.en && k.meaningsEn.isNotEmpty
                  ? k.meaningsEn.first
                  : (k.meanings.isNotEmpty ? k.meanings.first : '');
              return InkWell(
                onTap: onWordTap != null ? () => onWordTap!(k.kanji) : null,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colors.border),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        k.kanji,
                        style: TextStyle(
                          color: colors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (meaning.isNotEmpty) ...[
                        const SizedBox(width: 6),
                        Text(
                          meaning,
                          style: TextStyle(
                            color: colors.textSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
