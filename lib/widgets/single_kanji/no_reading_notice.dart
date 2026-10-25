import 'package:flutter/material.dart';

import '../../theme.dart';
import 'package:kanji_hiragana/widgets/app_scopes.dart';

/// 查不到音训读时的提示卡片。
class NoReadingNotice extends StatelessWidget {
  const NoReadingNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 16,
            color: colors.textSecondary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              AppStringsScope.of(context).readingsNotFound,
              style: TextStyle(color: colors.textSecondary, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
