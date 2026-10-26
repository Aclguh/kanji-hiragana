import 'package:flutter/material.dart';

import '../core/morpheme.dart';
import '../theme.dart';

/// 注音视图: 类似日语教材 / 振假名(Furigana)排版,
/// 在汉字上方以小字标注平假名读音, 下方可选显示罗马音。
class FuriganaView extends StatelessWidget {
  final AnalysisResult result;
  final bool showRomaji;

  const FuriganaView({
    super.key,
    required this.result,
    this.showRomaji = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final paragraphs = result.paragraphs.isNotEmpty
        ? result.paragraphs
        : [result.morphemes];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var p = 0; p < paragraphs.length; p++) ...[
            if (p > 0) const SizedBox(height: 18),
            // 长段落支持分块布局, 避免单个超大 Wrap (数百个 RenderBox) 引发测量峰值
            ..._buildParagraphWraps(paragraphs[p]),
          ],
        ],
      ),
    );
  }

  /// 将单个段落按合理批次分块构建 Wrap, 降低超长段落下的单个布局节点树深度。
  List<Widget> _buildParagraphWraps(List<Morpheme> morphemes) {
    const chunkSize = 50;
    if (morphemes.length <= chunkSize) {
      return [
        RepaintBoundary(
          child: Wrap(
            spacing: 2,
            runSpacing: 18,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: morphemes
                .map((m) =>
                    _FuriganaToken(morpheme: m, showRomaji: showRomaji))
                .toList(),
          ),
        ),
      ];
    }

    final wraps = <Widget>[];
    for (var i = 0; i < morphemes.length; i += chunkSize) {
      final end = (i + chunkSize < morphemes.length)
          ? i + chunkSize
          : morphemes.length;
      final chunk = morphemes.sublist(i, end);
      wraps.add(
        RepaintBoundary(
          child: Wrap(
            spacing: 2,
            runSpacing: 18,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: chunk
                .map((m) =>
                    _FuriganaToken(morpheme: m, showRomaji: showRomaji))
                .toList(),
          ),
        ),
      );
    }
    return wraps;
  }
}

class _FuriganaToken extends StatelessWidget {
  final Morpheme morpheme;
  final bool showRomaji;

  const _FuriganaToken({required this.morpheme, required this.showRomaji});

  @override
  Widget build(BuildContext context) {
    final m = morpheme;
    final colors = AppTheme.of(context);
    // 纯假名词无需在上方重复注音。
    final showRuby = m.needsAnnotation;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 振假名(读音)行, 保持占位以对齐基线。
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 16),
            child: showRuby
                ? Text(
                    m.hiragana,
                    style: const TextStyle(
                      color: AppTheme.accent,
                      fontSize: 12,
                      height: 1.1,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : const SizedBox(height: 16),
          ),
          const SizedBox(height: 2),
          // 原词
          Text(
            m.surface,
            style: TextStyle(
              color: m.containsKanji
                  ? colors.textPrimary
                  : colors.textSecondary,
              fontSize: 24,
              height: 1.15,
              fontWeight:
                  m.containsKanji ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          // 罗马音
          if (showRomaji)
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                m.romaji,
                style: const TextStyle(
                  color: AppTheme.indigo,
                  fontSize: 11,
                  height: 1.1,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
