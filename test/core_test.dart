import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/kana_romaji.dart';
import 'package:kanji_hiragana/core/kanji_words_dict.dart';
import 'package:kanji_hiragana/core/query_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('假名 ↔ 罗马音', () {
    test('片假名转平假名', () {
      expect(katakanaToHiragana('ニッポン'), 'にっぽん');
      expect(katakanaToHiragana('カタカナ'), 'かたかな');
      // 长音符号与 ASCII 应原样保留
      expect(katakanaToHiragana('コーヒー'), 'こーひー');
      expect(katakanaToHiragana('ABC'), 'ABC');
    });

    test('平假名转片假名', () {
      expect(hiraganaToKatakana('にっぽん'), 'ニッポン');
    });

    test('基本罗马音', () {
      expect(hiraganaToRomaji('わたし'), 'watashi');
      expect(hiraganaToRomaji('がくせい'), 'gakusei');
      expect(hiraganaToRomaji('ふじさん'), 'fujisan');
    });

    test('拗音', () {
      expect(hiraganaToRomaji('しゃしん'), 'shashin');
      expect(hiraganaToRomaji('きょう'), 'kyou');
      expect(hiraganaToRomaji('りゅう'), 'ryuu');
      expect(hiraganaToRomaji('ちょこれーと'), 'chokoreeto');
    });

    test('促音(っ)', () {
      expect(hiraganaToRomaji('がっこう'), 'gakkou');
      expect(hiraganaToRomaji('まっちゃ'), 'matcha');
      expect(hiraganaToRomaji('にっぽん'), 'nippon');
    });

    test('拨音(ん)', () {
      expect(hiraganaToRomaji('しんぶん'), 'shinbun');
      // 后接元音时加撇号避免歧义
      expect(hiraganaToRomaji('しんいち'), "shin'ichi");
    });

    test('长音符号(ー)延展前一元音', () {
      expect(hiraganaToRomaji('こーひー'), 'koohii');
      expect(hiraganaToRomaji('らーめん'), 'raamen');
    });

    test('片假名直接转罗马音', () {
      expect(katakanaToRomaji('ニッポンノブンカ'), 'nipponnobunka');
    });
  });

  group('字符类型判断', () {
    test('汉字', () {
      expect(isKanji('日'), isTrue);
      expect(isKanji('漢'), isTrue);
      expect(isKanji('あ'), isFalse);
      expect(isKanji('A'), isFalse);
    });

    test('平假名 / 片假名', () {
      expect(isHiragana('あ'), isTrue);
      expect(isHiragana('ア'), isFalse);
      expect(isKatakana('ア'), isTrue);
      expect(isKatakana('ー'), isTrue);
      expect(isKatakana('あ'), isFalse);
    });
  });

  group('形态素分析', () {
    final analyzer = JapaneseAnalyzer.instance;

    test('逐词给出汉字 / 平假名 / 罗马音', () async {
      final r = await analyzer.analyze('日本の文化');

      expect(r.morphemes.length, 3);
      expect(r.morphemes[0].surface, '日本');
      expect(r.morphemes[0].hiragana, 'にっぽん');
      expect(r.morphemes[0].romaji, 'nippon');
      expect(r.morphemes[0].containsKanji, isTrue);

      expect(r.morphemes[1].surface, 'の');
      expect(r.morphemes[1].hiragana, 'の');
      expect(r.morphemes[1].containsKanji, isFalse);

      expect(r.fullHiragana, 'にっぽんのぶんか');
      expect(r.fullRomaji, 'nippon no bunka');
    });

    test('动词按活用形给出读音', () async {
      final r = await analyzer.analyze('東京に行きます');
      expect(r.fullHiragana, 'とうきょうにいきます');
      expect(r.morphemes[2].surface, '行き');
      expect(r.morphemes[2].hiragana, 'いき');
      expect(r.morphemes[2].romaji, 'iki');
    });

    test('空输入返回空结果', () async {
      final r = await analyzer.analyze('   ');
      expect(r.isEmpty, isTrue);
    });
  });

  group('查询历史与收藏 (QueryStore)', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await QueryStore.instance.load();
      QueryStore.instance.clearHistory();
      // 逐条移除收藏, 复位单例状态。
      for (final f in QueryStore.instance.favorites.toList()) {
        QueryStore.instance.toggleFavorite(f);
      }
    });

    test('记录查询并去重置顶', () {
      final store = QueryStore.instance;
      store.recordQuery('日本');
      store.recordQuery('文化');
      store.recordQuery('日本');
      expect(store.history, ['日本', '文化']);
    });

    test('延续输入折叠为一条', () {
      final store = QueryStore.instance;
      store.recordQuery('私', previous: '');
      store.recordQuery('私は', previous: '私');
      store.recordQuery('私は学生', previous: '私は');
      expect(store.history, ['私は学生']);
    });

    test('清空后的新输入不再并入上一条', () {
      final store = QueryStore.instance;
      store.recordQuery('日');
      store.clearHistory();
      store.recordQuery('日本', previous: '日');
      expect(store.history, ['日本']);
    });

    test('历史上限 20 条, 旧的先淘汰', () {
      final store = QueryStore.instance;
      for (var i = 0; i < 25; i++) {
        store.recordQuery('查询$i');
      }
      expect(store.history.length, QueryStore.maxHistory);
      expect(store.history.first, '查询24');
      expect(store.history.contains('查询0'), isFalse);
    });

    test('收藏切换与往返持久化', () async {
      final store = QueryStore.instance;
      expect(store.isFavorite('東京'), isFalse);
      expect(store.toggleFavorite('東京'), isTrue);
      expect(store.isFavorite('東京'), isTrue);
      expect(store.toggleFavorite('東京'), isFalse);
      expect(store.isFavorite('東京'), isFalse);

      // 重新 load 后仍能读到已收藏的值 (写入 mock preferences)。
      store.toggleFavorite('京都');
      SharedPreferences.setMockInitialValues({
        'query.favorites': ['京都'],
      });
      await store.load();
      expect(store.isFavorite('京都'), isTrue);
    });

    test('常见词表包含基础数据', () {
      final wordsOfJapan = kanjiWordsDict['日']!
          .map((w) => w.word)
          .toList();
      expect(wordsOfJapan, contains('日本'));
      final school = kanjiWordsDict['学']!
          .map((w) => w.word)
          .toList();
      expect(school, contains('学校'));
      // 读音为规范平假名。
      expect(kanjiWordsDict['日']!.first.hiragana, isNot(contains('ッ')));
    });
  });
}
