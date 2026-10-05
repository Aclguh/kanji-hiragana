import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// 离线系统 TTS 朗读服务。
///
/// 通过平台通道调用系统原生的日语音频合成引擎 (TextToSpeech),
/// 纯离线运行、无需网络、无需额外原生依赖或权限。
/// 在非 Android 平台或测试宿主环境下静默降级为 no-op。
class TtsService with ChangeNotifier {
  static const _channel = MethodChannel('kanji_hiragana/tts');

  TtsService._() {
    _channel.setMethodCallHandler(_handlePlatformCall);
  }

  static final TtsService instance = TtsService._();

  bool _isSpeaking = false;
  String _speakingText = '';

  /// 是否正在发音。
  bool get isSpeaking => _isSpeaking;

  /// 当前正在发音的文本。
  String get speakingText => _speakingText;

  Future<void> _handlePlatformCall(MethodCall call) async {
    switch (call.method) {
      case 'onSpeakStart':
        _isSpeaking = true;
        notifyListeners();
        break;
      case 'onSpeakDone':
      case 'onSpeakError':
        _isSpeaking = false;
        _speakingText = '';
        notifyListeners();
        break;
    }
  }

  /// 播放日语文本发音。
  Future<bool> speak(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return false;

    try {
      _speakingText = trimmed;
      _isSpeaking = true;
      notifyListeners();

      final result = await _channel.invokeMethod<bool>('speak', {'text': trimmed});
      if (result != true) {
        _isSpeaking = false;
        _speakingText = '';
        notifyListeners();
        return false;
      }
      return true;
    } catch (_) {
      // 在宿主测试或不支持的平台上静默降级
      _isSpeaking = false;
      _speakingText = '';
      notifyListeners();
      return false;
    }
  }

  /// 停止发音。
  Future<void> stop() async {
    try {
      await _channel.invokeMethod<bool>('stop');
    } catch (_) {
      // 容错降级
    } finally {
      if (_isSpeaking) {
        _isSpeaking = false;
        _speakingText = '';
        notifyListeners();
      }
    }
  }
}
