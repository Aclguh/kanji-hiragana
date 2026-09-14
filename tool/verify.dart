// 独立验证脚本: 不依赖 flutter_test, 直接用 dart 运行。
// 用法: dart run tool/verify.dart
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/kana_romaji.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';

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

  print('--- 字典覆盖率 ---');
  expectEq(kanjiReadingDict.length > 2500, true,
      '字典收录 ${kanjiReadingDict.length} 字(>2500)');
  expectEq(kanjiReadingDict.containsKey('日'), true, '含 日');
  expectEq(kanjiReadingDict['日']!.hasOnyomi, true, '日 有音读');
  expectEq(kanjiReadingDict['日']!.hasKunyomi, true, '日 有训读');

  print('\n结果: $_pass 通过, $_fail 失败');
  if (_fail > 0) throw StateError('有 $_fail 项未通过');
}
