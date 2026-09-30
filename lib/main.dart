import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/japanese_analyzer.dart';
import 'core/query_store.dart';
import 'core/settings.dart';
import 'core/strings.dart';
import 'home_page.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 读取本地设置 (主题模式 / 旋转开关 / 语言 / 视图状态), 需在首帧前完成以免闪烁。
  await SettingsController.instance.load();
  await QueryStore.instance.load();

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
  final navBarColor = dark ? AppTheme.darkBg : AppTheme.lightBg;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          dark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: navBarColor,
      systemNavigationBarIconBrightness:
          dark ? Brightness.light : Brightness.dark,
    ),
  );
}

class KanjiApp extends StatefulWidget {
  const KanjiApp({super.key});

  @override
  State<KanjiApp> createState() => _KanjiAppState();
}

class _KanjiAppState extends State<KanjiApp> with WidgetsBindingObserver {
  final _settings = SettingsController.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (_settings.themeMode == AppThemeMode.system) {
      _applySystemUi(_settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _settings,
      builder: (context, _) {
        _applySystemUi(_settings);
        final strings = _settings.strings;
        return AppStringsScope(
          strings: strings,
          child: MaterialApp(
            title: strings.appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: _settings.themeMode.material,
            home: RotationGuard(
              enabled: _settings.autoRotate,
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
