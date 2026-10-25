import 'morpheme.dart';

/// 形态素分析服务接口。
///
/// 生产实现是常驻 isolate 的 `JapaneseAnalyzer`; 测试可注入轻量 fake,
/// 不必启动真实词典。
abstract interface class AnalyzerService {
  /// 预加载词典。重复调用应安全。
  Future<void> warmUp();

  /// 分析单段文本。
  Future<AnalysisResult> analyze(
    String text, {
    bool Function()? isCancelled,
    Duration timeout = const Duration(seconds: 15),
  });

  /// 批量分析独立文本 (如生词本导出)。
  Future<List<AnalysisResult>> analyzeBatch(
    List<String> texts, {
    bool Function()? isCancelled,
    Duration timeout = const Duration(seconds: 15),
  });
}
