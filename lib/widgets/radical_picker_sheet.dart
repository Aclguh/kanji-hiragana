import 'package:flutter/material.dart';

import '../core/kanji_reading_dict.dart';
import '../core/radical_dict.dart';
import '../core/strings.dart';
import '../theme.dart';

/// 康熙 214 部首检字表弹窗。
///
/// 按部首笔画数 (1..17 画) 分组展示全部 214 个部首,
/// 每个部首标注字形与词典内实际收录的汉字数量, 点按直接回传选中部首。
class RadicalPickerSheet extends StatelessWidget {
  final int? selectedRadical;
  final ValueChanged<int> onSelect;

  const RadicalPickerSheet({
    super.key,
    required this.selectedRadical,
    required this.onSelect,
  });

  static Future<int?> show(BuildContext context, {int? selectedRadical}) {
    return showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, scrollController) => RadicalPickerSheet(
          selectedRadical: selectedRadical,
          onSelect: (r) => Navigator.of(ctx).pop(r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);

    final sortedStrokes = kRadicalsGroupedByStrokes.keys.toList()..sort();

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        children: [
          // 顶部拖拽柄与标题栏
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 6),
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: colors.textSecondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.radicalPickerTitle,
                        style: TextStyle(
                          color: colors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        s.radicalPickerSubtitle,
                        style: TextStyle(
                          color: colors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  color: colors.textSecondary,
                  tooltip: s.close,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // 部首网格区
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              itemCount: sortedStrokes.length,
              itemBuilder: (context, index) {
                final stroke = sortedStrokes[index];
                final radicals = kRadicalsGroupedByStrokes[stroke] ?? const [];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          s.radicalStrokesGroup(stroke),
                          style: const TextStyle(
                            color: AppTheme.accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final r in radicals)
                            _buildRadicalItem(context, colors, r),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadicalItem(BuildContext context, AppColors colors, int radicalNumber) {
    final char = kKangxiRadicals[radicalNumber - 1];
    final count = kRadicalKanjiCounts[radicalNumber] ?? 0;
    final isSelected = selectedRadical == radicalNumber;

    return Semantics(
      label: '$char, $count',
      button: true,
      selected: isSelected,
      child: InkWell(
        onTap: () => onSelect(radicalNumber),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.accent.withValues(alpha: 0.15)
                : colors.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppTheme.accent : colors.border,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                char,
                style: TextStyle(
                  color: isSelected ? AppTheme.accent : colors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '$count',
                style: TextStyle(
                  color: colors.textSecondary.withValues(alpha: 0.8),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
