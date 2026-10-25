import 'package:flutter/material.dart';

import '../../core/morpheme.dart';
import '../../theme.dart';
import '../alignment_table.dart';
import '../app_scopes.dart';
import '../furigana_view.dart';
import '../single_kanji_view.dart';
import '../vertical_view.dart';
import 'furigana_footer.dart';
import 'home_chrome.dart';
import 'home_coordinator.dart';
import 'home_toolbar.dart';

/// 主界面结果区的 sliver。
///
/// 对齐视图使用 `AlignmentTable(sliver: true)` 惰性构建词行;
/// 超长结果默认只展示前 [collapsedResultLimit] 项, 由调用方保留展开状态。
class HomeResultSliver extends StatelessWidget {
  static const int collapsedResultLimit = 400;

  final AnalysisResult? result;
  final HomeErrorKind? errorKind;
  final Object? errorDetail;
  final ViewMode viewMode;
  final bool showRomaji;
  final bool showAllResults;
  final VoidCallback onToggleShowAll;
  final ValueChanged<String> onWordTap;

  const HomeResultSliver({
    super.key,
    required this.result,
    required this.errorKind,
    required this.errorDetail,
    required this.viewMode,
    required this.showRomaji,
    required this.showAllResults,
    required this.onToggleShowAll,
    required this.onWordTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppStringsScope.of(context);
    if (errorKind != null) {
      final detail = errorDetail ?? '';
      final msg = switch (errorKind!) {
        HomeErrorKind.dictionary => s.dictionaryInitFailed(detail),
        HomeErrorKind.analysis => s.analysisFailedGeneric,
      };
      return SliverToBoxAdapter(
        child: HomeMessageView(
          icon: Icons.error_outline_rounded,
          message: msg,
          color: AppTheme.accent,
        ),
      );
    }

    final current = result;
    if (current == null || current.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox(height: 40));
    }

    final visible = _visibleResult(current);
    final hiddenCount = current.morphemes.length - visible.morphemes.length;

    return SliverMainAxisGroup(
      slivers: [
        if (hiddenCount > 0 || showAllResults)
          SliverToBoxAdapter(
            child: HomeLongResultNotice(
              shown: visible.morphemes.length,
              total: current.morphemes.length,
              showAll: showAllResults,
              onToggle: onToggleShowAll,
            ),
          ),
        if (current.isSingleKanji)
          SliverToBoxAdapter(
            child: SingleKanjiView(
              reading: current.singleKanji!,
              onWordTap: onWordTap,
            ),
          )
        else if (viewMode == ViewMode.alignment)
          AlignmentTable(
            result: visible,
            showRomaji: showRomaji,
            sliver: true,
          )
        else if (viewMode == ViewMode.furigana)
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FuriganaView(result: visible, showRomaji: showRomaji),
                const SizedBox(height: 16),
                FuriganaFooter(result: visible),
              ],
            ),
          )
        else
          SliverToBoxAdapter(
            child: VerticalView(result: visible, showRomaji: showRomaji),
          ),
      ],
    );
  }

  AnalysisResult _visibleResult(AnalysisResult source) {
    if (showAllResults ||
        source.isSingleKanji ||
        source.morphemes.length <= collapsedResultLimit) {
      return source;
    }

    final paragraphs = <List<Morpheme>>[];
    var remaining = collapsedResultLimit;
    final sourceParagraphs =
        source.paragraphs.isNotEmpty ? source.paragraphs : [source.morphemes];
    for (final paragraph in sourceParagraphs) {
      if (remaining <= 0) break;
      final take = paragraph.take(remaining).toList(growable: false);
      if (take.isEmpty) continue;
      paragraphs.add(take);
      remaining -= take.length;
    }
    final morphemes =
        paragraphs.expand((p) => p).toList(growable: false);
    return AnalysisResult(
      source: source.source,
      morphemes: morphemes,
      paragraphs: paragraphs,
      isTruncated: source.isTruncated,
    );
  }
}
