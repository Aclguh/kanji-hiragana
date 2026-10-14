import 'package:flutter/material.dart';

import '../../core/strings.dart';
import '../../theme.dart';

/// 视图模式。
enum ViewMode {
  /// 逐词三列对照表。
  alignment,

  /// 振假名注音排版。
  furigana,

  /// 和风传统竖排排版。
  vertical;

  /// 按持久化名称解析枚举，缺省或未知名称回退为 [ViewMode.alignment]。
  static ViewMode fromName(String? name) => switch (name) {
        'vertical' => ViewMode.vertical,
        'furigana' => ViewMode.furigana,
        _ => ViewMode.alignment,
      };
}

/// 展开态工具栏: 对照 / 振假名 / 纵书 视图切换 + 罗马音开关 + 导出。
class HomeToolbar extends StatelessWidget {
  final ViewMode viewMode;
  final bool showRomaji;
  final ValueChanged<ViewMode> onSelectMode;
  final ValueChanged<bool> onRomajiChanged;
  final VoidCallback onExport;

  const HomeToolbar({
    super.key,
    required this.viewMode,
    required this.showRomaji,
    required this.onSelectMode,
    required this.onRomajiChanged,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _segment(
                  context,
                  s.viewAlignment,
                  ViewMode.alignment,
                  Icons.table_rows_rounded,
                ),
                _segment(
                  context,
                  s.viewFurigana,
                  ViewMode.furigana,
                  Icons.text_fields_rounded,
                ),
                _segment(
                  context,
                  s.viewVertical,
                  ViewMode.vertical,
                  Icons.view_week_outlined,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: s.export,
                iconSize: 20,
                visualDensity: VisualDensity.compact,
                onPressed: onExport,
                icon: Icon(
                  Icons.share_outlined,
                  size: 20,
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(width: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    s.romajiToggle,
                    style: TextStyle(
                      color: showRomaji ? colors.textPrimary : colors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Switch(
                    value: showRomaji,
                    onChanged: onRomajiChanged,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _segment(
    BuildContext context,
    String label,
    ViewMode mode,
    IconData icon,
  ) {
    final colors = AppTheme.of(context);
    final selected = viewMode == mode;
    return MergeSemantics(
      child: Semantics(
        button: true,
        selected: selected,
        onTap: () => onSelectMode(mode),
        child: GestureDetector(
          onTap: () => onSelectMode(mode),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(
              color: selected ? AppTheme.accent : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 14,
                  color: selected ? Colors.white : colors.textSecondary,
                ),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(
                    color: selected ? Colors.white : colors.textSecondary,
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
