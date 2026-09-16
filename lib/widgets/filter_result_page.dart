import 'package:flutter/material.dart';

import '../core/kanji_filter.dart';
import '../core/kanji_reading_dict.dart';
import '../core/strings.dart';
import '../theme.dart';
import 'single_kanji_view.dart';

/// 全屏筛选结果界面。
///
/// 按条件筛选汉字并以网格展示; 内容超出一屏时右侧出现可拖动的滚动条。
class FilterResultPage extends StatefulWidget {
  final KanjiFilter filter;

  const FilterResultPage({super.key, required this.filter});

  @override
  State<FilterResultPage> createState() => _FilterResultPageState();
}

class _FilterResultPageState extends State<FilterResultPage> {
  final _scrollController = ScrollController();

  late final List<KanjiReading> _results = widget.filter.apply(
    kanjiReadingDict.values,
  );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _openDetail(KanjiReading reading) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _KanjiDetailPage(reading: reading),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.resultsTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                s.resultCount(_results.length),
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _results.isEmpty
          ? _buildEmpty()
          : Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(3),
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(16, 8, 24, 32),
                gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 96,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: _results.length,
                itemBuilder: (context, i) => _KanjiCell(
                  reading: _results[i],
                  onTap: () => _openDetail(_results[i]),
                ),
              ),
            ),
    );
  }

  Widget _buildEmpty() {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded,
                size: 40, color: colors.textSecondary),
            const SizedBox(height: 14),
            Text(
              s.noResultsTitle,
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              s.noResultsHint,
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.textSecondary, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

/// 网格中的单个汉字格子。
class _KanjiCell extends StatelessWidget {
  final KanjiReading reading;
  final VoidCallback onTap;

  const _KanjiCell({required this.reading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              reading.kanji,
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 30,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              AppStrings.of(context).strokesShort(reading.strokes),
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 由筛选结果点入的汉字详情页。
class _KanjiDetailPage extends StatefulWidget {
  final KanjiReading reading;

  const _KanjiDetailPage({required this.reading});

  @override
  State<_KanjiDetailPage> createState() => _KanjiDetailPageState();
}

class _KanjiDetailPageState extends State<_KanjiDetailPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.reading.kanji)),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thickness: 6,
        radius: const Radius.circular(3),
        child: SingleChildScrollView(
          controller: _scrollController,
          primary: false,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: SingleKanjiView(reading: widget.reading),
        ),
      ),
    );
  }
}
