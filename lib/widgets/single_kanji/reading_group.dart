import 'package:flutter/material.dart';

import '../../core/kana_romaji.dart';


import '../../theme.dart';
import '../feedback.dart';
import 'collapse_footer.dart';
import 'package:kanji_hiragana/widgets/app_scopes.dart';

final _parenPattern = RegExp(r'[()]');

/// 一组读音(音读或训读)。
class ReadingGroup extends StatefulWidget {
  final String label;
  final String sublabel;
  final String badge;
  final Color color;
  final List<String> readings;
  final int maxItems;

  const ReadingGroup({
    super.key,
    required this.label,
    required this.sublabel,
    required this.badge,
    required this.color,
    required this.readings,
    required this.maxItems,
  });

  @override
  State<ReadingGroup> createState() => _ReadingGroupState();
}

class _ReadingGroupState extends State<ReadingGroup> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    final overflows = widget.readings.length > widget.maxItems;
    final visible = (_expanded || !overflows)
        ? widget.readings
        : widget.readings.take(widget.maxItems).toList();
    final hidden = widget.readings.length - visible.length;

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
                  color: widget.color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.sublabel,
                style: TextStyle(color: colors.textSecondary, fontSize: 11),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.volume_up_rounded, size: 16),
                color: widget.color,
                tooltip: s.speak,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                onPressed: () {
                  final list = widget.readings
                      .map((r) => r.replaceAll(_parenPattern, ''))
                      .join('、');
                  speakWithFeedback(context, list);
                },
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  widget.badge,
                  style: TextStyle(color: widget.color, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 读音列表: 每个读音显示平假名 + 罗马音
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: visible
                .map((r) => _ReadingChip(reading: r, color: widget.color))
                .toList(),
          ),
          if (overflows) ...[
            const SizedBox(height: 10),
            CollapseFooter(
              expanded: _expanded,
              hidden: hidden,
              color: widget.color,
              onToggle: () => setState(() => _expanded = !_expanded),
            ),
          ],
        ],
      ),
    );
  }
}

/// 单个读音条目: 平假名 + 罗马音。
class _ReadingChip extends StatelessWidget {
  final String reading;
  final Color color;

  const _ReadingChip({required this.reading, required this.color});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    final pure = reading.replaceAll(_parenPattern, '');
    final romaji = hiraganaToRomaji(pure);

    return InkWell(
      onTap: () {
        speakWithFeedback(context, pure);
        copyWithToast(context, reading, s.copiedSurface(reading));
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        decoration: BoxDecoration(
          color: colors.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colors.border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              reading,
              style: TextStyle(
                color: color,
                fontSize: 17,
                fontWeight: FontWeight.w600,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              romaji,
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 11,
                fontStyle: FontStyle.italic,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
