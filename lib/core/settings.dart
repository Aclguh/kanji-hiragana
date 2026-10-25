import 'package:flutter/foundation.dart';
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

  /// 界面显示用的名称, 随当前语言变化。
  String label(AppStrings s) => s.themeModeLabel(this);

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
  static const _kShowRomaji = 'settings.show_romaji';
  static const _kViewMode = 'settings.view_mode';

  SettingsController._();

  static final SettingsController instance = SettingsController._();

  /// 供测试环境重置单例状态。
  @visibleForTesting
  void resetForTesting() {
    _themeMode = AppThemeMode.system;
    _autoRotate = false;
    _language = AppLanguage.zh;
    _showRomaji = true;
    _viewModeName = 'alignment';
    _prefs = null;
    _loadError = null;
    _saveError = null;
    _lastWrite = Future<void>.value();
    notifyListeners();
  }

  SharedPreferences? _prefs;

  Object? _saveError;

  Future<void> _lastWrite = Future<void>.value();

  AppThemeMode _themeMode = AppThemeMode.system;

  /// 自动旋转默认关闭: 阅读竖排的汉字 / 假名时, 误触旋转会打断阅读。
  bool _autoRotate = false;

  /// 界面语言。默认中文, 用户可在设置中切换。
  AppLanguage _language = AppLanguage.zh;

  /// 结果区是否显示罗马音。
  bool _showRomaji = true;

  /// 结果视图, 取值为主界面 ViewMode 枚举的 name ('alignment' / 'furigana' / 'vertical')。
  /// 用字符串而非直接依赖 UI 枚举, 保持 core 层不引用界面代码。
  String _viewModeName = 'alignment';

  AppThemeMode get themeMode => _themeMode;

  /// 是否跟随设备重力方向自动旋转。
  bool get autoRotate => _autoRotate;

  /// 当前界面语言。
  AppLanguage get language => _language;

  /// 结果区是否显示罗马音。
  bool get showRomaji => _showRomaji;

  /// 结果视图的持久化名称 ('alignment' / 'furigana')。
  String get viewModeName => _viewModeName;

  /// 当前语言对应的全部文案。
  AppStrings get strings => AppStrings.forLanguage(_language);

  Object? _loadError;

  /// 本地设置加载异常 (若加载失败)。
  Object? get loadError => _loadError;

  /// 最近一次设置持久化异常 (若写入失败)。
  Object? get saveError => _saveError;

  /// 是否已完成本地设置的加载。
  bool get isReady => _prefs != null;

  /// 从本地读取设置。应在 runApp 之前 await 完成。
  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _prefs = prefs;
      _loadError = null;
      _saveError = null;
      _themeMode = AppThemeMode.fromName(prefs.getString(_kThemeMode));
      _autoRotate = prefs.getBool(_kAutoRotate) ?? false;
      _language = AppLanguage.fromName(prefs.getString(_kLanguage));
      _showRomaji = prefs.getBool(_kShowRomaji) ?? true;
      _viewModeName = prefs.getString(_kViewMode) ?? 'alignment';
    } catch (e) {
      _loadError = e;
    } finally {
      notifyListeners();
    }
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
    await _write((prefs) => prefs.setString(_kThemeMode, mode.name));
  }

  Future<void> setAutoRotate(bool value) async {
    if (_autoRotate == value) return;
    _autoRotate = value;
    notifyListeners();
    await _write((prefs) => prefs.setBool(_kAutoRotate, value));
  }

  Future<void> setLanguage(AppLanguage language) async {
    if (_language == language) return;
    _language = language;
    notifyListeners();
    await _write((prefs) => prefs.setString(_kLanguage, language.name));
  }

  Future<void> setShowRomaji(bool value) async {
    if (_showRomaji == value) return;
    _showRomaji = value;
    notifyListeners();
    await _write((prefs) => prefs.setBool(_kShowRomaji, value));
  }

  Future<void> setViewModeName(String name) async {
    if (_viewModeName == name) return;
    _viewModeName = name;
    notifyListeners();
    await _write((prefs) => prefs.setString(_kViewMode, name));
  }

  Future<void> _write(
    Future<bool> Function(SharedPreferences prefs) operation,
  ) {
    final prefs = _prefs;
    if (prefs == null) return Future<void>.value();
    final write = _performWrite(prefs, operation);
    _lastWrite = write;
    return write;
  }

  Future<void> _performWrite(
    SharedPreferences prefs,
    Future<bool> Function(SharedPreferences prefs) operation,
  ) async {
    try {
      final ok = await operation(prefs);
      if (!ok) {
        throw StateError('SharedPreferences write returned false');
      }
      if (_saveError != null) {
        _saveError = null;
        notifyListeners();
      }
    } catch (e) {
      _saveError = e;
      notifyListeners();
    }
  }

  /// 等待最近一次写入完成, 供应用进入后台前调用。
  Future<void> flush() => _lastWrite;
}
