import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../core/diagnostics.dart';
import '../../core/japanese_analyzer.dart';
import '../../core/kanji_services.dart';
import '../../core/morpheme.dart';

/// 出错环节, 决定界面上显示哪一条提示。
enum HomeErrorKind { dictionary, analysis }

/// 主界面业务协调器。
///
/// 封装「形态素分析异步调度、序列号防竞态、系统外部划词监听、
/// 查询历史与收藏联动」等业务状态与逻辑，将纯视图交互与业务流程解耦。
///
/// 依赖通过 [KanjiServices] 注入，完全消除对全局单例的硬编码依赖，
/// 支持脱离 Widget 树进行独立单元测试。
class HomeCoordinator with ChangeNotifier {
  final KanjiServices services;

  HomeCoordinator({
    required this.services,
  });

  StreamSubscription<String>? _processTextSub;

  bool _loading = true;
  bool get loading => _loading;

  bool _analysisInProgress = false;
  bool get analysisInProgress => _analysisInProgress;

  AnalysisResult? _result;
  AnalysisResult? get result => _result;

  /// 上一次成功分析的文本, 供历史记录判断「本次是否为上次输入的延续」。
  String _lastAnalyzedText = '';
  String get lastAnalyzedText => _lastAnalyzedText;

  /// 分析请求序号: 异步处理期间输入又变化时，过期的结果直接丢弃，
  /// 避免旧结果覆盖新结果。
  int _requestSeq = 0;
  int get requestSeq => _requestSeq;

  HomeErrorKind? _errorKind;
  HomeErrorKind? get errorKind => _errorKind;

  Object? _errorDetail;
  Object? get errorDetail => _errorDetail;

  /// 外部系统划词通知流 (转发至 UI 层回填输入框)。
  final _externalQueryController = StreamController<String>.broadcast();
  Stream<String> get onExternalQuery => _externalQueryController.stream;

  /// 初始化词典预热与外部划词监听。
  Future<void> init() async {
    try {
      await services.analyzer.warmUp();
      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      _errorKind = HomeErrorKind.dictionary;
      _errorDetail = e;
      DiagnosticsLog.instance.record('dictionary', e);
      notifyListeners();
    }

    // 检查 Android 系统外部划词传入的文本
    try {
      final initialText = await services.platform.getInitialProcessedText();
      if (initialText != null && initialText.isNotEmpty) {
        _externalQueryController.add(initialText);
      }
    } catch (e, stackTrace) {
      DiagnosticsLog.instance.record(
        'platform',
        e,
        stackTrace: stackTrace,
      );
    }

    _processTextSub = services.platform.onProcessedText.listen((text) {
      if (text.isNotEmpty) {
        _externalQueryController.add(text);
      }
    });
  }

  /// 立即触发分析 (用于点击历史词条、粘贴、外部划词回填等输入场景)。
  Future<void> runAnalysis(
    String text, {
    bool Function()? isCancelled,
    void Function(int limit)? onTruncated,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      _result = null;
      _analysisInProgress = false;
      notifyListeners();
      return;
    }

    final seq = ++_requestSeq;
    _analysisInProgress = true;
    _errorKind = null;
    _errorDetail = null;
    notifyListeners();
    try {
      final r = await services.analyzer.analyze(
        text,
        isCancelled: () {
          return (isCancelled?.call() ?? false) || seq != _requestSeq;
        },
      );

      // await 期间输入变化或被取消，丢弃过期结果
      if (seq != _requestSeq || (isCancelled?.call() ?? false)) {
        return;
      }

      _result = r;
      _analysisInProgress = false;
      _errorKind = null;
      _errorDetail = null;
      notifyListeners();

      if (r.isTruncated) {
        onTruncated?.call(kMaxInputLength);
      }

      final previous = _lastAnalyzedText;
      _lastAnalyzedText = trimmed;
      services.queryStore.recordQuery(trimmed, previous: previous);
    } catch (e, stackTrace) {
      if (seq != _requestSeq || (isCancelled?.call() ?? false)) {
        return;
      }
      _analysisInProgress = false;
      _errorKind = HomeErrorKind.analysis;
      _errorDetail = e;
      DiagnosticsLog.instance.record(
        'analysis',
        e,
        stackTrace: stackTrace,
      );
      notifyListeners();
    }
  }

  /// 切换收藏状态，返回切换后的布尔值。
  bool toggleFavorite(String text) {
    return services.queryStore.toggleFavorite(text);
  }

  /// 当前文本是否已收藏。
  bool isFavorite(String text) {
    return services.queryStore.isFavorite(text);
  }

  /// 清空当前输入状态与延续标记。
  void clear() {
    _requestSeq++;
    _lastAnalyzedText = '';
    _analysisInProgress = false;
  }

  @override
  void dispose() {
    _processTextSub?.cancel();
    _externalQueryController.close();
    super.dispose();
  }
}
