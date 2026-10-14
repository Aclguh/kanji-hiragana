import 'package:flutter/widgets.dart';

import 'japanese_analyzer.dart';
import 'platform_service.dart';
import 'query_store.dart';
import 'settings.dart';
import 'tts_service.dart';

/// 全局与作用域服务容器。
///
/// 封装应用核心单例服务, 支持通过 [KanjiServicesScope] 在测试环境或
/// 子树中注入沙箱/Mock 实例, 消除组件对全局单例的硬编码依赖。
class KanjiServices {
  final JapaneseAnalyzer analyzer;
  final QueryStore queryStore;
  final SettingsController settings;
  final TtsService tts;
  final PlatformService platform;

  const KanjiServices({
    required this.analyzer,
    required this.queryStore,
    required this.settings,
    required this.tts,
    required this.platform,
  });

  /// 默认全局单例集合 (懒加载)。
  static KanjiServices get defaultServices => KanjiServices(
        analyzer: JapaneseAnalyzer.instance,
        queryStore: QueryStore.instance,
        settings: SettingsController.instance,
        tts: TtsService.instance,
        platform: PlatformService.instance,
      );

  /// 从当前上下文获取服务容器; 若树中未找到 [KanjiServicesScope],
  /// 优雅回退到 [defaultServices], 保持现有调用与测试 100% 兼容。
  static KanjiServices of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<KanjiServicesScope>();
    return scope?.services ?? defaultServices;
  }
}

/// 服务作用域注入挂载点。
class KanjiServicesScope extends InheritedWidget {
  final KanjiServices services;

  const KanjiServicesScope({
    super.key,
    required this.services,
    required super.child,
  });

  @override
  bool updateShouldNotify(KanjiServicesScope oldWidget) =>
      services != oldWidget.services;
}
