import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/japanese_analyzer.dart';
import 'core/settings.dart';
import 'core/strings.dart';
import 'home_page.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 读取本地设置 (主题模式 / 旋转开关), 需在首帧前完成以免闪烁。
  await SettingsController.instance.load();

  _applySystemUi(SettingsController.instance);

  // 后台预热词典, 与首帧渲染并行, 减少等待感。
  JapaneseAnalyzer.instance.warmUp();

  runApp(const KanjiApp());
}

/// 按当前主题模式设置状态栏与导航栏样式。
void _applySystemUi(SettingsController settings) {
  final systemDark = PlatformDispatcher.instance.platformBrightness ==
      Brightness.dark;
  final dark = switch (settings.themeMode) {
    AppThemeMode.dark => true,
    AppThemeMode.light => false,
    AppThemeMode.system => systemDark,
  };
  final colors = dark ? const _UiColors.dark() : const _UiColors.light();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          dark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: colors.navBar,
      systemNavigationBarIconBrightness:
          dark ? Brightness.light : Brightness.dark,
    ),
  );
}

/// 系统栏配色 (与 AppColors 解耦, 避免循环引用)。
class _UiColors {
  final Color navBar;
  const _UiColors.dark() : navBar = AppTheme.darkBg;
  const _UiColors.light() : navBar = AppTheme.lightBg;
}

class KanjiApp extends StatelessWidget {
  const KanjiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsController.instance;

    return AnimatedBuilder(
      animation: settings,
      builder: (context, _) {
        final strings = settings.strings;
        return AppStringsScope(
          strings: strings,
          child: MaterialApp(
            title: strings.appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: settings.themeMode.material,
            home: RotationGuard(
              enabled: settings.autoRotate,
              child: const HomePage(),
            ),
          ),
        );
      },
    );
  }
}

/// 根据设置锁定/解锁屏幕方向。
///
/// 关闭「旋转屏幕」时固定为竖屏; 开启时恢复系统默认的
/// 全部方向 (含横屏), 由重力感应决定。
class RotationGuard extends StatefulWidget {
  final bool enabled;
  final Widget child;

  const RotationGuard({
    super.key,
    required this.enabled,
    required this.child,
  });

  /// 允许的方向集合 (开启旋转时)。
  static const _all = <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  /// 锁定时的方向集合。
  static const _portraitOnly = <DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ];

  @override
  State<RotationGuard> createState() => _RotationGuardState();
}

class _RotationGuardState extends State<RotationGuard> {
  @override
  void initState() {
    super.initState();
    _apply();
  }

  @override
  void didUpdateWidget(RotationGuard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) _apply();
  }

  void _apply() {
    SystemChrome.setPreferredOrientations(
      widget.enabled ? RotationGuard._all : RotationGuard._portraitOnly,
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
