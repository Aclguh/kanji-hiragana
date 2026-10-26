import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 驱动「聚焦态 ↔ 展开态」平滑过渡的动画布局容器。
///
/// - 聚焦态 (progress -> 0): 标题与搜索框整体在视口中自适应垂直居中。
/// - 展开态 (progress -> 1): 搜索框上移至顶部，工具栏与结果区自下向上滑动淡入。
class HomeAnimatedBody extends StatelessWidget {
  final Animation<double> animation;
  final bool buttonsVisible;
  final Widget Function(double t) heroTitle;
  final Widget Function(double t) searchInput;
  final Widget Function(double t) queryChips;
  final Widget Function(double t) revealSliver;

  const HomeAnimatedBody({
    super.key,
    required this.animation,
    required this.buttonsVisible,
    required this.heroTitle,
    required this.searchInput,
    required this.queryChips,
    required this.revealSliver,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final t = Curves.easeOutCubic.transform(animation.value);
        return LayoutBuilder(
          builder: (context, constraints) {
            // 聚焦态: 让「标题 + 输入框」整体在视觉上居中。
            // 估算该组内容高度 (标题约 92 + 输入框约 58 + 间距 24)。
            const focusBlockHeight = 174.0;
            final centeredTop = (constraints.maxHeight - focusBlockHeight) / 2;
            final maxLimit = constraints.maxHeight * 0.42;
            final clampedTop = maxLimit < 24.0
                ? math.max(0.0, centeredTop)
                : centeredTop.clamp(24.0, maxLimit);
            final topSpace = _lerp(
              12.0,
              clampedTop,
              1 - t,
            );
            final bottomSpace =
                MediaQuery.of(context).viewInsets.bottom +
                (buttonsVisible ? 88 : 24);

            return CustomScrollView(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: topSpace),
                  sliver: SliverList.list(
                    children: [
                      heroTitle(t),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: searchInput(t),
                      ),
                      queryChips(t),
                    ],
                  ),
                ),
                if (t > 0.001)
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      18 * (1 - t),
                      16,
                      0,
                    ),
                    sliver: SliverIgnorePointer(
                      ignoring: t < 0.5,
                      sliver: SliverOpacity(
                        opacity: t.clamp(0.0, 1.0),
                        sliver: revealSliver(t),
                      ),
                    ),
                  ),
                SliverToBoxAdapter(child: SizedBox(height: bottomSpace)),
              ],
            );
          },
        );
      },
    );
  }
}

double _lerp(double a, double b, double t) => a + (b - a) * t;
