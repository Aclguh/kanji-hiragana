// 独立验证脚本: 不依赖 flutter_test, 直接用 dart 运行。
// 用法: dart run tool/verify.dart (须在仓库根目录, 断言会读 pubspec.yaml)
import 'dart:io';

import 'package:kanji_hiragana/core/app_meta.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/kana_romaji.dart';
import 'package:kanji_hiragana/core/kanji_filter.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';
import 'package:kanji_hiragana/core/kanji_words_dict.dart';

int _pass = 0;
int _fail = 0;

void expectEq(Object? actual, Object? expected, String label) {
  if (actual == expected) {
    _pass++;
    print('  OK   $label');
  } else {
    _fail++;
    print('  FAIL $label  -> 实际: $actual  期望: $expected');
  }
}

Future<void> main() async {
  print('--- 假名转换 ---');
  expectEq(katakanaToHiragana('ニッポン'), 'にっぽん', '片假名→平假名');
  expectEq(katakanaToHiragana('コーヒー'), 'こーひー', '长音保留');
  expectEq(hiraganaToRomaji('わたし'), 'watashi', '基本罗马音');
  expectEq(hiraganaToRomaji('しゃしん'), 'shashin', '拗音');
  expectEq(hiraganaToRomaji('がっこう'), 'gakkou', '促音');
  expectEq(hiraganaToRomaji('しんいち'), "shin'ichi", '拨音加撇');
  expectEq(hiraganaToRomaji('こーひー'), 'koohii', '长音延展');
  expectEq(katakanaToRomaji('ニッポンノブンカ'), 'nipponnobunka', '片假名直转');

  print('--- 字符判断 ---');
  expectEq(isKanji('日'), true, '汉字判断');
  expectEq(isKanji('あ'), false, '非汉字判断');
  expectEq(isKatakana('ー'), true, '长音符属片假名');

  print('--- 形态素分析(双轨: reading 标注 + pronunciation 发音) ---');
  final a = JapaneseAnalyzer.instance;

  final r1 = await a.analyze('日本の文化');
  expectEq(r1.morphemes.length, 3, '分词数量');
  expectEq(r1.morphemes[0].surface, '日本', '词1 原词');
  expectEq(r1.morphemes[0].hiragana, 'にっぽん', '词1 平假名');
  expectEq(r1.morphemes[0].romaji, 'nippon', '词1 罗马音');
  expectEq(r1.morphemes[0].containsKanji, true, '词1 含汉字');
  expectEq(r1.fullHiragana, 'にっぽんのぶんか', '全文平假名');
  expectEq(r1.isSingleKanji, false, '多字不触发单字模式');

  // 长音: reading 用假名拼写(规范), pronunciation 用 ー(发音)
  final tok = r1.morphemes[0];
  expectEq(tok.readingKatakana, 'ニッポン', '日本 reading');
  expectEq(tok.pronunciationKatakana, 'ニッポン', '日本 pronunciation');

  // 助词 は: 读音ハ(规范标注), 发音ワ(实际口语)
  final r2 = await a.analyze('私は学生です');
  final ha = r2.morphemes[1];
  expectEq(ha.surface, 'は', '助词は 原词');
  expectEq(ha.readingKatakana, 'ハ', '助词は 读音(ハ)');
  expectEq(ha.pronunciationKatakana, 'ワ', '助词は 发音(ワ)');
  // 标注轨用 reading: は / ha(规范假名拼写)
  expectEq(ha.hiragana, 'は', '助词は 规范平假名(は)');
  expectEq(ha.romaji, 'ha', '助词は 规范罗马音(ha)');
  // 发音轨用 pronunciation: わ / wa
  expectEq(ha.pronunciationHiragana, 'わ', '助词は 发音平假名(わ)');
  expectEq(ha.hasPronunciationShift, true, '标记发音差异');
  expectEq(ha.isParticleShift, true, '识别为助词音变');
  expectEq(r2.fullHiragana, 'わたしはがくせいです', '整句规范平假名');
  expectEq(r2.fullPronunciation, 'わたしわがくせいです', '整句发音平假名');
  expectEq(r2.fullRomaji, 'watashi ha gakusei desu', '整句罗马音');
  expectEq(r2.hasAnyPronunciationShift, true, '整句存在发音差异');

  // 东京: 规范拼写 とうきょう, 发音 とーきょー
  final r5 = await a.analyze('東京');
  expectEq(r5.morphemes[0].hiragana, 'とうきょう', '東京 规范平假名');
  expectEq(r5.morphemes[0].pronunciationHiragana, 'とーきょー', '東京 发音平假名');
  expectEq(r5.morphemes[0].hasPronunciationShift, true, '東京 有发音差异');
  expectEq(r5.morphemes[0].isParticleShift, false, '東京 非助词音变');

  final r3 = await a.analyze('東京に行きます');
  expectEq(r3.fullHiragana, 'とうきょうにいきます', '动词句平假名');
  expectEq(r3.morphemes[2].basicForm, '行く', '动词活用形提取原形');
  expectEq(r3.morphemes[2].isConjugated, true, '标记动词活用');

  final rMulti = await a.analyze('猫\n犬');
  expectEq(rMulti.paragraphs.length, 2, '多行输入正确拆分段落');
  expectEq(
    rMulti.toHtmlRuby,
    '<ruby>猫<rt>ねこ</rt></ruby>\n<ruby>犬<rt>いぬ</rt></ruby>',
    'HTML ruby 导出',
  );
  expectEq(rMulti.toBracketAnnotation, '猫(ねこ)\n犬(いぬ)', '括号注音导出');

  final r4 = await a.analyze('   ');
  expectEq(r4.isEmpty, true, '空输入返回空');

  print('--- 单汉字音训读 ---');
  final s1 = await a.analyze('日');
  expectEq(s1.isSingleKanji, true, '日 触发单字模式');
  expectEq(s1.singleKanji!.onyomi.join('/'), 'にち/じつ', '日 音读');
  expectEq(s1.singleKanji!.kunyomi.join('/'), 'ひ/(び)/(か)', '日 训读');
  expectEq(s1.singleKanji!.strokes, 4, '日 笔画');
  expectEq(s1.singleKanji!.grade, 1, '日 学年');

  final s2 = await a.analyze('学');
  expectEq(s2.singleKanji!.onyomi.join('/'), 'がく', '学 音读');
  expectEq(s2.singleKanji!.kunyomi.join('/'), 'まな(ぶ)', '学 训读');

  final s3 = await a.analyze('水');
  expectEq(s3.singleKanji!.onyomi.join('/'), 'すい', '水 音读');
  expectEq(s3.singleKanji!.kunyomi.contains('みず'), true, '水 训读含みず');

  // 非单汉字不应触发
  expectEq((await a.analyze('日本')).isSingleKanji, false, '日本 不触发');
  expectEq((await a.analyze('あ')).isSingleKanji, false, '假名 不触发');
  expectEq((await a.analyze('日a')).isSingleKanji, false, '汉字+字母 不触发');

  print('--- 筛选: 笔画范围 ---');
  final all = kanjiReadingDict.values;
  // 1. 双端闭合区间
  final s35 = const KanjiFilter(strokesMin: 3, strokesMax: 5).apply(all);
  expectEq(s35.isNotEmpty, true, '笔画 3~5 有结果 (${s35.length} 字)');
  expectEq(s35.every((r) => r.strokes >= 3 && r.strokes <= 5), true,
      '笔画 3~5 全部落在区间内');
  final inRange = all.where((r) => r.strokes >= 3 && r.strokes <= 5).length;
  expectEq(s35.length, inRange, '笔画 3~5 恰等于 3/4/5 画之和 ($inRange 字)');

  // 2. 只填下限 / 只填上限
  final sMin = const KanjiFilter(strokesMin: 25).apply(all);
  expectEq(sMin.every((r) => r.strokes >= 25), true, '只填下限: 全部 >= 25');
  final sMax = const KanjiFilter(strokesMax: 2).apply(all);
  expectEq(sMax.every((r) => r.strokes <= 2), true, '只填上限: 全部 <= 2');
  expectEq(sMin.length + sMax.length > 0, true, '单端限制能取到结果');

  // 3. 下限大于上限 -> 空
  expectEq(const KanjiFilter(strokesMin: 9, strokesMax: 3).apply(all).isEmpty,
      true, '下限>上限: 无结果');

  // 4. 清除后不再生效 (对应界面上删掉输入框里的数字)
  const dirty = KanjiFilter(strokesMin: 3, strokesMax: 5);
  final cleared = dirty.copyWith(clearStrokes: true);
  expectEq(cleared.strokesMin, null, 'clearStrokes 清掉下限');
  expectEq(cleared.strokesMax, null, 'clearStrokes 清掉上限');
  expectEq(cleared.isUnfiltered, true, '清掉后回到「不限」');

  print('--- 筛选: 使用频率范围 ---');
  // 5. 区间闭合
  final f100 = const KanjiFilter(frequencyMin: 1, frequencyMax: 100).apply(all);
  expectEq(f100.isNotEmpty, true, '频率 1~100 有结果 (${f100.length} 字)');
  expectEq(
      f100.every((r) => r.frequencyRank >= 1 && r.frequencyRank <= 100), true,
      '频率 1~100 全部落在区间内');

  // 6. 设了任一端就排除「无排名」的哨兵值
  final unranked = all.where((r) => r.frequencyRank >= kNoFrequencyRank);
  expectEq(unranked.isNotEmpty, true,
      '字典中存在无排名的字 (${unranked.length} 个, 哨兵 $kNoFrequencyRank)');
  final fMinOnly = const KanjiFilter(frequencyMin: 1).apply(all);
  expectEq(fMinOnly.every((r) => r.frequencyRank < kNoFrequencyRank), true,
      '只填下限也会排除无排名的字');
  final fMaxOnly = const KanjiFilter(frequencyMax: 10000).apply(all);
  expectEq(fMaxOnly.every((r) => r.frequencyRank < kNoFrequencyRank), true,
      '只填上限也会排除无排名的字');
  expectEq(fMaxOnly.length, all.length - unranked.length,
      '频率上限 10000 收全所有有排名的字');

  // 7. 未设频率条件时, 无排名的字仍照常出现
  expectEq(const KanjiFilter().apply(all).length, all.length,
      '不加条件时结果数 == 字典总数');

  print('--- 筛选: 其他维度与计数 ---');
  final g1 = const KanjiFilter(gradeMin: 1, gradeMax: 1).apply(all);
  expectEq(g1.every((r) => r.grade == 1), true, '学年 1 年: 全部 grade==1');
  expectEq(g1.isNotEmpty, true, '学年 1 年有结果');

  final on = const KanjiFilter(reading: ReadingRequirement.onyomiOnly).apply(all);
  expectEq(on.every((r) => r.hasOnyomi && !r.hasKunyomi), true, '仅音读');
  final kun =
      const KanjiFilter(reading: ReadingRequirement.kunyomiOnly).apply(all);
  expectEq(kun.every((r) => r.hasKunyomi && !r.hasOnyomi), true, '仅训读');
  final both = const KanjiFilter(reading: ReadingRequirement.both).apply(all);
  expectEq(both.every((r) => r.hasOnyomi && r.hasKunyomi), true, '音训兼备');

  expectEq(KanjiFilter.initial.isUnfiltered, true, '默认条件为「不限」');
  expectEq(KanjiFilter.initial.activeCount, 0, '默认条件生效数 == 0');
  expectEq(
      const KanjiFilter(
        strokesMin: 1,
        frequencyMax: 100,
        gradeMin: 1,
        gradeMax: 1,
        reading: ReadingRequirement.both,
        readingQuery: 'こう',
        meaningQuery: 'sun',
        radical: 72,
      ).activeCount,
      7,
      '七类条件各计一次');

  print('--- 筛选: 读音反查 ---');
  final rKou = const KanjiFilter(readingQuery: 'こう').apply(all);
  expectEq(rKou.isNotEmpty, true, '读音「こう」反查有结果 (${rKou.length} 字)');
  expectEq(rKou.any((r) => r.kanji == '校'), true, '读音「こう」包含「校」');
  final rMana = const KanjiFilter(readingQuery: 'まな').apply(all);
  expectEq(rMana.any((r) => r.kanji == '学'), true, '训读「まな(ぶ)」可由「まな」查到「学」');
  final rKata = const KanjiFilter(readingQuery: 'ガク').apply(all);
  expectEq(rKata.any((r) => r.kanji == '学'), true, '片假名「ガク」折叠反查包含「学」');
  final rCleared =
      const KanjiFilter(readingQuery: 'こう').copyWith(clearReadingQuery: true);
  expectEq(rCleared.readingQuery, '', 'clearReadingQuery 清空读音反查');
  expectEq(rCleared.isUnfiltered, true, '清空读音后回到不限');

  print('--- 筛选: 含义搜索 ---');
  final rSun = const KanjiFilter(meaningQuery: 'sun').apply(all);
  expectEq(rSun.isNotEmpty, true, '含义「sun」搜索有结果 (${rSun.length} 字)');
  expectEq(rSun.any((r) => r.kanji == '日'), true, '含义「sun」包含「日」');
  final rTaiyang = const KanjiFilter(meaningQuery: '太阳').apply(all);
  expectEq(rTaiyang.any((r) => r.kanji == '日'), true, '中文释义「太阳」包含「日」');
  final rMeaningCleared =
      const KanjiFilter(meaningQuery: 'sun').copyWith(clearMeaningQuery: true);
  expectEq(rMeaningCleared.meaningQuery, '', 'clearMeaningQuery 清空含义搜索');
  expectEq(rMeaningCleared.isUnfiltered, true, '清空含义后回到不限');

  print('--- 筛选: 部首筛选与展示 ---');
  expectEq(kanjiReadingDict['日']!.radical, 72, '日 部首为 72');
  expectEq(kanjiReadingDict['日']!.radicalChar, '日', '日 部首字形为 日');
  expectEq(kanjiReadingDict['木']!.radical, 75, '木 部首为 75');
  expectEq(kanjiReadingDict['木']!.radicalChar, '木', '木 部首字形为 木');
  expectEq(kanjiReadingDict['海']!.radical, 85, '海 部首为 85 (水)');
  expectEq(kanjiReadingDict['海']!.radicalChar, '水', '海 部首字形为 水');

  final rWater = const KanjiFilter(radical: 85).apply(all);
  expectEq(rWater.isNotEmpty, true, '部首 85 (水) 有结果 (${rWater.length} 字)');
  expectEq(rWater.every((r) => r.radical == 85), true, '部首 85 筛选全部满足');
  expectEq(rWater.any((r) => r.kanji == '海'), true, '部首 85 包含「海」');
  final rRadCleared =
      const KanjiFilter(radical: 85).copyWith(clearRadical: true);
  expectEq(rRadCleared.radical, null, 'clearRadical 清空部首');
  expectEq(rRadCleared.isUnfiltered, true, '清空部首后回到不限');

  // 排序: 笔画升序
  final sorted = const KanjiFilter(sort: KanjiSort.strokes).apply(all);
  var asc = true;
  for (var i = 1; i < sorted.length; i++) {
    if (sorted[i - 1].strokes > sorted[i].strokes) asc = false;
  }
  expectEq(asc, true, '按笔画排序为升序');

  print('--- 字典覆盖率 ---');
  expectEq(kanjiReadingDict.length > 2500, true,
      '字典收录 ${kanjiReadingDict.length} 字(>2500)');
  expectEq(kanjiReadingDict.containsKey('日'), true, '含 日');
  expectEq(kanjiReadingDict['日']!.hasOnyomi, true, '日 有音读');
  expectEq(kanjiReadingDict['日']!.hasKunyomi, true, '日 有训读');

  print('--- 释义 (中/英双份) ---');
  expectEq(kanjiReadingDict['日']!.meaningsEn.join('/'), 'day/sun/Japan',
      '日 英文释义');
  expectEq(kanjiReadingDict['日']!.meanings.contains('太阳'), true,
      '日 中文释义含 太阳');
  // 少数汉字在 KANJIDIC2 里本就没有 <meaning> (多为纯日本人名用字),
  // 因此断言「覆盖率足够高」且「中英两份缺失的是同一批字」——
  // 后者能保证不是生成时漏了英文那一列。
  final total = kanjiReadingDict.length;
  final missingEn =
      kanjiReadingDict.values.where((r) => r.meaningsEn.isEmpty).length;
  final missingZh =
      kanjiReadingDict.values.where((r) => r.meanings.isEmpty).length;
  expectEq(missingEn == missingZh, true,
      '中英释义缺失集合一致 (各缺 $missingEn 个)');
  expectEq(missingEn < total * 0.02, true,
      '释义覆盖率 >98% (缺失 $missingEn / $total)');
  expectEq(
      kanjiReadingDict.values
          .where((r) => r.meaningsEn.isEmpty && r.meanings.isNotEmpty)
          .isEmpty,
      true,
      '不存在「只有中文没有英文」的字');
  // 每条最多 3 个释义。
  final tooMany = kanjiReadingDict.values
      .where((r) => r.meaningsEn.length > 3 || r.meanings.length > 3)
      .length;
  expectEq(tooMany, 0, '释义条目均不超过 3 条');

  print('--- 词汇字典 (IPADIC) 结构与覆盖率 ---');
  expectEq(kanjiWordsDict.length > 2000, true,
      '词汇字典条目收录 ${kanjiWordsDict.length} 字(>2000)');
  expectEq(kanjiWordsDict.containsKey('日'), true, '含核心字 日');
  final nichiWords = kanjiWordsDict['日']!;
  expectEq(nichiWords.isNotEmpty, true, '日 包含常见词');
  expectEq(nichiWords.any((w) => w.word == '日本'), true, '日 包含词条 日本');

  // 抽查前 100 个词条的字段结构健全性
  var wordsValid = true;
  for (final entries in kanjiWordsDict.values.take(100)) {
    for (final w in entries) {
      if (w.word.isEmpty || w.hiragana.isEmpty || w.pos.isEmpty) {
        wordsValid = false;
        break;
      }
    }
  }
  expectEq(wordsValid, true, '词条表面形式、读音、词性均非空');

  // 常驻分词 isolate 会阻止裸 dart 进程在 main 返回后退出, 用完即关。
  JapaneseAnalyzer.instance.close();

  print('--- 版本与字典范围同步 ---');
  // 改版本号漏改 about 页常量时, 在这里变成显式失败而非上线后才发现。
  final pubspec = File('pubspec.yaml').readAsStringSync();
  final version = RegExp(
    r'^version:\s*(\d+\.\d+\.\d+)\+(\d+)\s*$',
    multiLine: true,
  ).firstMatch(pubspec);
  expectEq(version?.group(1), AppMeta.version,
      'pubspec version 与 AppMeta.version 一致');
  expectEq(version?.group(2), AppMeta.buildNumber,
      'pubspec versionCode 基数与 AppMeta.buildNumber 一致');
  // 字典范围由 core 实时统计, 此处固定当前期望: 字典换代导致范围
  // 变化时, 先确认筛选界面提示与预期一致再更新这里的数字。
  expectEq(kStrokeRange, (1, 29), '字典笔画范围 1~29');
  expectEq(kFrequencyRange, (1, 2501), '字典频率范围 1~2501');

  // 包名两处同步: about 页显示的包名是手工维护的显示常量, 与
  // build.gradle.kts 的 applicationId 不一致时, 要等发布校验
  // (aapt2 dump badging) 才会发现。
  final gradle =
      File('android/app/build.gradle.kts').readAsStringSync();
  final applicationId = RegExp(r'applicationId\s*=\s*"([^"]+)"')
      .firstMatch(gradle)
      ?.group(1);
  final about =
      File('lib/widgets/about_page.dart').readAsStringSync();
  final aboutPackage = RegExp(r"s.packageLabel,\s*'([^']+)'")
      .firstMatch(about)
      ?.group(1);
  expectEq(aboutPackage, applicationId, 'about 页包名与 applicationId 一致');

  print('\n结果: $_pass 通过, $_fail 失败');
  if (_fail > 0) throw StateError('有 $_fail 项未通过');
}
