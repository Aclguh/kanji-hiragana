import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/kana_romaji.dart';

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
}
