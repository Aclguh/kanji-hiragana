import 'package:flutter/material.dart';

import '../../theme.dart';
import '../vector_icon.dart';

/// 圆形悬浮按钮, 内含矢量图标。
class FloatingDrawerButton extends StatelessWidget {
  final DrawerIconType type;
  final String tooltip;
  final VoidCallback onTap;

  const FloatingDrawerButton({
    super.key,
    required this.type,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Tooltip(
      message: tooltip,
      child: Material(
        color: colors.surface,
        shape: CircleBorder(side: BorderSide(color: colors.border)),
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 0.25),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: VectorIcon(
                type: type,
                size: 21,
                color: colors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
