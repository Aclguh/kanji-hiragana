/// 系统划词文本来源接口。
///
/// 生产实现是 Android `PROCESS_TEXT` 平台通道; 测试可注入固定文本流。
abstract interface class PlatformTextSource {
  /// 运行时收到的外部划词文本。
  Stream<String> get onProcessedText;

  /// 冷启动时由 PROCESS_TEXT 传入的初始文本。
  Future<String?> getInitialProcessedText();
}
