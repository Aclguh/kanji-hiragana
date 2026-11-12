import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'diagnostics.dart';
import 'speech_service.dart';

/// 系统 TTS 朗读服务。
///
/// 通过平台通道调用系统原生的日语音频合成引擎 (TextToSpeech)。
/// 应用自身不发起网络请求、不申请网络权限; 系统 TTS 引擎是否联网
/// 取决于用户在系统中选择的引擎。非 Android 平台或测试宿主环境下
/// 静默降级为 no-op。
class TtsService with ChangeNotifier implements SpeechService {
  static const _channel = MethodChannel('kanji_hiragana/tts');

  TtsService._() {
    _channel.setMethodCallHandler(_handlePlatformCall);
  }

  static final TtsService instance = TtsService._();

  /// 供测试环境重置单例状态。
  @visibleForTesting
  void resetForTesting() {
    _resetCurrentUtterance();
    _utteranceSeq = 0;
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

  void _resetCurrentUtterance() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    _isSpeaking = false;
    _speakingText = '';
    _currentUtteranceId = null;
    notifyListeners();
  }

  /// 检查系统 TTS 引擎是否就绪。
  @override
  Future<bool> isAvailable() async {
    try {
      final result = await _channel.invokeMethod<bool>('isAvailable');
      return result == true;
    } catch (e, stackTrace) {
      if (e is! MissingPluginException) {
        DiagnosticsLog.instance.record('tts', e, stackTrace: stackTrace);
      }
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
        _resetCurrentUtterance();
        break;
    }
  }

  /// 播放日语文本发音。
  @override
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
        _resetCurrentUtterance();
      }
    });

    try {
      final result = await _channel.invokeMethod<bool>('speak', {
        'text': trimmed,
        'utteranceId': utteranceId,
      });
      if (result != true) {
        if (_currentUtteranceId == utteranceId) {
          _resetCurrentUtterance();
        }
        return false;
      }
      return true;
    } catch (e, stackTrace) {
      // 在宿主测试或不支持的平台上静默降级
      if (e is! MissingPluginException) {
        DiagnosticsLog.instance.record('tts', e, stackTrace: stackTrace);
      }
      if (_currentUtteranceId == utteranceId) {
        _resetCurrentUtterance();
      }
      return false;
    }
  }

  /// 停止发音。
  @override
  Future<void> stop() async {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    _currentUtteranceId = null;
    try {
      await _channel.invokeMethod<bool>('stop');
    } catch (e, stackTrace) {
      // 容错降级
      if (e is! MissingPluginException) {
        DiagnosticsLog.instance.record('tts', e, stackTrace: stackTrace);
      }
    } finally {
      if (_isSpeaking) {
        _isSpeaking = false;
        _speakingText = '';
        notifyListeners();
      }
    }
  }
}
