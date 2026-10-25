import 'package:flutter/widgets.dart';

import '../core/kanji_services.dart';
import '../core/strings.dart';

/// 把当前语言注入组件树。
///
/// 放在 [MaterialApp] 之上, 语言变化时整棵树重建。
class AppStringsScope extends InheritedWidget {
  final AppStrings strings;

  const AppStringsScope({
    super.key,
    required this.strings,
    required super.child,
  });

  static AppStrings of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppStringsScope>();
    assert(
      scope != null,
      'AppStringsScope.of: 未找到 AppStringsScope, 已静默回退中文。\n'
      '测试宿主请用 AppStringsScope(strings: ...) 包裹 MaterialApp, '
      '与 main.dart 的做法一致。',
    );
    return scope?.strings ?? const ZhStrings();
  }

  @override
  bool updateShouldNotify(AppStringsScope oldWidget) =>
      oldWidget.strings.language != strings.language;
}

/// 服务作用域注入挂载点。
class KanjiServicesScope extends InheritedWidget {
  final KanjiServices services;

  const KanjiServicesScope({
    super.key,
    required this.services,
    required super.child,
  });

  /// 从当前上下文获取服务容器; 若树中未找到 scope, 回退到全局单例。
  static KanjiServices of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<KanjiServicesScope>();
    return scope?.services ?? KanjiServices.defaultServices;
  }

  @override
  bool updateShouldNotify(KanjiServicesScope oldWidget) =>
      services != oldWidget.services;
}
