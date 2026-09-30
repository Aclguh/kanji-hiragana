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

  QueryStore._();

  static final QueryStore instance = QueryStore._();

  SharedPreferences? _prefs;

  /// 最近查询, 新的在前。
  List<String> _history = const [];

  /// 收藏的查询, 新的在前。
  List<String> _favorites = const [];

  /// 是否已完成本地加载。
  bool get isReady => _prefs != null;

  List<String> get history => List.unmodifiable(_history);

  List<String> get favorites => List.unmodifiable(_favorites);

  /// 该文本是否已收藏。
  bool isFavorite(String text) => _favorites.contains(text.trim());

  /// 从本地读取。应在 runApp 之前 await 完成。
  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    _history = _prefs!.getStringList(_kHistory) ?? const [];
    _favorites = _prefs!.getStringList(_kFavorites) ?? const [];
    notifyListeners();
  }

  /// 记录一次成功的查询。
  ///
  /// [previous] 是上一次成功分析的文本: 若本次文本是它的延续
  /// (以它开头且更长, 且它就是当前最新记录), 则原位更新首条,
  /// 把连续打字产生的中间态折叠成一条, 而不是每次按键都留痕。
  void recordQuery(String text, {String previous = ''}) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    final prev = previous.trim();
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
    final trimmed = text.trim();
    if (trimmed.isEmpty) return isFavorite(trimmed);

    if (_favorites.contains(trimmed)) {
      _favorites = _favorites.where((e) => e != trimmed).toList();
      notifyListeners();
      _persistFavorites();
      return false;
    }
    _favorites = [trimmed, ..._favorites];
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
