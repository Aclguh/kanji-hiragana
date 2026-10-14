import 'package:flutter/material.dart';

import '../../core/strings.dart';
import '../../core/yojijukugo_dict.dart';
import '../../theme.dart';
import '../feedback.dart';

/// 四字熟语推荐分组。
class YojijukugoGroup extends StatelessWidget {
  final List<YojijukugoEntry> entries;
  final ValueChanged<String>? onWordTap;

  const YojijukugoGroup({
    super.key,
    required this.entries,
    this.onWordTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    const color = Color(0xFFC05621); // 暖赭色 / 和风柿色

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
                s.yojijukugoHeading,
                style: const TextStyle(
                  color: color,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  s.yojijukugoHint,
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
                  s.yojijukugoBadge(entries.length),
                  style: const TextStyle(color: color, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final entry in entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: onWordTap != null ? () => onWordTap!(entry.kanji) : null,
                onLongPress: () =>
                    copyWithToast(context, entry.kanji, s.copiedSurface(entry.kanji)),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colors.border),
                  ),
                  child: Row(
                    children: [
                      Text(
                        entry.kanji,
                        style: TextStyle(
                          color: colors.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        entry.reading,
                        style: const TextStyle(
                          color: AppTheme.accent,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          s.language == AppLanguage.en
                              ? entry.meaningEn
                              : entry.meaningZh,
                          style: TextStyle(
                            color: colors.textSecondary,
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
