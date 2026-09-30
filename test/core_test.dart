import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/kana_romaji.dart';
import 'package:kanji_hiragana/core/kanji_filter.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';
import 'package:kanji_hiragana/core/kanji_words_dict.dart';
import 'package:kanji_hiragana/core/morpheme.dart';
import 'package:kanji_hiragana/core/query_store.dart';
import 'package:kanji_hiragana/core/settings.dart';
import 'package:kanji_hiragana/core/strings.dart';
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

    test('外来语拗音', () {
      expect(hiraganaToRomaji('ふぁいと'), 'faito');
      expect(hiraganaToRomaji('てぃー'), 'tii');
      expect(hiraganaToRomaji('ゔぇーる'), 'veeru');
      expect(hiraganaToRomaji('うぃんど'), 'windo');
      expect(hiraganaToRomaji('ちぇっく'), 'chekku');
    });

    test('促音与拨音边界情况', () {
      // 尾部促音不应越界
      expect(hiraganaToRomaji('あっ'), 'a');
      // 单独与连续拨音
      expect(hiraganaToRomaji('ん'), 'n');
      expect(hiraganaToRomaji('んん'), 'nn');
      // 尾部长音
      expect(hiraganaToRomaji('あー'), 'aa');
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

  group('汉字筛选 (KanjiFilter)', () {
    const k1 = KanjiReading(
      kanji: '一',
      onyomi: ['いち'],
      kunyomi: ['ひと'],
      meanings: ['一'],
      meaningsEn: ['one'],
      grade: 1,
      strokes: 1,
      frequencyRank: 2,
    );
    const k2 = KanjiReading(
      kanji: '音',
      onyomi: ['おん'],
      kunyomi: [],
      meanings: ['声音'],
      meaningsEn: ['sound'],
      grade: 1,
      strokes: 9,
      frequencyRank: 50,
    );
    const k3 = KanjiReading(
      kanji: '訓',
      onyomi: [],
      kunyomi: ['よむ'],
      meanings: ['训'],
      meaningsEn: ['teach'],
      grade: 4,
      strokes: 10,
      frequencyRank: 800,
    );
    const kUnranked = KanjiReading(
      kanji: '佚',
      onyomi: ['いつ'],
      kunyomi: ['うしなう'],
      meanings: ['隐逸'],
      meaningsEn: ['lost'],
      grade: 9,
      strokes: 7,
      frequencyRank: kNoFrequencyRank,
    );
    final samples = [k1, k2, k3, kUnranked];

    test('默认条件判定全部通过且计数为 0', () {
      const f = KanjiFilter.initial;
      expect(f.isUnfiltered, isTrue);
      expect(f.activeCount, 0);
      expect(samples.every(f.matches), isTrue);
    });

    test('学年区间筛选', () {
      const fGrade1 = KanjiFilter(gradeMin: 1, gradeMax: 1);
      expect(fGrade1.matches(k1), isTrue);
      expect(fGrade1.matches(k2), isTrue);
      expect(fGrade1.matches(k3), isFalse);
      expect(fGrade1.matches(kUnranked), isFalse);

      const fName = KanjiFilter(gradeMin: 9, gradeMax: 10);
      expect(fName.matches(kUnranked), isTrue);
      expect(fName.matches(k1), isFalse);
    });

    test('笔画区间筛选', () {
      const fStrokes = KanjiFilter(strokesMin: 7, strokesMax: 9);
      expect(fStrokes.matches(k1), isFalse);
      expect(fStrokes.matches(k2), isTrue);
      expect(fStrokes.matches(k3), isFalse);
      expect(fStrokes.matches(kUnranked), isTrue);
    });

    test('频率区间筛选排斥无排名哨兵值', () {
      const fFreq = KanjiFilter(frequencyMin: 1, frequencyMax: 100);
      expect(fFreq.matches(k1), isTrue);
      expect(fFreq.matches(k2), isTrue);
      expect(fFreq.matches(k3), isFalse);
      expect(fFreq.matches(kUnranked), isFalse);

      // 只设一端也要排除无排名
      const fFreqOnlyMin = KanjiFilter(frequencyMin: 10);
      expect(fFreqOnlyMin.matches(kUnranked), isFalse);
    });

    test('读音要求筛选', () {
      const fOnyomi = KanjiFilter(reading: ReadingRequirement.onyomiOnly);
      expect(fOnyomi.matches(k2), isTrue);
      expect(fOnyomi.matches(k1), isFalse);
      expect(fOnyomi.matches(k3), isFalse);

      const fKunyomi = KanjiFilter(reading: ReadingRequirement.kunyomiOnly);
      expect(fKunyomi.matches(k3), isTrue);
      expect(fKunyomi.matches(k2), isFalse);

      const fBoth = KanjiFilter(reading: ReadingRequirement.both);
      expect(fBoth.matches(k1), isTrue);
      expect(fBoth.matches(kUnranked), isTrue);
      expect(fBoth.matches(k2), isFalse);
      expect(fBoth.matches(k3), isFalse);
    });

    test('copyWith 清空语义', () {
      const f = KanjiFilter(
        gradeMin: 1,
        gradeMax: 2,
        strokesMin: 3,
        strokesMax: 5,
        frequencyMin: 1,
        frequencyMax: 100,
      );
      final c1 = f.copyWith(clearGrade: true);
      expect(c1.gradeMin, isNull);
      expect(c1.gradeMax, isNull);
      expect(c1.strokesMin, 3);

      final c2 = f.copyWith(clearStrokes: true);
      expect(c2.strokesMin, isNull);
      expect(c2.strokesMax, isNull);

      final c3 = f.copyWith(clearFrequency: true);
      expect(c3.frequencyMin, isNull);
      expect(c3.frequencyMax, isNull);
    });

    test('排序方式与次级排序', () {
      // 笔画排序: strokes 从小到大, 笔画相同按频率 rank 升序
      const fStrokes = KanjiFilter(sort: KanjiSort.strokes);
      final sortedStrokes = fStrokes.apply([k2, k3, k1]);
      expect(sortedStrokes.map((r) => r.kanji), ['一', '音', '訓']);

      // 读音数排序: 读音多排在前
      const fReadingCount = KanjiFilter(sort: KanjiSort.readingCount);
      final sortedReadings = fReadingCount.apply([k2, k1, k3]);
      expect(sortedReadings.first.kanji, '一'); // 2 个读音优先于 1 个读音
    });
  });

  group('分词与形态素 (Morpheme)', () {
    test('reading 与 pronunciation 独立回退链', () {
      // reading 与 pronunciation 缺失(*)时回落到原词
      final tokenFallback = {
        'surface_form': 'テスト',
        'pos': '名詞',
        'reading': '*',
        'pronunciation': '*',
      };
      final m = Morpheme.fromToken(tokenFallback);
      expect(m.surface, 'テスト');
      expect(m.hiragana, 'てすと');
      expect(m.romaji, 'tesuto');
      expect(m.needsAnnotation, isTrue);
      expect(m.hasPronunciationShift, isFalse);
    });

    test('助词音变与长音发音差异判断', () {
      final tokenWa = {
        'surface_form': 'は',
        'pos': '助詞',
        'reading': 'ハ',
        'pronunciation': 'ワ',
      };
      final mWa = Morpheme.fromToken(tokenWa);
      expect(mWa.hasPronunciationShift, isTrue);
      expect(mWa.isParticleShift, isTrue);

      final tokenTokyo = {
        'surface_form': '東京',
        'pos': '名詞',
        'reading': 'トウキョウ',
        'pronunciation': 'トーキョー',
      };
      final mTokyo = Morpheme.fromToken(tokenTokyo);
      expect(mTokyo.hasPronunciationShift, isTrue);
      expect(mTokyo.isParticleShift, isFalse);
    });

    test('提取词性细分分类', () {
      final tokenProper = {
        'surface_form': '東京',
        'pos': '名詞',
        'pos_detail_1': '固有名詞',
        'reading': 'トウキョウ',
        'pronunciation': 'トーキョー',
      };
      final mProper = Morpheme.fromToken(tokenProper);
      expect(mProper.partOfSpeech, '名詞');
      expect(mProper.partOfSpeechDetail, '固有名詞');

      final tokenNoDetail = {
        'surface_form': 'ます',
        'pos': '助動詞',
        'pos_detail_1': '*',
        'reading': 'マス',
        'pronunciation': 'マス',
      };
      final mNoDetail = Morpheme.fromToken(tokenNoDetail);
      expect(mNoDetail.partOfSpeech, '助動詞');
      expect(mNoDetail.partOfSpeechDetail, isEmpty);
    });
  });

  group('应用设置 (SettingsController)', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await SettingsController.instance.load();
    });

    tearDown(() async {
      final s = SettingsController.instance;
      await s.setThemeMode(AppThemeMode.system);
      await s.setAutoRotate(false);
      await s.setLanguage(AppLanguage.zh);
      await s.setShowRomaji(true);
      await s.setViewModeName('alignment');
    });

    test('默认设置取值', () {
      final s = SettingsController.instance;
      expect(s.themeMode, AppThemeMode.system);
      expect(s.autoRotate, isFalse);
      expect(s.language, AppLanguage.zh);
      expect(s.showRomaji, isTrue);
      expect(s.viewModeName, 'alignment');
    });

    test('设置变更与持久化往返', () async {
      final s = SettingsController.instance;
      await s.setThemeMode(AppThemeMode.dark);
      await s.setAutoRotate(true);
      await s.setLanguage(AppLanguage.en);
      await s.setShowRomaji(false);
      await s.setViewModeName('furigana');

      expect(s.themeMode, AppThemeMode.dark);
      expect(s.autoRotate, isTrue);
      expect(s.language, AppLanguage.en);
      expect(s.showRomaji, isFalse);
      expect(s.viewModeName, 'furigana');

      // 重新 load 验证持久化
      await s.load();
      expect(s.themeMode, AppThemeMode.dark);
      expect(s.autoRotate, isTrue);
      expect(s.language, AppLanguage.en);
      expect(s.showRomaji, isFalse);
      expect(s.viewModeName, 'furigana');
      expect(s.loadError, isNull);
    });

    test('加载成功时 loadError 为 null', () {
      final s = SettingsController.instance;
      expect(s.loadError, isNull);
    });
  });
}
