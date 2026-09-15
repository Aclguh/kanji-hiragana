import 'package:flutter/material.dart';

import '../core/settings.dart';
import '../theme.dart';
import 'sliding_drawer.dart';

/// 设置抽屉内容: 主题切换 / 旋转屏幕 / 关于。
class SettingsDrawerContent extends StatelessWidget {
  final VoidCallback onOpenAbout;

  const SettingsDrawerContent({super.key, required this.onOpenAbout});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsController.instance;

    return DrawerPanel(
      side: DrawerSide.right,
      title: '设置',
      subtitle: '外观与行为',
      children: [
        // 主题切换
        const DrawerSectionLabel('主题'),
        AnimatedBuilder(
          animation: settings,
          builder: (context, _) => _ThemeModeSelector(
            value: settings.themeMode,
            onChanged: settings.setThemeMode,
          ),
        ),
        const SizedBox(height: 22),

        // 旋转屏幕
        const DrawerSectionLabel('屏幕'),
        AnimatedBuilder(
          animation: settings,
          builder: (context, _) => _SwitchTile(
            title: '旋转屏幕',
            subtitle: settings.autoRotate
                ? '跟随设备重力方向自动旋转'
                : '固定为当前方向',
            value: settings.autoRotate,
            onChanged: settings.setAutoRotate,
          ),
        ),
        const SizedBox(height: 22),

        // 关于
        const DrawerSectionLabel('其他'),
        _NavTile(
          title: '关于',
          subtitle: '版本、仓库、许可与致谢',
          onTap: onOpenAbout,
        ),
      ],
    );
  }
}

/// 主题模式三选一。
class _ThemeModeSelector extends StatelessWidget {
  final AppThemeMode value;
  final ValueChanged<AppThemeMode> onChanged;

  const _ThemeModeSelector({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Column(
      children: AppThemeMode.values.map((mode) {
        final selected = mode == value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            onTap: () => onChanged(mode),
            borderRadius: BorderRadius.circular(10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: selected
                    ? AppTheme.accent.withValues(alpha: 0.12)
                    : colors.surfaceVariant,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selected ? AppTheme.accent : colors.border,
                  width: selected ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _iconFor(mode),
                    size: 17,
                    color:
                        selected ? AppTheme.accent : colors.textSecondary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      mode.label,
                      style: TextStyle(
                        color: selected
                            ? colors.textPrimary
                            : colors.textSecondary,
                        fontSize: 14,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                  if (selected)
                    const Icon(Icons.check_rounded,
                        size: 17, color: AppTheme.accent),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  static IconData _iconFor(AppThemeMode mode) => switch (mode) {
        AppThemeMode.light => Icons.light_mode_rounded,
        AppThemeMode.dark => Icons.dark_mode_rounded,
        AppThemeMode.system => Icons.brightness_auto_rounded,
      };
}

/// 带副标题的开关行。
class _SwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: colors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: colors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}

/// 可点击的跳转行。
class _NavTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _NavTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: colors.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colors.border),
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline_rounded,
                size: 17, color: colors.textSecondary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: colors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: colors.textSecondary, fontSize: 11),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                size: 20, color: colors.textSecondary),
          ],
        ),
      ),
    );
  }
}
