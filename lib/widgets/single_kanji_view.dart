import 'package:flutter/material.dart';

import '../core/kana_romaji.dart';
import '../core/kanji_reading_dict.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHero(),
        const SizedBox(height: 14),
        if (reading.hasOnyomi)
          _ReadingGroup(
            label: '音読',
            sublabel: '音读 · 音読み',
            badge: '汉音系',
            color: AppTheme.accent,
            readings: reading.onyomi,
            maxItems: maxPerGroup,
          ),
        if (reading.hasOnyomi && reading.hasKunyomi)
          const SizedBox(height: 12),
        if (reading.hasKunyomi)
          _ReadingGroup(
            label: '訓読',
            sublabel: '训读 · 訓読み',
            badge: '和语系',
            color: AppTheme.indigo,
            readings: reading.kunyomi,
            maxItems: maxPerGroup,
          ),
        if (!reading.hasOnyomi && !reading.hasKunyomi)
          const _NoReadingNotice(),
      ],
    );
  }

  Widget _buildHero() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.border),
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
              color: AppTheme.kanjiHighlight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.kanjiHighlight.withValues(alpha: 0.4),
              ),
            ),
            child: Text(
              reading.kanji,
              style: const TextStyle(
                color: AppTheme.kanjiHighlight,
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
                // 中文释义
                if (reading.meanings.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: reading.meanings
                        .map(
                          (m) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              m,
                              style: const TextStyle(
                                color: AppTheme.textPrimary,
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
                    _metaItem('笔画', '${reading.strokes}'),
                    _metaItem('学年', _gradeLabel(reading.grade)),
                    _metaItem('频率', 'No.${reading.frequencyRank}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metaItem(String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$label ',
            style: const TextStyle(
                color: AppTheme.textSecondary, fontSize: 11)),
        Text(value,
            style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  static String _gradeLabel(int grade) {
    if (grade >= 1 && grade <= 6) return '$grade 年级';
    if (grade == 8) return '常用';
    if (grade == 9 || grade == 10) return '人名用';
    return '其它';
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
    final overflows = widget.readings.length > widget.maxItems;
    final visible = (_expanded || !overflows)
        ? widget.readings
        : widget.readings.take(widget.maxItems).toList();
    final hidden = widget.readings.length - visible.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.border),
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
                style: const TextStyle(
                    color: AppTheme.textSecondary, fontSize: 11),
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
                    _expanded ? '收起' : '等 $hidden 项',
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
    // 训读可能带送假名标记, 如 まな(ぶ) / (び), 需清理后再转罗马音。
    final pure = reading.replaceAll(RegExp(r'[()]'), '');
    final romaji = hiraganaToRomaji(pure);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: AppTheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.border),
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
            style: const TextStyle(
              color: AppTheme.textSecondary,
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.border),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline_rounded,
              size: 16, color: AppTheme.textSecondary),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '字典中未收录该字的音读 / 训读',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
