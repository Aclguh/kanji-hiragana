import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/kana_romaji.dart';
import '../../core/kanji_words_dict.dart';
import '../../theme.dart';
import '../feedback.dart';
import 'collapse_footer.dart';
import '../app_scopes.dart';

/// 常见搭配词组: 每词一行「词 | 平假名 | 罗马音」, 点按查词, 长按复制词面。
class CommonWordsGroup extends StatefulWidget {
  final List<KanjiWord> words;
  final ValueChanged<String>? onWordTap;

  /// 默认展示的词数, 超出折叠。
  static const int maxItems = 6;

  const CommonWordsGroup({
    super.key,
    required this.words,
    this.onWordTap,
  });

  @override
  State<CommonWordsGroup> createState() => _CommonWordsGroupState();
}

class _CommonWordsGroupState extends State<CommonWordsGroup> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    final color = colors.kanjiHighlight;
    final overflows = widget.words.length > CommonWordsGroup.maxItems;
    final visible = (_expanded || !overflows)
        ? widget.words
        : widget.words.take(CommonWordsGroup.maxItems).toList();
    final hidden = widget.words.length - visible.length;

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
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                s.commonWordsHeading,
                style: TextStyle(
                  color: color,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  s.commonWordsBadge(widget.words.length),
                  style: TextStyle(color: color, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          for (var i = 0; i < visible.length; i++) ...[
            if (i > 0) const SizedBox(height: 2),
            _WordRow(word: visible[i], onWordTap: widget.onWordTap),
          ],
          if (overflows) ...[
            const SizedBox(height: 8),
            CollapseFooter(
              expanded: _expanded,
              hidden: hidden,
              color: color,
              onToggle: () => setState(() => _expanded = !_expanded),
            ),
          ],
        ],
      ),
    );
  }
}

/// 单个常见词: 词面 + 平假名 + 罗马音, 点按查词, 长按复制词面。
class _WordRow extends StatelessWidget {
  final KanjiWord word;
  final ValueChanged<String>? onWordTap;

  const _WordRow({required this.word, this.onWordTap});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    final romaji = hiraganaToRomaji(word.hiragana);
    return InkWell(
      onTap: () {
        if (onWordTap != null) {
          onWordTap!(word.word);
        } else {
          copyWithToast(context, word.word, s.copiedSurface(word.word));
        }
      },
      onLongPress: () {
        HapticFeedback.lightImpact();
        copyWithToast(context, word.word, s.copiedSurface(word.word));
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            Text(
              word.word,
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (word.pos.isNotEmpty) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 1.5,
                ),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  s.posLabel(word.pos),
                  style: TextStyle(color: colors.textSecondary, fontSize: 10),
                ),
              ),
            ],
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                word.hiragana,
                style: TextStyle(color: colors.textSecondary, fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              romaji,
              style: TextStyle(
                color: colors.romaji,
                fontSize: 11,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
