import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 悬浮按钮使用的矢量图标。
///
/// 图形以 [Path] 直接绘制, 因此不依赖任何字体或第三方图标包,
/// 也不需要 emoji。
enum DrawerIconType {
  /// 齿轮: 设置。
  settings,

  /// 放大镜: 筛选 / 搜索。
  search,
}

/// 以矢量路径绘制的图标。
///
/// [filled] 为 true 时使用实心填充, 否则使用描边,
/// 便于在选中态与常态之间做区分。
class VectorIcon extends StatelessWidget {
  final DrawerIconType type;
  final double size;
  final Color color;
  final double strokeWidth;

  const VectorIcon({
    super.key,
    required this.type,
    this.size = 24,
    required this.color,
    this.strokeWidth = 1.8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _VectorIconPainter(
          type: type,
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class _VectorIconPainter extends CustomPainter {
  final DrawerIconType type;
  final Color color;
  final double strokeWidth;

  const _VectorIconPainter({
    required this.type,
    required this.color,
    required this.strokeWidth,
  });

  /// 齿轮的齿数与几何参数 (以 24×24 为设计栅格)。
  static const int _teeth = 8;
  static const double _outerR = 9.2;
  static const double _rootR = 7.0;
  static const double _holeR = 2.7;

  @override
  void paint(Canvas canvas, Size size) {
    // 统一在 24×24 设计栅格上绘制, 再整体缩放到目标尺寸。
    final scale = size.width / 24.0;
    canvas.save();
    canvas.scale(scale);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth / scale
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    switch (type) {
      case DrawerIconType.settings:
        _paintGear(canvas, paint);
      case DrawerIconType.search:
        _paintSearch(canvas, paint);
    }

    canvas.restore();
  }

  /// 齿轮: 由交替的齿顶/齿根圆弧连成的闭合轮廓, 中心留圆孔。
  void _paintGear(Canvas canvas, Paint paint) {
    const center = Offset(12, 12);
    const step = math.pi * 2 / _teeth;
    // 每颗齿占步进角的一半, 其余为齿间空隙。
    const toothHalf = step * 0.28;

    final path = Path();
    for (var i = 0; i < _teeth; i++) {
      final base = i * step - math.pi / 2;
      final points = <Offset>[
        // 齿根 → 齿顶 → 齿顶 → 齿根
        _polar(center, _rootR, base - step / 2 + toothHalf * 0.35),
        _polar(center, _outerR, base - toothHalf * 0.5),
        _polar(center, _outerR, base + toothHalf * 0.5),
        _polar(center, _rootR, base + step / 2 - toothHalf * 0.35),
      ];
      if (i == 0) {
        path.moveTo(points.first.dx, points.first.dy);
      }
      for (final p in points) {
        path.lineTo(p.dx, p.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);

    // 中心圆孔
    canvas.drawCircle(center, _holeR, paint);
  }

  /// 放大镜: 圆环 + 手柄。
  void _paintSearch(Canvas canvas, Paint paint) {
    canvas.drawCircle(const Offset(10.6, 10.6), 6.3, paint);
    canvas.drawLine(
      const Offset(15.3, 15.3),
      const Offset(20.2, 20.2),
      paint,
    );
  }

  /// 极坐标转直角坐标。
  static Offset _polar(Offset c, double r, double angle) =>
      Offset(c.dx + r * math.cos(angle), c.dy + r * math.sin(angle));

  @override
  bool shouldRepaint(_VectorIconPainter old) =>
      old.type != type ||
      old.color != color ||
      old.strokeWidth != strokeWidth;
}
