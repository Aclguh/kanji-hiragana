import 'analyzer_service.dart';
import 'japanese_analyzer.dart';
import 'platform_service.dart';
import 'platform_text_source.dart';
import 'query_store.dart';
import 'settings.dart';
import 'speech_service.dart';
import 'tts_service.dart';

/// 全局服务容器。
///
/// 只依赖纯 Dart 接口, 不引用 Flutter Widget; 作用域注入在 UI 层
/// (`lib/widgets/app_scopes.dart`) 完成。
class KanjiServices {
  final AnalyzerService analyzer;
  final QueryStore queryStore;
  final SettingsController settings;
  final SpeechService tts;
  final PlatformTextSource platform;

  const KanjiServices({
    required this.analyzer,
    required this.queryStore,
    required this.settings,
    required this.tts,
    required this.platform,
  });

  /// 默认全局单例集合。
  static final KanjiServices defaultServices = KanjiServices(
    analyzer: JapaneseAnalyzer.instance,
    queryStore: QueryStore.instance,
    settings: SettingsController.instance,
    tts: TtsService.instance,
    platform: PlatformService.instance,
  );
}
