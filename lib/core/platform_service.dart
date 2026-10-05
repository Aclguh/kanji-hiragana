import 'dart:async';

import 'package:flutter/services.dart';

/// 平台级系统交互服务。
///
/// 负责处理 Android 系统级划词 (android.intent.action.PROCESS_TEXT) 调起。
class PlatformService {
  static const _channel = MethodChannel('kanji_hiragana/platform');

  PlatformService._() {
    _channel.setMethodCallHandler(_handleCall);
  }

  static final PlatformService instance = PlatformService._();

  final _textController = StreamController<String>.broadcast();

  /// 接收到外部系统划词发送过来的文本流。
  Stream<String> get onProcessedText => _textController.stream;

  Future<void> _handleCall(MethodCall call) async {
    if (call.method == 'onProcessText') {
      final text = call.arguments as String?;
      if (text != null && text.trim().isNotEmpty) {
        _textController.add(text.trim());
      }
    }
  }

  /// 获取冷启动时由 PROCESS_TEXT 传入的初始文本。
  Future<String?> getInitialProcessedText() async {
    try {
      final text = await _channel.invokeMethod<String>('getInitialProcessedText');
      if (text != null && text.trim().isNotEmpty) {
        return text.trim();
      }
    } catch (_) {
      // 非 Android 或测试环境静默返回 null
    }
    return null;
  }
}
