import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/morpheme.dart';
import '../core/strings.dart';
import '../core/tts_service.dart';
import '../theme.dart';
import 'feedback.dart';

/// 和风传统竖排排版模式 (纵书 / 縦書き 视图)。
///
/// 遵循日本传统文库本与典籍的竖排排版规则:
/// - 右向左分页推进 (RTL 横向流动)。
/// - 文字由上而下直行书写。
/// - 汉字右侧紧贴振假名标注 (ルビ)。
/// - 长音符「ー」90度旋转为纵向延展。
/// - 支持单词点按发音、复制与外来语源词查看。
class VerticalView extends StatelessWidget {
  final AnalysisResult result;
  final bool showRomaji;

  const VerticalView({
    super.key,
    required this.result,
    required this.showRomaji,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);

    // 段落划分: 若无段落则退回单一段落
    final paragraphs = result.paragraphs.isNotEmpty
        ? result.paragraphs
        : [result.morphemes];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 280),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: colors.border),
          ),
          child: SingleChildScrollView(
            // 传统纵书从右往左滚动
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                for (var i = 0; i < paragraphs.length; i++) ...[
                  if (i > 0) const SizedBox(width: 24),
                  _buildParagraph(context, paragraphs[i]),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        _VerticalFooter(result: result, s: s),
      ],
    );
  }

  Widget _buildParagraph(BuildContext context, List<Morpheme> morphemes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (final m in morphemes)
          _VerticalMorphemeItem(
            morpheme: m,
            showRomaji: showRomaji,
          ),
      ],
    );
  }
}

/// 单个词素在纵书中的排版单元。
class _VerticalMorphemeItem extends StatelessWidget {
  final Morpheme morpheme;
  final bool showRomaji;

  const _VerticalMorphemeItem({
    required this.morpheme,
    required this.showRomaji,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    final hasRuby = morpheme.needsAnnotation;
    final loanword = morpheme.loanword;

    return Semantics(
      label: '${morpheme.surface}, ${morpheme.hiragana}',
      button: true,
      child: InkWell(
        onTap: () {
          // 点击复制并播放发音
          TtsService.instance.speak(morpheme.pronunciationHiragana);
          copyWithToast(context, morpheme.surface, s.copiedSurface(morpheme.surface));
        },
        onLongPress: () {
          // 长按查看外来语或词性详情
          if (loanword != null) {
            showToast(context, s.loanwordOrigin(loanword.source));
          } else if (morpheme.isConjugated) {
            showToast(context, s.baseForm(morpheme.basicForm));
          } else {
            Clipboard.setData(ClipboardData(text: morpheme.hiragana));
            showToast(context, s.copiedSurface(morpheme.hiragana));
          }
        },
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              // 主词面 (由上至下字符排列)
              _buildVerticalSurface(context, colors),
              // 振假名 (紧贴汉字右侧, 字号较小)
              if (hasRuby) ...[
                const SizedBox(width: 3),
                _buildFuriganaRuby(colors),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalSurface(BuildContext context, AppColors colors) {
    final isShift = morpheme.hasPronunciationShift;
    final isParticle = morpheme.isParticleShift;
    final textColor = isParticle
        ? AppTheme.accent
        : (isShift ? AppTheme.kanjiHighlight : colors.textPrimary);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < morpheme.surface.length; i++)
          _buildChar(morpheme.surface[i], textColor),
        if (showRomaji && morpheme.romaji.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              morpheme.romaji,
              style: const TextStyle(
                color: AppTheme.indigo,
                fontSize: 9,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChar(String char, Color color) {
    // 日语竖排长音符「ー」需旋转 90 度呈竖线
    if (char == 'ー') {
      return Transform.rotate(
        angle: math.pi / 2,
        child: Text(
          'ー',
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      );
    }

    // 句号、顿号在竖排中靠右上角
    if (char == '。' || char == '、') {
      return Transform.translate(
        offset: const Offset(4, -4),
        child: Text(
          char,
          style: TextStyle(color: color, fontSize: 16, height: 1.0),
        ),
      );
    }

    return Text(
      char,
      style: TextStyle(
        color: color,
        fontSize: 19,
        fontWeight: FontWeight.w500,
        height: 1.25,
      ),
    );
  }

  Widget _buildFuriganaRuby(AppColors colors) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < morpheme.hiragana.length; i++)
          Text(
            morpheme.hiragana[i],
            style: TextStyle(
              color: colors.textSecondary.withValues(alpha: 0.9),
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
      ],
    );
  }
}

/// 纵书视图底部摘要栏与操作。
class _VerticalFooter extends StatelessWidget {
  final AnalysisResult result;
  final AppStrings s;

  const _VerticalFooter({required this.result, required this.s});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final hasShift = result.hasAnyPronunciationShift;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          // TTS 朗读发音按钮
          IconButton(
            icon: const Icon(Icons.volume_up_rounded, size: 20),
            color: AppTheme.accent,
            tooltip: s.speak,
            onPressed: () => TtsService.instance.speak(result.fullPronunciation),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hasShift ? result.fullPronunciation : result.fullHiragana,
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy_rounded, size: 18),
            color: colors.textSecondary,
            tooltip: s.copiedFullHiragana,
            onPressed: () =>
                copyWithToast(context, result.fullHiragana, s.copiedFullHiragana),
          ),
        ],
      ),
    );
  }
}
