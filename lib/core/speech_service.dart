/// 系统语音朗读接口。
///
/// 生产实现是 Android 原生 TTS 的 `TtsService`; 测试可注入 no-op fake。
abstract interface class SpeechService {
  /// 系统 TTS 是否可用。
  Future<bool> isAvailable();

  /// 朗读文本, 返回是否成功提交给引擎。
  Future<bool> speak(String text);

  /// 停止当前朗读。
  Future<void> stop();
}
