import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 显示一条 900ms 自动消失的轻提示。
///
/// 弹出前先收起现有的 SnackBar, 避免连击时提示排队;
/// 文案由调用方按当前语言生成, 本文件不持有文案。
void showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 900),
      ),
    );
}

/// 把 [text] 写入剪贴板并弹出 [message] 提示。
///
/// 全部复制交互共用此入口: 提示文案通常是
/// `s.copiedSurface(text)`, 整段读音等场景用专用文案。
void copyWithToast(BuildContext context, String text, String message) {
  Clipboard.setData(ClipboardData(text: text));
  showToast(context, message);
}
