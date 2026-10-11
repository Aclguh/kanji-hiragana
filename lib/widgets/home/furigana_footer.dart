import 'package:flutter/material.dart';

import '../../core/morpheme.dart';
import '../../core/strings.dart';
import '../../core/tts_service.dart';
import '../../theme.dart';
import '../feedback.dart';

/// 振假名视图页脚: 全文平假名与实际发音, 支持复制与发音。
class FuriganaFooter extends StatelessWidget {
  final AnalysisResult result;

  const FuriganaFooter({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
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
        children: [
          FooterLine(
            icon: Icons.volume_up_rounded,
            label: s.labelHiragana,
            value: result.fullHiragana,
            color: AppTheme.accent,
            copyTip: s.copiedFullHiragana,
          ),
          // 存在发音差异时补充一行实际发音。
          if (result.hasAnyPronunciationShift) ...[
            const SizedBox(height: 10),
            FooterLine(
              icon: Icons.record_voice_over_rounded,
              label: s.labelPronunciation,
              value: result.fullPronunciation,
              color: colors.textSecondary,
              copyTip: s.copiedPronunciation,
            ),
          ],
        ],
      ),
    );
  }
}

/// 页脚中的一行: 图标 + 标签 + 可选中内容 + 发音/复制按钮。
class FooterLine extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String copyTip;

  const FooterLine({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.copyTip,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 8),
        SizedBox(
          width: 58,
          child: Text(
            label,
            style: TextStyle(color: colors.textSecondary, fontSize: 11),
          ),
        ),
        Expanded(
          child: SelectableText(
            value,
            style: TextStyle(
              color: colors.textPrimary,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
        IconButton(
          tooltip: s.speak,
          iconSize: 18,
          onPressed: () async {
            final ok = await TtsService.instance.speak(value);
            if (!ok && context.mounted) {
              final available = await TtsService.instance.isAvailable();
              if (!available && context.mounted) {
                showToast(context, s.ttsUnavailable);
              }
            }
          },
          icon: const Icon(Icons.volume_up_rounded, color: AppTheme.accent),
        ),
        IconButton(
          tooltip: s.copy,
          iconSize: 18,
          onPressed: () => copyWithToast(context, value, copyTip),
          icon: Icon(Icons.copy_rounded, color: colors.textSecondary),
        ),
      ],
    );
  }
}
