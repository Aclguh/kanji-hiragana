import 'package:flutter/material.dart';

import '../core/settings.dart';
import '../core/strings.dart';
import '../theme.dart';
import 'sliding_drawer.dart';

/// 设置抽屉内容: 主题切换 / 旋转屏幕 / 语言 / 关于。
class SettingsDrawerContent extends StatelessWidget {
  final VoidCallback onOpenAbout;

  const SettingsDrawerContent({super.key, required this.onOpenAbout});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsController.instance;
    final s = AppStrings.of(context);

    return DrawerPanel(
      side: DrawerSide.right,
      title: s.settings,
      subtitle: s.settingsSubtitle,
      children: [
        // 主题切换
        DrawerSectionLabel(s.sectionAppearance),
        AnimatedBuilder(
          animation: settings,
          builder: (context, _) => _ThemeModeSelector(
            value: settings.themeMode,
            onChanged: settings.setThemeMode,
          ),
        ),
        const SizedBox(height: 22),

        // 旋转屏幕
        DrawerSectionLabel(s.sectionScreen),
        AnimatedBuilder(
          animation: settings,
          builder: (context, _) => _SwitchTile(
            title: s.autoRotate,
            subtitle: settings.autoRotate ? s.autoRotateOn : s.autoRotateOff,
            value: settings.autoRotate,
            onChanged: settings.setAutoRotate,
          ),
        ),
        const SizedBox(height: 22),

        // 语言
        DrawerSectionLabel(s.sectionLanguage),
        AnimatedBuilder(
          animation: settings,
          builder: (context, _) => _LanguageSelector(
            value: settings.language,
            title: s.sectionLanguage,
            onChanged: settings.setLanguage,
          ),
        ),
        const SizedBox(height: 22),

        // 关于
        DrawerSectionLabel(s.sectionOtherSettings),
        _NavTile(
          title: s.about,
          subtitle: s.aboutSubtitle,
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
    final s = AppStrings.of(context);
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
                      mode.label(s),
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

/// 语言选择: 收起时只显示当前语言, 点击后展开两个选项。
class _LanguageSelector extends StatefulWidget {
  final AppLanguage value;
  final String title;
  final ValueChanged<AppLanguage> onChanged;

  const _LanguageSelector({
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  State<_LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<_LanguageSelector> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _expanded ? AppTheme.accent : colors.border,
          width: _expanded ? 1.5 : 1,
        ),
      ),
      child: Column(
        children: [
          // 收起态: 标题 + 当前语言 + 展开箭头。
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              child: Row(
                children: [
                  Icon(Icons.translate_rounded,
                      size: 17,
                      color: _expanded
                          ? AppTheme.accent
                          : colors.textSecondary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    widget.value.label,
                    style: TextStyle(
                      color: _expanded
                          ? AppTheme.accent
                          : colors.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: Icon(Icons.keyboard_arrow_down_rounded,
                        size: 20, color: colors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
          // 展开态: 两个语言选项。
          if (_expanded) ...[
            Divider(height: 1, color: colors.border),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                children: AppLanguage.values.map((lang) {
                  final selected = lang == widget.value;
                  return InkWell(
                    onTap: () {
                      widget.onChanged(lang);
                      setState(() => _expanded = false);
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              lang.label,
                              style: TextStyle(
                                color: selected
                                    ? AppTheme.accent
                                    : colors.textPrimary,
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
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
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
