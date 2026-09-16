import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/morpheme.dart';
import '../core/strings.dart';
import '../theme.dart';

/// 对照表视图: 逐词以「汉字 / 平假名 / 罗马音」三列并排呈现对应关系,
/// 类似翻译软件的对照排版。
class AlignmentTable extends StatelessWidget {
  final AnalysisResult result;
  final bool showRomaji;

  const AlignmentTable({
    super.key,
    required this.result,
    this.showRomaji = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(context),
        const SizedBox(height: 8),
        ...result.morphemes.map(
          (m) => _MorphemeRow(morpheme: m, showRomaji: showRomaji),
        ),
        const SizedBox(height: 16),
        _buildSummary(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    final style = TextStyle(
      color: colors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(s.columnKanji, style: style)),
          Expanded(flex: 3, child: Text(s.columnHiragana, style: style)),
          if (showRomaji)
            Expanded(flex: 3, child: Text(s.columnRomaji, style: style)),
        ],
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _summaryLine(
              context, Icons.translate_rounded, s.fullHiragana, result.fullHiragana),
          const SizedBox(height: 10),
          _summaryLine(
              context, Icons.abc_rounded, s.fullRomaji, result.fullRomaji),
        ],
      ),
    );
  }

  Widget _summaryLine(BuildContext context, IconData icon, String label, String value) {
    final colors = AppTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppTheme.accent),
        const SizedBox(width: 8),
        SizedBox(
          width: 72,
          child: Text(label,
              style: TextStyle(color: colors.textSecondary, fontSize: 12)),
        ),
        Expanded(
          child: SelectableText(
            value,
            style: TextStyle(
              color: colors.textPrimary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

/// 单行对照。
class _MorphemeRow extends StatelessWidget {
  final Morpheme morpheme;
  final bool showRomaji;

  const _MorphemeRow({required this.morpheme, required this.showRomaji});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final m = morpheme;
    final highlight = m.containsKanji;

    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: m.surface));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppStrings.of(context).copiedSurface(m.surface)),
            duration: const Duration(milliseconds: 900),
          ),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: highlight
              ? colors.kanjiHighlight.withValues(alpha: 0.10)
              : colors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: highlight
                ? colors.kanjiHighlight.withValues(alpha: 0.38)
                : colors.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 汉字 / 原词
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    m.surface,
                    style: TextStyle(
                      color: highlight
                          ? colors.kanjiHighlight
                          : colors.textPrimary,
                      fontSize: 20,
                      fontWeight:
                          highlight ? FontWeight.w700 : FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  _posChip(context, m.partOfSpeech),
                ],
              ),
            ),
            // 平假名(规范拼写)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    m.hiragana,
                    style: TextStyle(
                      color: colors.textPrimary,
                      fontSize: 19,
                      height: 1.2,
                    ),
                  ),
                  // 发音与规范读音不同时, 补充一行实际发音。
                  if (m.hasPronunciationShift) ...[
                    const SizedBox(height: 3),
                    _pronChip(context, m.pronunciationHiragana, m.isParticleShift),
                  ],
                ],
              ),
            ),
            // 罗马音
            if (showRomaji)
              Expanded(
                flex: 3,
                child: Text(
                  m.romaji,
                  style: const TextStyle(
                    color: AppTheme.indigo,
                    fontSize: 17,
                    height: 1.2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _posChip(BuildContext context, String pos) {
    if (pos.isEmpty) return const SizedBox.shrink();
    final colors = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        AppStrings.of(context).posLabel(pos),
        style: TextStyle(color: colors.textSecondary, fontSize: 10),
      ),
    );
  }

  /// 实际发音提示: 与规范读音不同时显示。
  ///
  /// 助词音变(は→わ)用朱红强调, 长音速记(とう→とー)用灰色弱化。
  Widget _pronChip(BuildContext context, String pronunciation, bool isParticleShift) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    final color = isParticleShift ? AppTheme.accent : colors.textSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isParticleShift
              ? '${s.pronunciationShiftLabel} '
              : '${s.labelPronunciation} ',
          style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 10),
        ),
        Text(
          pronunciation,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
