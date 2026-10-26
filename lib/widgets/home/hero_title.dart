import 'package:flutter/material.dart';

import '../../theme.dart';
import '../app_scopes.dart';

/// 聚焦态显示的品牌标题, 展开后淡出。
///
/// 「漢字仮名」四字任何语言下都保持繁体原样, 作为应用标识。
class HeroTitle extends StatelessWidget {
  final double t;

  const HeroTitle({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    final opacity = (1 - t).clamp(0.0, 1.0);
    if (opacity <= 0.001) return const SizedBox(height: 4);

    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            Text(
              '漢字仮名',
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              s.tagline,
              style: TextStyle(
                color: colors.textSecondary.withValues(alpha: 0.9),
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
