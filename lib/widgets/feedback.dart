import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 显示一条轻提示 (默认 900ms 自动消失)。
///
/// 弹出前先收起现有的 SnackBar, 避免连击时提示排队;
/// 文案由调用方按当前语言生成, 本文件不持有文案。
///
/// 约定: 调用点必须位于 MaterialApp (ScaffoldMessenger) 之下 ——
/// 当前所有调用都满足; 无 Messenger 祖先时静默放弃, 提示是
/// 锦上添花的反馈, 不值得为它崩溃。
void showToast(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (messenger == null) return;
  // 读屏 (accessibleNavigation) 下自动消失的浮层来不及听完,
  // 放大停留时间, 用户可手动划掉。
  final duration = MediaQuery.accessibleNavigationOf(context)
      ? const Duration(seconds: 6)
      : const Duration(milliseconds: 900);
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
}

/// 把 [text] 写入剪贴板并弹出 [message] 提示。
///
/// 全部复制交互共用此入口: 提示文案通常是
/// `s.copiedSurface(text)`, 整段读音等场景用专用文案。
void copyWithToast(BuildContext context, String text, String message) {
  // 写剪贴板的 Future 无人消费, 显式标注并吞掉失败 ——
  // 个别设备上剪贴板写入会失败, 不能任其成为未捕获异步错误。
  unawaited(
    Clipboard.setData(ClipboardData(text: text)).catchError((_) {}),
  );
  showToast(context, message);
}
