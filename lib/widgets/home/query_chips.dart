import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/kanji_services.dart';
import '../../core/strings.dart';
import '../../theme.dart';
import '../anki_export_sheet.dart';
import '../feedback.dart';

/// 聚焦态显示的收藏与最近查询词条, 展开后随动画淡出。
class QueryChips extends StatelessWidget {
  /// 展开动画值, 决定透明度与可交互性。
  final double t;

  final ValueChanged<String> onUseQuery;

  const QueryChips({
    super.key,
    required this.t,
    required this.onUseQuery,
  });

  @override
  Widget build(BuildContext context) {
    final opacity = (1 - t).clamp(0.0, 1.0);
    if (opacity <= 0.001) return const SizedBox.shrink();

    final store = KanjiServices.of(context).queryStore;
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) {
        final favorites = store.favorites;
        final history = store.history;
        if (favorites.isEmpty && history.isEmpty) {
          return const SizedBox.shrink();
        }

        return Opacity(
          opacity: opacity,
          child: IgnorePointer(
            ignoring: opacity < 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 14),
                if (favorites.isNotEmpty)
                  _buildChipSection(
                    context,
                    icon: Icons.star_rounded,
                    label: AppStrings.of(context).favoritesLabel,
                    items: favorites,
                    favorite: true,
                  ),
                if (favorites.isNotEmpty && history.isNotEmpty)
                  const SizedBox(height: 12),
                if (history.isNotEmpty)
                  _buildChipSection(
                    context,
                    icon: Icons.history_rounded,
                    label: AppStrings.of(context).historyLabel,
                    items: history,
                    favorite: false,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 一组查询词条: 小标签行 + 横向滑动的 chip。
  Widget _buildChipSection(
    BuildContext context, {
    required IconData icon,
    required String label,
    required List<String> items,
    required bool favorite,
  }) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    final store = KanjiServices.of(context).queryStore;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 13, color: colors.textSecondary),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              // 收藏提供导出为 Anki / TSV; 历史提供清空。
              if (favorite)
                Semantics(
                  button: true,
                  child: GestureDetector(
                    onTap: () =>
                        AnkiExportSheet.show(context, favorites: items),
                    child: Text(
                      s.export,
                      style: const TextStyle(
                        color: AppTheme.accent,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              else () {
                void onClear() {
                  HapticFeedback.lightImpact();
                  store.clearHistory();
                  showToast(context, s.historyCleared);
                }

                return Semantics(
                  button: true,
                  onTap: onClear,
                  child: GestureDetector(
                    onTap: onClear,
                    child: Text(
                      s.clearHistory,
                      style: TextStyle(
                        color: colors.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ),
                );
              }(),
            ],
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  if (i > 0) const SizedBox(width: 8),
                  _QueryChip(
                    text: items[i],
                    favorite: favorite,
                    onTap: () => onUseQuery(items[i]),
                    onLongPress: () {
                      HapticFeedback.lightImpact();
                      final item = items[i];
                      if (favorite) {
                        store.toggleFavorite(item);
                        showToast(context, s.favoriteRemoved(item));
                      } else {
                        store.removeHistory(item);
                        showToast(context, s.historyRemoved(item));
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 空态下的一条查询记录 / 收藏词条。
class _QueryChip extends StatelessWidget {
  final String text;
  final bool favorite;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _QueryChip({
    required this.text,
    required this.favorite,
    required this.onTap,
    required this.onLongPress,
  });

  /// chip 上最多显示的字符数 (按 rune 计), 超出省略。
  static const _maxDisplay = 12;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final runes = text.runes.toList();
    final display = runes.length > _maxDisplay
        ? '${String.fromCharCodes(runes.take(_maxDisplay))}…'
        : text;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: favorite
                ? AppTheme.kanjiHighlight.withValues(alpha: 0.4)
                : colors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (favorite) ...[
              const Icon(
                Icons.star_rounded,
                size: 13,
                color: AppTheme.kanjiHighlight,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              display,
              style: TextStyle(color: colors.textPrimary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
