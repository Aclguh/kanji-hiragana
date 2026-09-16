import 'package:flutter/material.dart';

import '../core/kana_romaji.dart';
import '../core/kanji_reading_dict.dart';
import '../core/strings.dart';
import '../theme.dart';

/// 单汉字详解视图: 展示该字的音读与训读。
///
/// 音读(音読み)与训读(訓読み)分行列出, 每行标注对应的罗马音。
class SingleKanjiView extends StatelessWidget {
  final KanjiReading reading;

  /// 每一类读音最多展示多少条, 超出部分折叠为「等 N 项」。
  static const int maxPerGroup = 8;

  const SingleKanjiView({super.key, required this.reading});

  @override
  Widget build(BuildContext context) {
    final s = AppStrings.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHero(context),
        const SizedBox(height: 14),
        if (reading.hasOnyomi)
          _ReadingGroup(
            label: s.onyomiHeading,
            sublabel: s.onyomiHint,
            badge: s.onyomiBadge,
            color: AppTheme.accent,
            readings: reading.onyomi,
            maxItems: maxPerGroup,
          ),
        if (reading.hasOnyomi && reading.hasKunyomi)
          const SizedBox(height: 12),
        if (reading.hasKunyomi)
          _ReadingGroup(
            label: s.kunyomiHeading,
            sublabel: s.kunyomiHint,
            badge: s.kunyomiBadge,
            color: AppTheme.indigo,
            readings: reading.kunyomi,
            maxItems: maxPerGroup,
          ),
        if (!reading.hasOnyomi && !reading.hasKunyomi)
          const _NoReadingNotice(),
      ],
    );
  }

  Widget _buildHero(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    // 释义按当前语言取用: KANJIDIC2 的英文原文比中文回译更准确。
    // 个别字没有英文条目时回落到中文, 避免出现空白。
    final meanings = s.language == AppLanguage.en && reading.meaningsEn.isNotEmpty
        ? reading.meaningsEn
        : reading.meanings;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 大号汉字
          Container(
            width: 84,
            height: 84,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.kanjiHighlight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colors.kanjiHighlight.withValues(alpha: 0.4),
              ),
            ),
            child: Text(
              reading.kanji,
              style: TextStyle(
                color: colors.kanjiHighlight,
                fontSize: 46,
                fontWeight: FontWeight.w600,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 释义
                if (meanings.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: meanings
                        .map(
                          (m) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: colors.surfaceVariant,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              m,
                              style: TextStyle(
                                color: colors.textPrimary,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                const SizedBox(height: 12),
                // 元信息
                Wrap(
                  spacing: 14,
                  runSpacing: 4,
                  children: [
                    _metaItem(context, s.labelStrokes, '${reading.strokes}'),
                    _metaItem(
                        context, s.labelGrade, _gradeLabel(s, reading.grade)),
                    _metaItem(
                        context, s.labelFrequency, 'No.${reading.frequencyRank}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metaItem(BuildContext context, String label, String value) {
    final colors = AppTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$label ',
            style: TextStyle(color: colors.textSecondary, fontSize: 11)),
        Text(value,
            style: TextStyle(
                color: colors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  static String _gradeLabel(AppStrings s, int grade) {
    if (grade >= 1 && grade <= 6) return s.gradeNumbered(grade);
    if (grade == 8) return s.gradeCommon;
    if (grade == 9 || grade == 10) return s.gradeNameUse;
    return s.gradeOther;
  }
}

/// 一组读音(音读或训读)。
class _ReadingGroup extends StatefulWidget {
  final String label;
  final String sublabel;
  final String badge;
  final Color color;
  final List<String> readings;
  final int maxItems;

  const _ReadingGroup({
    required this.label,
    required this.sublabel,
    required this.badge,
    required this.color,
    required this.readings,
    required this.maxItems,
  });

  @override
  State<_ReadingGroup> createState() => _ReadingGroupState();
}

class _ReadingGroupState extends State<_ReadingGroup> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final overflows = widget.readings.length > widget.maxItems;
    final visible = (_expanded || !overflows)
        ? widget.readings
        : widget.readings.take(widget.maxItems).toList();
    final hidden = widget.readings.length - visible.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 16,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.sublabel,
                style:
                    TextStyle(color: colors.textSecondary, fontSize: 11),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  widget.badge,
                  style: TextStyle(color: widget.color, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 读音列表: 每个读音显示平假名 + 罗马音
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: visible
                .map((r) => _ReadingChip(reading: r, color: widget.color))
                .toList(),
          ),
          if (overflows) ...[
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _expanded
                        ? AppStrings.of(context).collapse
                        : AppStrings.of(context).collapseHidden(hidden),
                    style: TextStyle(
                        color: widget.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 3),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 16,
                    color: widget.color,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// 单个读音条目: 平假名 + 罗马音。
class _ReadingChip extends StatelessWidget {
  final String reading;
  final Color color;

  const _ReadingChip({required this.reading, required this.color});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    // 训读可能带送假名标记, 如 まな(ぶ) / (び), 需清理后再转罗马音。
    final pure = reading.replaceAll(RegExp(r'[()]'), '');
    final romaji = hiraganaToRomaji(pure);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            reading,
            style: TextStyle(
              color: color,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            romaji,
            style: TextStyle(
              color: colors.textSecondary,
              fontSize: 11,
              fontStyle: FontStyle.italic,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _NoReadingNotice extends StatelessWidget {
  const _NoReadingNotice();

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
          Icon(Icons.info_outline_rounded,
              size: 16, color: colors.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              AppStrings.of(context).readingsNotFound,
              style: TextStyle(color: colors.textSecondary, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
