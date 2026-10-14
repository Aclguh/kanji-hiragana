import 'package:flutter/material.dart';

import '../core/kanji_homophones.dart';
import '../core/kanji_reading_dict.dart';
import '../core/kanji_words_dict.dart';
import '../core/strings.dart';
import '../core/yojijukugo_dict.dart';
import '../theme.dart';
import 'single_kanji/common_words_group.dart';
import 'single_kanji/homophones_group.dart';
import 'single_kanji/kanji_hero_card.dart';
import 'single_kanji/no_reading_notice.dart';
import 'single_kanji/reading_group.dart';
import 'single_kanji/yojijukugo_group.dart';

export 'single_kanji/collapse_footer.dart' show CollapseFooter;
export 'single_kanji/common_words_group.dart' show CommonWordsGroup;
export 'single_kanji/homophones_group.dart' show HomophonesGroup;
export 'single_kanji/kanji_hero_card.dart' show KanjiHeroCard;
export 'single_kanji/no_reading_notice.dart' show NoReadingNotice;
export 'single_kanji/reading_group.dart' show ReadingGroup;
export 'single_kanji/yojijukugo_group.dart' show YojijukugoGroup;

/// 单汉字详解视图: 展示该字的音读与训读。
///
/// 音读(音読み)与训读(訓読み)分行列出, 每行标注对应的罗马音;
/// 另附该字的常见搭配词, 帮助学习者直接看到「这个字在哪些词里」。
class SingleKanjiView extends StatelessWidget {
  final KanjiReading reading;
  final ValueChanged<String>? onWordTap;

  /// 每一类读音最多展示多少条, 超出部分折叠为「等 N 项」。
  static const int maxPerGroup = 8;

  const SingleKanjiView({super.key, required this.reading, this.onWordTap});

  @override
  Widget build(BuildContext context) {
    final s = AppStrings.of(context);
    // 常见搭配词来自构建期生成的 IPADIC 数据; 查不到的字整段省略。
    final words = kanjiWordsDict[reading.kanji] ?? const <KanjiWord>[];
    final homophones = KanjiHomophones.findHomophones(reading);
    final yojijukugo = getYojijukugoForKanji(reading.kanji);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KanjiHeroCard(reading: reading),
        const SizedBox(height: 14),
        if (reading.hasOnyomi)
          ReadingGroup(
            label: s.onyomiHeading,
            sublabel: s.onyomiHint,
            badge: s.onyomiBadge,
            color: AppTheme.accent,
            readings: reading.onyomi,
            maxItems: maxPerGroup,
          ),
        if (reading.hasOnyomi && reading.hasKunyomi) const SizedBox(height: 12),
        if (reading.hasKunyomi)
          ReadingGroup(
            label: s.kunyomiHeading,
            sublabel: s.kunyomiHint,
            badge: s.kunyomiBadge,
            color: AppTheme.indigo,
            readings: reading.kunyomi,
            maxItems: maxPerGroup,
          ),
        if (words.isNotEmpty) ...[
          const SizedBox(height: 12),
          CommonWordsGroup(words: words, onWordTap: onWordTap),
        ],
        if (homophones.isNotEmpty) ...[
          const SizedBox(height: 12),
          HomophonesGroup(homophones: homophones, onWordTap: onWordTap),
        ],
        if (yojijukugo.isNotEmpty) ...[
          const SizedBox(height: 12),
          YojijukugoGroup(entries: yojijukugo, onWordTap: onWordTap),
        ],
        if (!reading.hasOnyomi && !reading.hasKunyomi) const NoReadingNotice(),
      ],
    );
  }
}
