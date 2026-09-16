import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 主题模式。
enum AppThemeMode {
  /// 浅色。
  light,

  /// 深色。
  dark,

  /// 跟随系统。
  system;

  String get label => switch (this) {
        AppThemeMode.light => '浅色',
        AppThemeMode.dark => '深色',
        AppThemeMode.system => '跟随系统',
      };

  /// 映射为 Flutter 的 [ThemeMode]。
  ThemeMode get material => switch (this) {
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
        AppThemeMode.system => ThemeMode.system,
      };

  static AppThemeMode fromName(String? name) {
    return AppThemeMode.values.firstWhere(
      (m) => m.name == name,
      orElse: () => AppThemeMode.system,
    );
  }
}

/// 应用设置。
///
/// 通过 [SettingsController] 读写, 变更会持久化到本地并通知界面重建。
class SettingsController extends ChangeNotifier {
  static const _kThemeMode = 'settings.theme_mode';
  static const _kAutoRotate = 'settings.auto_rotate';

  SettingsController._();

  static final SettingsController instance = SettingsController._();

  SharedPreferences? _prefs;

  AppThemeMode _themeMode = AppThemeMode.system;

  /// 自动旋转默认关闭: 阅读竖排的汉字 / 假名时, 误触旋转会打断阅读。
  bool _autoRotate = false;

  AppThemeMode get themeMode => _themeMode;

  /// 是否跟随设备重力方向自动旋转。
  bool get autoRotate => _autoRotate;

  /// 是否已完成本地设置的加载。
  bool get isReady => _prefs != null;

  /// 从本地读取设置。应在 runApp 之前 await 完成。
  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    _themeMode = AppThemeMode.fromName(_prefs!.getString(_kThemeMode));
    _autoRotate = _prefs!.getBool(_kAutoRotate) ?? false;
    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
    await _prefs?.setString(_kThemeMode, mode.name);
  }

  Future<void> setAutoRotate(bool value) async {
    if (_autoRotate == value) return;
    _autoRotate = value;
    notifyListeners();
    await _prefs?.setBool(_kAutoRotate, value);
  }
}
