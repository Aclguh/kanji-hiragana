import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 查询历史与收藏。
///
/// 与 [SettingsController] 同一套模式: 单例 + ChangeNotifier + SharedPreferences,
/// 变更持久化到本地并通知界面重建。
///
/// 两个列表都以「新的在前」存放, 元素即查询文本本身:
/// 单字、单词、句子一视同仁, 点按词条即可原样重新查询。
class QueryStore extends ChangeNotifier {
  static const _kHistory = 'query.history';
  static const _kFavorites = 'query.favorites';

  /// 历史条数上限, 防止无限增长。
  static const maxHistory = 20;

  /// 收藏条数上限, 防止无限增长。
  static const maxFavorites = 500;

  /// 单条查询记录的最大字符长度，防止超大异常文本写入持久化。
  static const maxQueryTextLength = 200;

  /// 清洗输入文本: 截断超长部分并过滤控制字符。
  static String sanitizeText(String text) {
    var trimmed = text.trim();
    if (trimmed.length > maxQueryTextLength) {
      trimmed = trimmed.substring(0, maxQueryTextLength).trim();
    }
    return trimmed.replaceAll(RegExp(r'[\x00-\x08\x0B\x0C\x0E-\x1F]'), '');
  }

  QueryStore._();

  static final QueryStore instance = QueryStore._();

  /// 供测试环境重置单例状态。
  @visibleForTesting
  void resetForTesting() {
    _history = const [];
    _favorites = const [];
    _prefs = null;
    _loadError = null;
    notifyListeners();
  }

  SharedPreferences? _prefs;

  Object? _loadError;

  /// 本地数据加载异常 (若加载失败)。
  Object? get loadError => _loadError;

  /// 最近查询, 新的在前。
  List<String> _history = const [];

  /// 收藏的查询, 新的在前。
  List<String> _favorites = const [];

  /// 是否已完成本地加载。
  bool get isReady => _prefs != null;

  List<String> get history => List.unmodifiable(_history);

  List<String> get favorites => List.unmodifiable(_favorites);

  /// 该文本是否已收藏。
  bool isFavorite(String text) => _favorites.contains(sanitizeText(text));

  /// 从本地读取。应在 runApp 之前 await 完成。
  ///
  /// 与 [SettingsController.load] 同一套降级策略: SharedPreferences
  /// 异常 (数据损坏等) 不炸 `main()` 的 await, 记录 [loadError] 后
  /// 以空历史/收藏继续。若 getInstance 本身失败, `_prefs` 保持
  /// null, 写入路径静默跳过; 若仅读取解析失败, 后续写入会用合法
  /// 值覆盖损坏键。
  Future<void> load() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _history = _prefs!.getStringList(_kHistory) ?? const [];
      _favorites = _prefs!.getStringList(_kFavorites) ?? const [];
      if (_history.length > maxHistory) {
        _history = _history.sublist(0, maxHistory);
        _persistHistory();
      }
      if (_favorites.length > maxFavorites) {
        _favorites = _favorites.sublist(0, maxFavorites);
        _persistFavorites();
      }
      _loadError = null;
    } catch (e) {
      _loadError = e;
    } finally {
      notifyListeners();
    }
  }

  /// 记录一次成功的查询。
  ///
  /// [previous] 是上一次成功分析的文本: 若本次文本是它的延续
  /// (以它开头且更长, 且它就是当前最新记录), 则原位更新首条,
  /// 把连续打字产生的中间态折叠成一条, 而不是每次按键都留痕。
  void recordQuery(String text, {String previous = ''}) {
    final trimmed = sanitizeText(text);
    if (trimmed.isEmpty) return;

    final prev = sanitizeText(previous);
    final extendsLast = prev.isNotEmpty &&
        trimmed.startsWith(prev) &&
        trimmed.length > prev.length &&
        _history.isNotEmpty &&
        _history.first == prev;

    if (extendsLast) {
      _history = [trimmed, ..._history.sublist(1)];
    } else {
      // 去重置顶 (点按历史词条重查时会走到这里, 顺带实现 LRU)。
      _history = [trimmed, ..._history.where((e) => e != trimmed)];
      if (_history.length > maxHistory) {
        _history = _history.sublist(0, maxHistory);
      }
    }
    notifyListeners();
    _persistHistory();
  }

  /// 切换收藏状态, 返回切换后是否已收藏。
  bool toggleFavorite(String text) {
    final trimmed = sanitizeText(text);
    if (trimmed.isEmpty) return isFavorite(trimmed);

    if (_favorites.contains(trimmed)) {
      _favorites = _favorites.where((e) => e != trimmed).toList();
      notifyListeners();
      _persistFavorites();
      return false;
    }
    _favorites = [trimmed, ..._favorites];
    if (_favorites.length > maxFavorites) {
      _favorites = _favorites.sublist(0, maxFavorites);
    }
    notifyListeners();
    _persistFavorites();
    return true;
  }

  /// 删除一条历史。
  void removeHistory(String text) {
    _history = _history.where((e) => e != text).toList();
    notifyListeners();
    _persistHistory();
  }

  /// 清空历史 (收藏保留)。
  void clearHistory() {
    if (_history.isEmpty) return;
    _history = const [];
    notifyListeners();
    _persistHistory();
  }

  void _persistHistory() {
    _prefs?.setStringList(_kHistory, _history);
  }

  void _persistFavorites() {
    _prefs?.setStringList(_kFavorites, _favorites);
  }
}
