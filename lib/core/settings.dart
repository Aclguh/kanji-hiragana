import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'strings.dart';

/// 主题模式。
enum AppThemeMode {
  /// 浅色。
  light,

  /// 深色。
  dark,

  /// 跟随系统。
  system;

  /// 映射为 Flutter 的 [ThemeMode]。
  ThemeMode get material => switch (this) {
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
        AppThemeMode.system => ThemeMode.system,
      };

  /// 界面显示用的名称, 随当前语言变化。
  String label(AppStrings s) => s.themeModeLabel(name);

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
  static const _kLanguage = 'settings.language';

  SettingsController._();

  static final SettingsController instance = SettingsController._();

  SharedPreferences? _prefs;

  AppThemeMode _themeMode = AppThemeMode.system;

  /// 自动旋转默认关闭: 阅读竖排的汉字 / 假名时, 误触旋转会打断阅读。
  bool _autoRotate = false;

  /// 界面语言。默认中文, 用户可在设置中切换。
  AppLanguage _language = AppLanguage.zh;

  AppThemeMode get themeMode => _themeMode;

  /// 是否跟随设备重力方向自动旋转。
  bool get autoRotate => _autoRotate;

  /// 当前界面语言。
  AppLanguage get language => _language;

  /// 当前语言对应的全部文案。
  AppStrings get strings => AppStrings.forLanguage(_language);

  /// 是否已完成本地设置的加载。
  bool get isReady => _prefs != null;

  /// 从本地读取设置。应在 runApp 之前 await 完成。
  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    _themeMode = AppThemeMode.fromName(_prefs!.getString(_kThemeMode));
    _autoRotate = _prefs!.getBool(_kAutoRotate) ?? false;
    _language = AppLanguage.fromName(_prefs!.getString(_kLanguage));
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

  Future<void> setLanguage(AppLanguage language) async {
    if (_language == language) return;
    _language = language;
    notifyListeners();
    await _prefs?.setString(_kLanguage, language.name);
  }
}
