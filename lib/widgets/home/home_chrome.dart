import 'package:flutter/material.dart';

import '../../core/query_store.dart';
import '../../theme.dart';
import '../app_scopes.dart';
import '../vector_icon.dart';
import 'floating_button.dart';

/// 查询态顶部栏。
class HomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final QueryStore queryStore;
  final VoidCallback onToggleFavorite;
  final VoidCallback onClear;

  const HomeTopBar({
    super.key,
    required this.controller,
    required this.queryStore,
    required this.onToggleFavorite,
    required this.onClear,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    return AppBar(
      title: Row(
        children: [
          const Text('漢字'),
          const SizedBox(width: 6),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 16,
            color: AppTheme.accent,
          ),
          const SizedBox(width: 6),
          const Text('かな'),
          const SizedBox(width: 10),
          Text('·', style: TextStyle(color: colors.textSecondary)),
          const SizedBox(width: 10),
          const Text(
            'ローマ字',
            style: TextStyle(
              color: AppTheme.indigo,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        AnimatedBuilder(
          animation: queryStore,
          builder: (context, _) {
            final favorite = queryStore.isFavorite(controller.text);
            return IconButton(
              tooltip: s.favoritesLabel,
              onPressed: onToggleFavorite,
              icon: Icon(
                favorite ? Icons.star_rounded : Icons.star_border_rounded,
                color: favorite ? AppTheme.kanjiHighlight : null,
              ),
            );
          },
        ),
        IconButton(
          tooltip: s.clear,
          onPressed: onClear,
          icon: const Icon(Icons.delete_outline_rounded),
        ),
      ],
    );
  }
}

/// 主界面左右下角的抽屉入口按钮。
class HomeFloatingButtons extends StatelessWidget {
  final bool visible;
  final VoidCallback onFilter;
  final VoidCallback onSettings;

  const HomeFloatingButtons({
    super.key,
    required this.visible,
    required this.onFilter,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppStringsScope.of(context);
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !visible,
        child: AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: const Duration(milliseconds: 320),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: FloatingDrawerButton(
                    type: DrawerIconType.search,
                    tooltip: s.filterKanji,
                    onTap: onFilter,
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: FloatingDrawerButton(
                    type: DrawerIconType.settings,
                    tooltip: s.settings,
                    onTap: onSettings,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 超长结果的分段提示。
class HomeLongResultNotice extends StatelessWidget {
  final int shown;
  final int total;
  final bool showAll;
  final VoidCallback onToggle;

  const HomeLongResultNotice({
    super.key,
    required this.shown,
    required this.total,
    required this.showAll,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              showAll
                  ? s.allResultsShown(total)
                  : s.longResultNotice(shown, total),
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 11,
                height: 1.35,
              ),
            ),
          ),
          TextButton(
            onPressed: onToggle,
            child: Text(showAll ? s.showLessResults : s.showAllResults),
          ),
        ],
      ),
    );
  }
}

/// 通用错误 / 空态消息。
class HomeMessageView extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color? color;

  const HomeMessageView({
    super.key,
    required this.icon,
    required this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 36, color: color ?? colors.textSecondary),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.textSecondary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

/// 词典预热中的加载态。
class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: AppTheme.accent),
          const SizedBox(height: 16),
          Text(
            s.loadingDictionary,
            style: TextStyle(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
