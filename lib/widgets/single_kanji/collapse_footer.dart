import 'package:flutter/material.dart';

import 'package:kanji_hiragana/widgets/app_scopes.dart';

/// 「展开 / 收起」尾块: 折叠时显示「还有 n 个」, 已展开时显示收起。
class CollapseFooter extends StatelessWidget {
  final bool expanded;
  final int hidden;
  final Color color;
  final VoidCallback onToggle;

  const CollapseFooter({
    super.key,
    required this.expanded,
    required this.hidden,
    required this.color,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppStringsScope.of(context);
    return MergeSemantics(
      child: Semantics(
        button: true,
        expanded: expanded,
        onTap: onToggle,
        child: GestureDetector(
          onTap: onToggle,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  expanded ? s.collapse : s.collapseHidden(hidden),
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 3),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
