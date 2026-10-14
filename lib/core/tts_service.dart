import 'dart:async';

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

  /// 供测试环境重置单例状态。
  @visibleForTesting
  void resetForTesting() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    _isSpeaking = false;
    _speakingText = '';
    _currentUtteranceId = null;
    _utteranceSeq = 0;
    notifyListeners();
  }

  Timer? _timeoutTimer;
  bool _isSpeaking = false;
  String _speakingText = '';
  int _utteranceSeq = 0;
  String? _currentUtteranceId;

  /// 是否正在发音。
  bool get isSpeaking => _isSpeaking;

  /// 当前正在发音的文本。
  String get speakingText => _speakingText;

  /// 当前发音任务标识。
  String? get currentUtteranceId => _currentUtteranceId;

  /// 检查系统 TTS 引擎是否就绪。
  Future<bool> isAvailable() async {
    try {
      final result = await _channel.invokeMethod<bool>('isAvailable');
      return result == true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _handlePlatformCall(MethodCall call) async {
    String? utteranceId;
    if (call.arguments is String) {
      utteranceId = call.arguments as String;
    } else if (call.arguments is Map) {
      utteranceId = (call.arguments as Map)['utteranceId'] as String?;
    }

    switch (call.method) {
      case 'onSpeakStart':
        if (utteranceId != null && utteranceId != _currentUtteranceId) return;
        _isSpeaking = true;
        notifyListeners();
        break;
      case 'onSpeakDone':
      case 'onSpeakError':
        if (utteranceId != null && utteranceId != _currentUtteranceId) return;
        _timeoutTimer?.cancel();
        _timeoutTimer = null;
        _isSpeaking = false;
        _speakingText = '';
        _currentUtteranceId = null;
        notifyListeners();
        break;
    }
  }

  /// 播放日语文本发音。
  Future<bool> speak(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return false;

    _timeoutTimer?.cancel();
    final utteranceId = 'tts_${++_utteranceSeq}';
    _currentUtteranceId = utteranceId;
    _speakingText = trimmed;
    _isSpeaking = true;
    notifyListeners();

    // 设置 15 秒超时守护, 防止原生通道无回调时状态悬挂
    _timeoutTimer = Timer(const Duration(seconds: 15), () {
      if (_isSpeaking && _currentUtteranceId == utteranceId) {
        _isSpeaking = false;
        _speakingText = '';
        _currentUtteranceId = null;
        notifyListeners();
      }
    });

    try {
      final result = await _channel.invokeMethod<bool>('speak', {
        'text': trimmed,
        'utteranceId': utteranceId,
      });
      if (result != true) {
        if (_currentUtteranceId == utteranceId) {
          _timeoutTimer?.cancel();
          _timeoutTimer = null;
          _isSpeaking = false;
          _speakingText = '';
          _currentUtteranceId = null;
          notifyListeners();
        }
        return false;
      }
      return true;
    } catch (_) {
      // 在宿主测试或不支持的平台上静默降级
      if (_currentUtteranceId == utteranceId) {
        _timeoutTimer?.cancel();
        _timeoutTimer = null;
        _isSpeaking = false;
        _speakingText = '';
        _currentUtteranceId = null;
        notifyListeners();
      }
      return false;
    }
  }

  /// 停止发音。
  Future<void> stop() async {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    _currentUtteranceId = null;
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
