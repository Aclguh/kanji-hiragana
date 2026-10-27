import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/analyzer_failure.dart';
import 'package:kanji_hiragana/core/diagnostics.dart';
import 'package:kanji_hiragana/core/input_sanitizer.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/kana_romaji.dart';
import 'package:kanji_hiragana/core/kanji_converter.dart';
import 'package:kanji_hiragana/core/kanji_filter.dart';
import 'package:kanji_hiragana/core/kanji_homophones.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';
import 'package:kanji_hiragana/core/kanji_services.dart';
import 'package:kanji_hiragana/core/kanji_words_dict.dart';
import 'package:kanji_hiragana/core/kuromoji_engine.dart';
import 'package:kanji_hiragana/core/loanwords_dict.dart';
import 'package:kanji_hiragana/core/morpheme.dart';
import 'package:kanji_hiragana/core/platform_service.dart';
import 'package:kanji_hiragana/core/query_store.dart';
import 'package:kanji_hiragana/core/radical_dict.dart';
import 'package:kanji_hiragana/core/settings.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/core/tts_service.dart';
import 'package:kanji_hiragana/core/yojijukugo_dict.dart';
import 'package:kanji_hiragana/widgets/home/home_coordinator.dart';
import 'package:kanji_hiragana/widgets/home/home_toolbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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
      expect(hiraganaToRomaji('あっっ'), 'a');
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
      // 扩展区汉字: Ext-A, Ext-B, Ext-G, Ext-H, Ext-I
      expect(isKanji(String.fromCharCode(0x3400)), isTrue); // Ext-A
      expect(isKanji(String.fromCharCode(0x20000)), isTrue); // Ext-B
      expect(isKanji(String.fromCharCode(0x30000)), isTrue); // Ext-G
      expect(isKanji(String.fromCharCode(0x31350)), isTrue); // Ext-H
      expect(isKanji(String.fromCharCode(0x2EBF0)), isTrue); // Ext-I
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

    test('动词按活用形给出读音并提取原形', () async {
      final r = await analyzer.analyze('東京に行きます');
      expect(r.fullHiragana, 'とうきょうにいきます');
      expect(r.morphemes[2].surface, '行き');
      expect(r.morphemes[2].hiragana, 'いき');
      expect(r.morphemes[2].romaji, 'iki');
      expect(r.morphemes[2].basicForm, '行く');
      expect(r.morphemes[2].isConjugated, isTrue);

      final rTabe = await analyzer.analyze('食べました');
      expect(rTabe.morphemes[0].surface, '食べ');
      expect(rTabe.morphemes[0].basicForm, '食べる');
      expect(rTabe.morphemes[0].isConjugated, isTrue);
    });

    test('空输入返回空结果', () async {
      final r = await analyzer.analyze('   ');
      expect(r.isEmpty, isTrue);
    });

    test('isCancelled 为 true 时提前中止并返回空结果', () async {
      final r = await analyzer.analyze('日本の文化', isCancelled: () => true);
      expect(r.morphemes, isEmpty);
    });

    test('并发调用 analyze() 各自正确解析互不串扰', () async {
      final inputs = ['桜', '富士山', '日本語', '勉強', 'ありがとう'];
      final futures = inputs.map((text) => analyzer.analyze(text)).toList();
      final results = await Future.wait(futures);

      for (var i = 0; i < inputs.length; i++) {
        expect(results[i].source, inputs[i]);
        expect(results[i].morphemes.isNotEmpty, isTrue);
      }
    });

    test('close() 终止 isolate 后再次调用能自愈重建', () async {
      final r1 = await analyzer.analyze('猫');
      expect(r1.fullHiragana, 'ねこ');

      analyzer.close();
      expect(analyzer.isReady, isFalse);

      // close 之后调用 analyze 应当自动触发 warmUp 重建并成功返回
      final r2 = await analyzer.analyze('犬');
      expect(r2.fullHiragana, 'いぬ');
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

    test('load() 读到超出上限的历史记录时自动截断并持久化', () async {
      final overflown = List.generate(30, (i) => '超长查询$i');
      SharedPreferences.setMockInitialValues({
        'query.history': overflown,
      });
      final store = QueryStore.instance;
      await store.load();
      expect(store.history.length, QueryStore.maxHistory);
      expect(store.history.first, '超长查询0');
      expect(store.history.last, '超长查询19');

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getStringList('query.history')?.length, QueryStore.maxHistory);
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

    test('历史记录往返持久化', () async {
      final store = QueryStore.instance;
      store.recordQuery('大阪');
      SharedPreferences.setMockInitialValues({
        'query.history': ['大阪'],
      });
      await store.load();
      expect(store.history, contains('大阪'));
    });

    test('flush 等待最近写入完成且无保存错误', () async {
      final store = QueryStore.instance;
      store.recordQuery('落盘检查');
      await store.flush();
      expect(store.saveError, isNull);
    });

    // 直接以字面键名断言 mock preferences 的落盘内容 (而非注入后再读回):
    // setter 写错键名时, 「注入 → load」式往返测试依然全绿, 数据实际丢失。
    test('收藏写入真实持久化键 query.favorites', () async {
      final store = QueryStore.instance;
      final prefs = await SharedPreferences.getInstance();

      store.toggleFavorite('東京');
      store.toggleFavorite('京都');
      expect(prefs.getStringList('query.favorites'), ['京都', '東京']);

      // 取消收藏同样落盘。
      store.toggleFavorite('京都');
      expect(prefs.getStringList('query.favorites'), ['東京']);
    });

    test('历史写入真实持久化键 query.history', () async {
      final store = QueryStore.instance;
      final prefs = await SharedPreferences.getInstance();

      store.recordQuery('大阪');
      store.recordQuery('京都');
      expect(prefs.getStringList('query.history'), ['京都', '大阪']);
    });

    test('本地数据损坏时以空数据继续并记录 loadError', () async {
      // getStringList 对非列表值做类型转换, 会抛 TypeError ——
      // 模拟持久化数据被外部工具写坏的真实场景。
      SharedPreferences.setMockInitialValues({
        'query.history': 'corrupted',
      });
      await QueryStore.instance.load();

      final store = QueryStore.instance;
      expect(store.loadError, isNotNull);
      expect(store.history, isEmpty);
      expect(store.favorites, isEmpty);

      // 降级后功能照常, 内存态可用。
      store.recordQuery('测试');
      expect(store.history, ['测试']);
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
      // 包含词性分类。
      expect(kanjiWordsDict['日']!.first.pos, '名詞');
      expect(kanjiWordsDict['学']!.any((w) => w.pos == '動詞'), isTrue);
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
      radical: 1,
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
      radical: 180,
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
      radical: 149,
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
      radical: 9,
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

      final c4 = f.copyWith(clearReadingQuery: true);
      expect(c4.readingQuery, isEmpty);
      expect(c4.gradeMin, 1);
    });

    test('按读音反查筛选', () {
      const kGaku = KanjiReading(
        kanji: '学',
        onyomi: ['がく'],
        kunyomi: ['まな(ぶ)'],
        meanings: ['学'],
        meaningsEn: ['learn'],
        grade: 1,
        strokes: 8,
        frequencyRank: 50,
      );

      // 音读匹配
      const fOn = KanjiFilter(readingQuery: 'いち');
      expect(fOn.matches(k1), isTrue);
      expect(fOn.matches(k2), isFalse);

      // 训读匹配
      const fKun = KanjiFilter(readingQuery: 'よむ');
      expect(fKun.matches(k3), isTrue);
      expect(fKun.matches(k1), isFalse);

      // 训读送假名括号剥离比对 (「まな」匹配「まな(ぶ)」)
      const fOkurigana = KanjiFilter(readingQuery: 'まな');
      expect(fOkurigana.matches(kGaku), isTrue);

      // 片假名输入自动折叠为平假名
      const fKatakana = KanjiFilter(readingQuery: 'ガク');
      expect(fKatakana.matches(kGaku), isTrue);

      // 子串匹配
      const fSub = KanjiFilter(readingQuery: 'な');
      expect(fSub.matches(kGaku), isTrue);

      // 未命中
      const fMiss = KanjiFilter(readingQuery: 'みず');
      expect(fMiss.matches(kGaku), isFalse);

      // 生效条件计数
      expect(fOn.activeCount, 1);
      expect(fOn.isUnfiltered, isFalse);
    });

    test('按含义搜索筛选', () {
      // 中文释义匹配
      const fOneZh = KanjiFilter(meaningQuery: '一');
      expect(fOneZh.matches(k1), isTrue);
      expect(fOneZh.matches(k2), isFalse);

      // 英文释义匹配 (不区分大小写)
      const fOneEn = KanjiFilter(meaningQuery: 'ONE');
      expect(fOneEn.matches(k1), isTrue);
      expect(fOneEn.matches(k2), isFalse);

      // 未命中
      const fMiss = KanjiFilter(meaningQuery: 'galaxy');
      expect(fMiss.matches(k1), isFalse);

      // copyWith 清空
      final cleared = fOneEn.copyWith(clearMeaningQuery: true);
      expect(cleared.meaningQuery, isEmpty);
      expect(cleared.isUnfiltered, isTrue);

      // 生效条件计数
      expect(fOneEn.activeCount, 1);
    });

    test('按部首筛选', () {
      const fRadical1 = KanjiFilter(radical: 1);
      expect(fRadical1.matches(k1), isTrue);
      expect(fRadical1.matches(k2), isFalse);

      // copyWith 清空
      final cleared = fRadical1.copyWith(clearRadical: true);
      expect(cleared.radical, isNull);
      expect(cleared.isUnfiltered, isTrue);

      // 生效条件计数
      expect(fRadical1.activeCount, 1);
    });

    test('反转区间与边界无匹配', () {
      // 笔画反转
      const fInvertedStrokes = KanjiFilter(strokesMin: 10, strokesMax: 5);
      expect(samples.any(fInvertedStrokes.matches), isFalse);

      // 学年反转
      const fInvertedGrade = KanjiFilter(gradeMin: 5, gradeMax: 2);
      expect(samples.any(fInvertedGrade.matches), isFalse);

      // 频率反转
      const fInvertedFreq = KanjiFilter(frequencyMin: 500, frequencyMax: 100);
      expect(samples.any(fInvertedFreq.matches), isFalse);
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

    test('全量预排列表与无参 apply()', () {
      for (final s in KanjiSort.values) {
        final list = KanjiFilter.allSorted(s);
        expect(list.length, kanjiReadingDict.length);
        // 验证列表不可变
        expect(() => list.clear(), throwsUnsupportedError);
      }

      // 无参调用 apply() 自动使用全量字典
      const f = KanjiFilter(strokesMin: 3, strokesMax: 4);
      final withDefault = f.apply();
      final withExplicit = f.apply(kanjiReadingDict.values);
      expect(withDefault.length, withExplicit.length);
      expect(
        withDefault.map((r) => r.kanji).toList(),
        withExplicit.map((r) => r.kanji).toList(),
      );
    });

    test('与字典等长但内容不同的列表不得被误判为全量', () {
      // 构造「长度与字典相同且首元素 identical」的自定义列表:
      // 第二个元素替换为字典里不存在的假字 (频率排名 1, 落在筛选区间内)。
      // 若 apply 误判为全量并走预排列表分支, 结果里不会出现该假字。
      const fake = KanjiReading(
        kanji: '†',
        onyomi: [],
        kunyomi: [],
        meanings: [],
        meaningsEn: [],
        grade: 1,
        strokes: 1,
        frequencyRank: 1,
      );
      final mutated = kanjiReadingDict.values.toList();
      mutated[1] = fake;

      const f = KanjiFilter(frequencyMin: 1, frequencyMax: 100);
      final result = f.apply(mutated);

      // 结果必须按传入列表筛选 (含假字), 而不是全量字典的筛选结果。
      expect(result, contains(fake));
      expect(result.length, mutated.where(f.matches).length);
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

    test('动词与形容词活用形原形识别', () {
      final tokenTabeta = {
        'surface_form': '食べた',
        'basic_form': '食べる',
        'pos': '動詞',
      };
      final mTabeta = Morpheme.fromToken(tokenTabeta);
      expect(mTabeta.basicForm, '食べる');
      expect(mTabeta.isConjugated, isTrue);

      final tokenTaberu = {
        'surface_form': '食べる',
        'basic_form': '食べる',
        'pos': '動詞',
      };
      final mTaberu = Morpheme.fromToken(tokenTaberu);
      expect(mTaberu.basicForm, '食べる');
      expect(mTaberu.isConjugated, isFalse);
    });

    test('注音文本导出与段落划分', () {
      final m1 = Morpheme.fromToken({
        'surface_form': '私',
        'reading': 'ワタシ',
        'pos': '名詞',
      });
      final m2 = Morpheme.fromToken({
        'surface_form': 'は',
        'reading': 'ハ',
        'pos': '助詞',
      });
      final m3 = Morpheme.fromToken({
        'surface_form': '猫',
        'reading': 'ネコ',
        'pos': '名詞',
      });

      final res = AnalysisResult(
        source: '私は\n猫',
        morphemes: [m1, m2, m3],
        paragraphs: [
          [m1, m2],
          [m3],
        ],
      );

      expect(res.paragraphs.length, 2);
      expect(res.paragraphs[0].length, 2);
      expect(res.paragraphs[1].length, 1);

      expect(
        res.toHtmlRuby,
        '<ruby>私<rt>わたし</rt></ruby>は\n<ruby>猫<rt>ねこ</rt></ruby>',
      );
      expect(res.toBracketAnnotation, '私(わたし)は\n猫(ねこ)');
    });

    test('HTML Ruby 转义文本中的标签与 & 字符', () {
      final dangerous = Morpheme.fromToken({
        'surface_form': '漢<script>&',
        'reading': 'カン<script>&',
        'pos': '名詞',
      });
      final res = AnalysisResult(
        source: '漢<script>&',
        morphemes: [dangerous],
      );

      final html = res.toHtmlRuby;
      expect(html, contains('&lt;script&gt;'));
      expect(html, contains('&amp;'));
      expect(html, isNot(contains('<script>')));
      expect(html, startsWith('<ruby>'));
      expect(html, endsWith('</ruby>'));
    });

    test('空 token 与缺省字段安全回退', () {
      final mEmpty = Morpheme.fromToken({});
      expect(mEmpty.surface, isEmpty);
      expect(mEmpty.hiragana, isEmpty);
      expect(mEmpty.romaji, isEmpty);
      expect(mEmpty.partOfSpeech, isEmpty);
      expect(mEmpty.partOfSpeechDetail, isEmpty);
      expect(mEmpty.basicForm, isEmpty);
      expect(mEmpty.isConjugated, isFalse);
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

    // 字面键名直接断言落盘值, 补齐「写 → 落盘」半程:
    // 往返测试 (注入 → load) 无法发现 setter 写错键名。
    test('设置写入真实持久化键', () async {
      final s = SettingsController.instance;
      final prefs = await SharedPreferences.getInstance();

      await s.setThemeMode(AppThemeMode.dark);
      await s.setAutoRotate(true);
      await s.setLanguage(AppLanguage.en);
      await s.setShowRomaji(false);
      await s.setViewModeName('furigana');

      expect(prefs.getString('settings.theme_mode'), 'dark');
      expect(prefs.getBool('settings.auto_rotate'), isTrue);
      expect(prefs.getString('settings.language'), 'en');
      expect(prefs.getBool('settings.show_romaji'), isFalse);
      expect(prefs.getString('settings.view_mode'), 'furigana');
    });

    test('加载成功时 loadError 为 null', () {
      final s = SettingsController.instance;
      expect(s.loadError, isNull);
    });

    test('并发写入队列与 flush 保证按序落盘', () async {
      final s = SettingsController.instance;
      // 连续发起多个设置变更 (不逐个 await)
      final future1 = s.setThemeMode(AppThemeMode.dark);
      final future2 = s.setAutoRotate(true);
      final future3 = s.setLanguage(AppLanguage.en);
      final future4 = s.setShowRomaji(false);

      await Future.wait([future1, future2, future3, future4]);
      await s.flush();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('settings.theme_mode'), 'dark');
      expect(prefs.getBool('settings.auto_rotate'), isTrue);
      expect(prefs.getString('settings.language'), 'en');
      expect(prefs.getBool('settings.show_romaji'), isFalse);
      expect(s.saveError, isNull);
    });
  });

  group('查询存储与收藏 (QueryStore)', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await QueryStore.instance.load();
      QueryStore.instance.clearHistory();
      for (final f in QueryStore.instance.favorites.toList()) {
        QueryStore.instance.toggleFavorite(f);
      }
    });

    test('记录查询与去重置顶', () {
      final q = QueryStore.instance;
      q.recordQuery('日本語');
      q.recordQuery('東京');
      expect(q.history, ['東京', '日本語']);

      q.recordQuery('日本語');
      expect(q.history, ['日本語', '東京']);
    });

    test('连续输入前缀折叠', () {
      final q = QueryStore.instance;
      q.recordQuery('日');
      q.recordQuery('日本', previous: '日');
      q.recordQuery('日本語', previous: '日本');
      expect(q.history, ['日本語']);
    });

    test('历史记录上限保护 (maxHistory)', () {
      final q = QueryStore.instance;
      for (var i = 0; i < 30; i++) {
        q.recordQuery('word_$i');
      }
      expect(q.history.length, QueryStore.maxHistory);
      expect(q.history.first, 'word_29');
    });

    test('收藏切换与容量上限保护 (maxFavorites)', () {
      final q = QueryStore.instance;
      expect(q.isFavorite('桜'), isFalse);

      final added = q.toggleFavorite('桜');
      expect(added, isTrue);
      expect(q.isFavorite('桜'), isTrue);
      expect(q.favorites, ['桜']);

      final removed = q.toggleFavorite('桜');
      expect(removed, isFalse);
      expect(q.isFavorite('桜'), isFalse);
      expect(q.favorites, isEmpty);

      // 批量添加测试上限保护
      for (var i = 0; i < 550; i++) {
        q.toggleFavorite('fav_$i');
      }
      expect(q.favorites.length, QueryStore.maxFavorites);
      expect(q.favorites.first, 'fav_549');
    });

    test('移除单条历史与清空历史', () {
      final q = QueryStore.instance;
      q.recordQuery('A');
      q.recordQuery('B');
      q.toggleFavorite('F');

      q.removeHistory('A');
      expect(q.history, ['B']);
      expect(q.favorites, ['F']);

      q.clearHistory();
      expect(q.history, isEmpty);
      expect(q.favorites, ['F']); // 收藏不随历史清空
    });
  });

  group('多语言与界面文案 (AppStrings)', () {
    test('AppLanguage 键值解析与默认回退', () {
      expect(AppLanguage.fromName('zh'), AppLanguage.zh);
      expect(AppLanguage.fromName('en'), AppLanguage.en);
      expect(AppLanguage.fromName(null), AppLanguage.zh);
      expect(AppLanguage.fromName('unknown'), AppLanguage.zh);
    });

    test('全部支持语言具备完整的 AppStrings 实现', () {
      for (final lang in AppLanguage.values) {
        final s = AppStrings.forLanguage(lang);
        expect(s.language, lang);
        expect(s.appTitle.isNotEmpty, isTrue);
        expect(s.close.isNotEmpty, isTrue);
        expect(s.copy.isNotEmpty, isTrue);
        expect(s.tagline.isNotEmpty, isTrue);
        expect(s.inputHint.isNotEmpty, isTrue);
      }
    });

    test('中英文动态查表与回退逻辑对齐', () {
      final zh = AppStrings.forLanguage(AppLanguage.zh);
      final en = AppStrings.forLanguage(AppLanguage.en);

      // 排序维度
      for (final sort in KanjiSort.values) {
        expect(zh.sortLabel(sort).isNotEmpty, isTrue);
        expect(en.sortLabel(sort).isNotEmpty, isTrue);
      }

      // 读音要求
      for (final req in ReadingRequirement.values) {
        expect(zh.readingLabel(req).isNotEmpty, isTrue);
        expect(en.readingLabel(req).isNotEmpty, isTrue);
      }

      // 主题模式
      for (final mode in AppThemeMode.values) {
        expect(zh.themeModeLabel(mode).isNotEmpty, isTrue);
        expect(en.themeModeLabel(mode).isNotEmpty, isTrue);
      }

      // 词性标签映射
      expect(zh.posLabel('名詞'), '名詞');
      expect(en.posLabel('名詞'), 'noun');
      expect(zh.posLabel('動詞'), '動詞');
      expect(en.posLabel('動詞'), 'verb');
      expect(zh.posLabel('形容詞'), '形容詞');
      expect(en.posLabel('形容詞'), 'i-adj.');

      // 词性细分映射
      expect(zh.posDetailLabel('一般'), '一般');
      expect(en.posDetailLabel('一般'), 'general');

      // 动态参数文案生成
      expect(zh.copiedSurface('日本'), contains('日本'));
      expect(en.copiedSurface('日本'), contains('日本'));
      expect(zh.filterCount(42), contains('42'));
      expect(en.filterCount(42), contains('42'));
      expect(zh.noRankExcluded(5), contains('5'));
      expect(en.noRankExcluded(5), contains('5'));
      expect(zh.filterChipReading('こう'), contains('こう'));
      expect(en.filterChipReading('こう'), contains('こう'));
      expect(zh.filterChipMeaning('太阳'), contains('太阳'));
      expect(en.filterChipMeaning('sun'), contains('sun'));
      expect(zh.sectionReadingSearch.isNotEmpty, isTrue);
      expect(en.sectionReadingSearch.isNotEmpty, isTrue);
      expect(zh.readingSearchHint.isNotEmpty, isTrue);
      expect(en.readingSearchHint.isNotEmpty, isTrue);
      expect(zh.sectionMeaningSearch.isNotEmpty, isTrue);
      expect(en.sectionMeaningSearch.isNotEmpty, isTrue);
      expect(zh.meaningSearchHint.isNotEmpty, isTrue);
      expect(en.meaningSearchHint.isNotEmpty, isTrue);
      expect(zh.frequencyUnranked.isNotEmpty, isTrue);
      expect(en.frequencyUnranked.isNotEmpty, isTrue);
      expect(zh.labelRadical.isNotEmpty, isTrue);
      expect(en.labelRadical.isNotEmpty, isTrue);
      expect(zh.sectionRadical.isNotEmpty, isTrue);
      expect(en.sectionRadical.isNotEmpty, isTrue);
      expect(zh.filterChipRadical('水'), contains('水'));
      expect(en.filterChipRadical('水'), contains('水'));
      expect(zh.homophoneHeading.isNotEmpty, isTrue);
      expect(en.homophoneHeading.isNotEmpty, isTrue);
      expect(zh.homophoneHint.isNotEmpty, isTrue);
      expect(en.homophoneHint.isNotEmpty, isTrue);
      expect(zh.homophoneBadge(3), contains('3'));
      expect(en.homophoneBadge(3), contains('3'));

      // 视图模式与新功能文案
      expect(zh.viewAlignment.isNotEmpty, isTrue);
      expect(en.viewAlignment.isNotEmpty, isTrue);
      expect(zh.viewFurigana.isNotEmpty, isTrue);
      expect(en.viewFurigana.isNotEmpty, isTrue);
      expect(zh.viewVertical.isNotEmpty, isTrue);
      expect(en.viewVertical.isNotEmpty, isTrue);
      expect(zh.exportAnki.isNotEmpty, isTrue);
      expect(en.exportAnki.isNotEmpty, isTrue);
      expect(zh.exportFavorites.isNotEmpty, isTrue);
      expect(en.exportFavorites.isNotEmpty, isTrue);
      expect(zh.favoritesExportTitle.isNotEmpty, isTrue);
      expect(en.favoritesExportTitle.isNotEmpty, isTrue);
      expect(zh.favoritesExportHint(10), contains('10'));
      expect(en.favoritesExportHint(10), contains('10'));
      expect(zh.radicalPickerTitle.isNotEmpty, isTrue);
      expect(en.radicalPickerTitle.isNotEmpty, isTrue);
      expect(zh.radicalStrokesGroup(3), contains('3'));
      expect(en.radicalStrokesGroup(3), contains('3'));
      expect(zh.yojijukugoHeading.isNotEmpty, isTrue);
      expect(en.yojijukugoHeading.isNotEmpty, isTrue);
      expect(zh.yojijukugoBadge(5), contains('5'));
      expect(en.yojijukugoBadge(5), contains('5'));
      expect(zh.speak.isNotEmpty, isTrue);
      expect(en.speak.isNotEmpty, isTrue);
      expect(zh.paste.isNotEmpty, isTrue);
      expect(en.paste.isNotEmpty, isTrue);
      expect(zh.loanwordLabel.isNotEmpty, isTrue);
      expect(en.loanwordLabel.isNotEmpty, isTrue);
      expect(zh.loanwordOrigin('Dutch'), contains('Dutch'));
      expect(en.loanwordOrigin('Dutch'), contains('Dutch'));
    });

    test('全量文案契约与全字段双语非空校验', () {
      for (final lang in AppLanguage.values) {
        expect(lang.label.isNotEmpty, isTrue);
        final s = AppStrings.forLanguage(lang);

        // 校验全部静态 getters
        expect(s.appTitle.isNotEmpty, isTrue, reason: 'appTitle in $lang');
        expect(s.close.isNotEmpty, isTrue, reason: 'close in $lang');
        expect(s.copy.isNotEmpty, isTrue, reason: 'copy in $lang');
        expect(s.tagline.isNotEmpty, isTrue, reason: 'tagline in $lang');
        expect(s.inputHint.isNotEmpty, isTrue, reason: 'inputHint in $lang');
        expect(s.loadingDictionary.isNotEmpty, isTrue, reason: 'loadingDictionary in $lang');
        expect(s.clear.isNotEmpty, isTrue, reason: 'clear in $lang');
        expect(s.search.isNotEmpty, isTrue, reason: 'search in $lang');
        expect(s.filterKanji.isNotEmpty, isTrue, reason: 'filterKanji in $lang');
        expect(s.settings.isNotEmpty, isTrue, reason: 'settings in $lang');
        expect(s.viewAlignment.isNotEmpty, isTrue, reason: 'viewAlignment in $lang');
        expect(s.viewFurigana.isNotEmpty, isTrue, reason: 'viewFurigana in $lang');
        expect(s.viewVertical.isNotEmpty, isTrue, reason: 'viewVertical in $lang');
        expect(s.romajiToggle.isNotEmpty, isTrue, reason: 'romajiToggle in $lang');
        expect(s.speak.isNotEmpty, isTrue, reason: 'speak in $lang');
        expect(s.speaking.isNotEmpty, isTrue, reason: 'speaking in $lang');
        expect(s.paste.isNotEmpty, isTrue, reason: 'paste in $lang');
        expect(s.export.isNotEmpty, isTrue, reason: 'export in $lang');
        expect(s.exportRuby.isNotEmpty, isTrue, reason: 'exportRuby in $lang');
        expect(s.exportBrackets.isNotEmpty, isTrue, reason: 'exportBrackets in $lang');
        expect(s.exportAnki.isNotEmpty, isTrue, reason: 'exportAnki in $lang');
        expect(s.exportFavorites.isNotEmpty, isTrue, reason: 'exportFavorites in $lang');
        expect(s.favoritesExportTitle.isNotEmpty, isTrue, reason: 'favoritesExportTitle in $lang');
        expect(s.exportPlainText.isNotEmpty, isTrue, reason: 'exportPlainText in $lang');
        expect(s.exporting.isNotEmpty, isTrue, reason: 'exporting in $lang');
        expect(s.copiedRuby.isNotEmpty, isTrue, reason: 'copiedRuby in $lang');
        expect(s.copiedBrackets.isNotEmpty, isTrue, reason: 'copiedBrackets in $lang');
        expect(s.copiedAnki.isNotEmpty, isTrue, reason: 'copiedAnki in $lang');
        expect(s.ankiAnalysisFailed.isNotEmpty, isTrue, reason: 'ankiAnalysisFailed in $lang');
        expect(s.ttsUnavailable.isNotEmpty, isTrue, reason: 'ttsUnavailable in $lang');
        expect(s.ankiTagSentence.isNotEmpty, isTrue, reason: 'ankiTagSentence in $lang');
        expect(s.ankiTagFavorite.isNotEmpty, isTrue, reason: 'ankiTagFavorite in $lang');
        expect(s.labelHiragana.isNotEmpty, isTrue, reason: 'labelHiragana in $lang');
        expect(s.labelPronunciation.isNotEmpty, isTrue, reason: 'labelPronunciation in $lang');
        expect(s.copiedFullHiragana.isNotEmpty, isTrue, reason: 'copiedFullHiragana in $lang');
        expect(s.copiedFullRomaji.isNotEmpty, isTrue, reason: 'copiedFullRomaji in $lang');
        expect(s.copiedPronunciation.isNotEmpty, isTrue, reason: 'copiedPronunciation in $lang');
        expect(s.showAllResults.isNotEmpty, isTrue, reason: 'showAllResults in $lang');
        expect(s.showLessResults.isNotEmpty, isTrue, reason: 'showLessResults in $lang');
        expect(s.favoritesLabel.isNotEmpty, isTrue, reason: 'favoritesLabel in $lang');
        expect(s.historyLabel.isNotEmpty, isTrue, reason: 'historyLabel in $lang');
        expect(s.clearHistory.isNotEmpty, isTrue, reason: 'clearHistory in $lang');
        expect(s.historyCleared.isNotEmpty, isTrue, reason: 'historyCleared in $lang');
        expect(s.columnKanji.isNotEmpty, isTrue, reason: 'columnKanji in $lang');
        expect(s.columnHiragana.isNotEmpty, isTrue, reason: 'columnHiragana in $lang');
        expect(s.columnRomaji.isNotEmpty, isTrue, reason: 'columnRomaji in $lang');
        expect(s.fullHiragana.isNotEmpty, isTrue, reason: 'fullHiragana in $lang');
        expect(s.fullRomaji.isNotEmpty, isTrue, reason: 'fullRomaji in $lang');
        expect(s.pronunciationShiftLabel.isNotEmpty, isTrue, reason: 'pronunciationShiftLabel in $lang');
        expect(s.loanwordLabel.isNotEmpty, isTrue, reason: 'loanwordLabel in $lang');
        expect(s.onyomiHeading.isNotEmpty, isTrue, reason: 'onyomiHeading in $lang');
        expect(s.kunyomiHeading.isNotEmpty, isTrue, reason: 'kunyomiHeading in $lang');
        expect(s.onyomiHint.isNotEmpty, isTrue, reason: 'onyomiHint in $lang');
        expect(s.kunyomiHint.isNotEmpty, isTrue, reason: 'kunyomiHint in $lang');
        expect(s.onyomiBadge.isNotEmpty, isTrue, reason: 'onyomiBadge in $lang');
        expect(s.kunyomiBadge.isNotEmpty, isTrue, reason: 'kunyomiBadge in $lang');
        expect(s.labelStrokes.isNotEmpty, isTrue, reason: 'labelStrokes in $lang');
        expect(s.labelGrade.isNotEmpty, isTrue, reason: 'labelGrade in $lang');
        expect(s.labelFrequency.isNotEmpty, isTrue, reason: 'labelFrequency in $lang');
        expect(s.labelRadical.isNotEmpty, isTrue, reason: 'labelRadical in $lang');
        expect(s.frequencyUnranked.isNotEmpty, isTrue, reason: 'frequencyUnranked in $lang');
        expect(s.gradeCommon.isNotEmpty, isTrue, reason: 'gradeCommon in $lang');
        expect(s.gradeNameUse.isNotEmpty, isTrue, reason: 'gradeNameUse in $lang');
        expect(s.gradeOther.isNotEmpty, isTrue, reason: 'gradeOther in $lang');
        expect(s.collapse.isNotEmpty, isTrue, reason: 'collapse in $lang');
        expect(s.readingsNotFound.isNotEmpty, isTrue, reason: 'readingsNotFound in $lang');
        expect(s.commonWordsHeading.isNotEmpty, isTrue, reason: 'commonWordsHeading in $lang');
        expect(s.homophoneHeading.isNotEmpty, isTrue, reason: 'homophoneHeading in $lang');
        expect(s.homophoneHint.isNotEmpty, isTrue, reason: 'homophoneHint in $lang');
        expect(s.yojijukugoHeading.isNotEmpty, isTrue, reason: 'yojijukugoHeading in $lang');
        expect(s.yojijukugoHint.isNotEmpty, isTrue, reason: 'yojijukugoHint in $lang');
        expect(s.filterTitle.isNotEmpty, isTrue, reason: 'filterTitle in $lang');
        expect(s.reset.isNotEmpty, isTrue, reason: 'reset in $lang');
        expect(s.viewResults.isNotEmpty, isTrue, reason: 'viewResults in $lang');
        expect(s.sectionSort.isNotEmpty, isTrue, reason: 'sectionSort in $lang');
        expect(s.sectionStrokes.isNotEmpty, isTrue, reason: 'sectionStrokes in $lang');
        expect(s.sectionFrequency.isNotEmpty, isTrue, reason: 'sectionFrequency in $lang');
        expect(s.sectionRadical.isNotEmpty, isTrue, reason: 'sectionRadical in $lang');
        expect(s.allRadicals.isNotEmpty, isTrue, reason: 'allRadicals in $lang');
        expect(s.radicalPickerTitle.isNotEmpty, isTrue, reason: 'radicalPickerTitle in $lang');
        expect(s.radicalPickerSubtitle.isNotEmpty, isTrue, reason: 'radicalPickerSubtitle in $lang');
        expect(s.sectionReadings.isNotEmpty, isTrue, reason: 'sectionReadings in $lang');
        expect(s.sectionReadingSearch.isNotEmpty, isTrue, reason: 'sectionReadingSearch in $lang');
        expect(s.readingSearchHint.isNotEmpty, isTrue, reason: 'readingSearchHint in $lang');
        expect(s.sectionMeaningSearch.isNotEmpty, isTrue, reason: 'sectionMeaningSearch in $lang');
        expect(s.meaningSearchHint.isNotEmpty, isTrue, reason: 'meaningSearchHint in $lang');
        expect(s.sectionOther.isNotEmpty, isTrue, reason: 'sectionOther in $lang');
        expect(s.any.isNotEmpty, isTrue, reason: 'any in $lang');
        expect(s.min.isNotEmpty, isTrue, reason: 'min in $lang');
        expect(s.max.isNotEmpty, isTrue, reason: 'max in $lang');
        expect(s.blankMeansAny.isNotEmpty, isTrue, reason: 'blankMeansAny in $lang');
        expect(s.rangeInverted.isNotEmpty, isTrue, reason: 'rangeInverted in $lang');
        expect(s.grade1.isNotEmpty, isTrue, reason: 'grade1 in $lang');
        expect(s.grade2.isNotEmpty, isTrue, reason: 'grade2 in $lang');
        expect(s.grade3.isNotEmpty, isTrue, reason: 'grade3 in $lang');
        expect(s.grade4.isNotEmpty, isTrue, reason: 'grade4 in $lang');
        expect(s.grade5.isNotEmpty, isTrue, reason: 'grade5 in $lang');
        expect(s.grade6.isNotEmpty, isTrue, reason: 'grade6 in $lang');
        expect(s.gradeCommonChip.isNotEmpty, isTrue, reason: 'gradeCommonChip in $lang');
        expect(s.gradeNameChip.isNotEmpty, isTrue, reason: 'gradeNameChip in $lang');
        expect(s.resultsTitle.isNotEmpty, isTrue, reason: 'resultsTitle in $lang');
        expect(s.noResultsTitle.isNotEmpty, isTrue, reason: 'noResultsTitle in $lang');
        expect(s.noResultsHint.isNotEmpty, isTrue, reason: 'noResultsHint in $lang');
        expect(s.settingsSubtitle.isNotEmpty, isTrue, reason: 'settingsSubtitle in $lang');
        expect(s.sectionAppearance.isNotEmpty, isTrue, reason: 'sectionAppearance in $lang');
        expect(s.sectionScreen.isNotEmpty, isTrue, reason: 'sectionScreen in $lang');
        expect(s.sectionLanguage.isNotEmpty, isTrue, reason: 'sectionLanguage in $lang');
        expect(s.sectionOtherSettings.isNotEmpty, isTrue, reason: 'sectionOtherSettings in $lang');
        expect(s.theme.isNotEmpty, isTrue, reason: 'theme in $lang');
        expect(s.autoRotate.isNotEmpty, isTrue, reason: 'autoRotate in $lang');
        expect(s.autoRotateOn.isNotEmpty, isTrue, reason: 'autoRotateOn in $lang');
        expect(s.autoRotateOff.isNotEmpty, isTrue, reason: 'autoRotateOff in $lang');
        expect(s.about.isNotEmpty, isTrue, reason: 'about in $lang');
        expect(s.aboutSubtitle.isNotEmpty, isTrue, reason: 'aboutSubtitle in $lang');
        expect(s.versionLabel.isNotEmpty, isTrue, reason: 'versionLabel in $lang');
        expect(s.buildLabel.isNotEmpty, isTrue, reason: 'buildLabel in $lang');
        expect(s.packageLabel.isNotEmpty, isTrue, reason: 'packageLabel in $lang');
        expect(s.repositoryLabel.isNotEmpty, isTrue, reason: 'repositoryLabel in $lang');
        expect(s.repositoryCopied.isNotEmpty, isTrue, reason: 'repositoryCopied in $lang');
        expect(s.licensesSection.isNotEmpty, isTrue, reason: 'licensesSection in $lang');
        expect(s.diagnosticsSection.isNotEmpty, isTrue, reason: 'diagnosticsSection in $lang');
        expect(s.exportDiagnostics.isNotEmpty, isTrue, reason: 'exportDiagnostics in $lang');
        expect(s.diagnosticsHint.isNotEmpty, isTrue, reason: 'diagnosticsHint in $lang');
        expect(s.diagnosticsCopied.isNotEmpty, isTrue, reason: 'diagnosticsCopied in $lang');
        expect(s.diagnosticsEmpty.isNotEmpty, isTrue, reason: 'diagnosticsEmpty in $lang');
        expect(s.analysisFailedGeneric.isNotEmpty, isTrue, reason: 'analysisFailedGeneric in $lang');
        expect(s.licenseAppCode.isNotEmpty, isTrue, reason: 'licenseAppCode in $lang');
        expect(s.licenseKanjiData.isNotEmpty, isTrue, reason: 'licenseKanjiData in $lang');
        expect(s.licenseAnalyzer.isNotEmpty, isTrue, reason: 'licenseAnalyzer in $lang');
        expect(s.licenseOpenCc.isNotEmpty, isTrue, reason: 'licenseOpenCc in $lang');
        expect(s.creditsSection.isNotEmpty, isTrue, reason: 'creditsSection in $lang');
        expect(s.creditAnalyzer.isNotEmpty, isTrue, reason: 'creditAnalyzer in $lang');
        expect(s.creditKanjiData.isNotEmpty, isTrue, reason: 'creditKanjiData in $lang');
        expect(s.creditTokenizerDict.isNotEmpty, isTrue, reason: 'creditTokenizerDict in $lang');
        expect(s.creditOpenCc.isNotEmpty, isTrue, reason: 'creditOpenCc in $lang');
        expect(s.creditFramework.isNotEmpty, isTrue, reason: 'creditFramework in $lang');
        expect(s.offlineNotice.isNotEmpty, isTrue, reason: 'offlineNotice in $lang');

        // 校验全部参数化方法各分支
        expect(s.inputExceededLimit(100).isNotEmpty, isTrue);
        expect(s.favoritesExportHint(5).isNotEmpty, isTrue);
        expect(s.copiedAnkiWithFailures(2).isNotEmpty, isTrue);
        expect(s.ankiBaseFormPrefix('食べる').isNotEmpty, isTrue);
        expect(s.ankiOnyomiPrefix('にち').isNotEmpty, isTrue);
        expect(s.ankiKunyomiPrefix('ひ').isNotEmpty, isTrue);
        expect(s.ankiNote(4, 10).isNotEmpty, isTrue);
        expect(s.dictionaryInitFailed('mock error').isNotEmpty, isTrue);
        expect(s.analysisFailed('mock error').isNotEmpty, isTrue);
        expect(s.settingsSaveFailed('mock error').isNotEmpty, isTrue);
        expect(s.settingsLoadFailed('mock error').isNotEmpty, isTrue);
        expect(s.longResultNotice(50, 100).isNotEmpty, isTrue);
        expect(s.allResultsShown(100).isNotEmpty, isTrue);
        expect(s.favoriteAdded('東京').isNotEmpty, isTrue);
        expect(s.favoriteRemoved('東京').isNotEmpty, isTrue);
        expect(s.historyRemoved('東京').isNotEmpty, isTrue);
        expect(s.copiedSurface('東京').isNotEmpty, isTrue);
        expect(s.baseForm('行く').isNotEmpty, isTrue);
        expect(s.loanwordOrigin('英语').isNotEmpty, isTrue);
        expect(s.collapseHidden(3).isNotEmpty, isTrue);
        expect(s.commonWordsBadge(12).isNotEmpty, isTrue);
        expect(s.homophoneBadge(4).isNotEmpty, isTrue);
        expect(s.yojijukugoBadge(7).isNotEmpty, isTrue);
        expect(s.radicalStrokesGroup(3).isNotEmpty, isTrue);
        expect(s.filterCount(88).isNotEmpty, isTrue);
        expect(s.filterChipReading('こう').isNotEmpty, isTrue);
        expect(s.filterChipMeaning('sun').isNotEmpty, isTrue);
        expect(s.filterChipRadical('水').isNotEmpty, isTrue);
        expect(s.resultCount(15).isNotEmpty, isTrue);
        expect(s.strokesShort(5).isNotEmpty, isTrue);
        expect(s.noRankExcluded(624).isNotEmpty, isTrue);
        expect(s.aboutTitle('1.2.0').isNotEmpty, isTrue);

        // 学年各分支
        for (final g in [1, 2, 3, 4, 5, 6, 8, 9, 10]) {
          expect(s.gradeNumbered(g).isNotEmpty, isTrue);
        }

        // 笔画范围分支 (双端 / 单端 / 全空)
        expect(s.filterChipStrokes(3, 8).isNotEmpty, isTrue);
        expect(s.filterChipStrokes(3, null).isNotEmpty, isTrue);
        expect(s.filterChipStrokes(null, 8).isNotEmpty, isTrue);
        expect(s.filterChipStrokes(null, null), '');

        // 频率范围分支 (双端 / 单端 / 全空)
        expect(s.filterChipFrequency(1, 100).isNotEmpty, isTrue);
        expect(s.filterChipFrequency(1, null).isNotEmpty, isTrue);
        expect(s.filterChipFrequency(null, 100).isNotEmpty, isTrue);
        expect(s.filterChipFrequency(null, null), '');

        // 枚举查表
        for (final sort in KanjiSort.values) {
          expect(s.sortLabel(sort).isNotEmpty, isTrue);
        }
        for (final req in ReadingRequirement.values) {
          expect(s.readingLabel(req).isNotEmpty, isTrue);
        }
        for (final mode in AppThemeMode.values) {
          expect(s.themeModeLabel(mode).isNotEmpty, isTrue);
        }

        // 常见与未知词性
        for (final pos in ['名詞', '動詞', '助動詞', '副詞', '記号', '未知词性']) {
          expect(s.posLabel(pos).isNotEmpty, isTrue);
        }
        for (final det in ['一般', '固有名詞', '自立', '数', '地域', '未知细分']) {
          expect(s.posDetailLabel(det).isNotEmpty, isTrue);
        }
      }
    });

  });

  group('康熙部首字典 (radical_dict)', () {
    test('214 个康熙部首完整性', () {
      expect(kKangxiRadicals.length, 214);
      expect(kRadicalStrokes.length, 214);
      expect(getRadicalChar(1), '一');
      expect(getRadicalChar(214), '龠');
      expect(getRadicalStroke(1), 1);
      expect(getRadicalStroke(214), 17);
    });

    test('按画数分组聚合', () {
      final grouped = kRadicalsGroupedByStrokes;
      var total = 0;
      for (var s = 1; s <= 17; s++) {
        if (grouped.containsKey(s)) {
          total += grouped[s]!.length;
        }
      }
      expect(total, 214);
      expect(grouped[1]!.contains(1), isTrue); // 一
      expect(grouped[4]!.contains(85), isTrue); // 水
    });

    test('部首汉字数量统计', () {
      final waterCount = kRadicalKanjiCounts[85];
      expect(waterCount, 164);
    });
  });

  group('片假名外来语字典 (loanwords_dict)', () {
    test('收录外来语及其词源语言', () {
      final coffee = lookupLoanword('コーヒー');
      expect(coffee, isNotNull);
      expect(coffee!.language, 'nl');
      expect(coffee.source, contains('koffie'));

      final arubaito = lookupLoanword('アルバイト');
      expect(arubaito, isNotNull);
      expect(arubaito!.language, 'de');
      expect(arubaito.source, contains('Arbeit'));

      final pan = lookupLoanword('パン');
      expect(pan, isNotNull);
      expect(pan!.language, 'pt');
      expect(pan.source, contains('pão'));

      expect(lookupLoanword('日本'), isNull);
      expect(lookupLoanword('あ'), isNull);
    });
  });

  group('四字熟语字典 (yojijukugo_dict)', () {
    test('熟语反查与读音释义', () {
      expect(kYojijukugoList.length >= 40, isTrue);
      final item = kYojijukugoList.firstWhere((y) => y.kanji == '一期一会');
      expect(item.reading, 'いちごいちえ');
      expect(item.meaningZh.isNotEmpty, isTrue);
      expect(item.meaningEn.isNotEmpty, isTrue);

      final nichishin = kYojijukugoList.firstWhere((y) => y.kanji == '日進月歩');
      expect(nichishin.reading, 'にっしんげっぽ');
    });

    test('单汉字反向索引关联四字熟语', () {
      final forHi = getYojijukugoForKanji('日');
      expect(forHi.any((y) => y.kanji == '日進月歩'), isTrue);

      final forIchi = getYojijukugoForKanji('一');
      expect(forIchi.any((y) => y.kanji == '一期一会'), isTrue);

      expect(getYojijukugoForKanji('𠮷'), isEmpty);
    });
  });

  group('Anki TSV 导出', () {
    test('单汉字与多词句子导出为 Anki TSV 格式', () {
      const singleRes = AnalysisResult(
        source: '日',
        morphemes: [],
        singleKanji: KanjiReading(
          kanji: '日',
          onyomi: ['ニチ'],
          kunyomi: ['ひ'],
          meanings: ['太阳'],
          meaningsEn: ['sun'],
          grade: 1,
          strokes: 4,
          frequencyRank: 42,
        ),
      );
      expect(singleRes.toAnkiTsv, contains('日\t音: ニチ / 训: ひ\t\t太阳\t笔画: 4 | 频率: 42'));

      final m1 = Morpheme.fromToken({
        'surface_form': '東京',
        'reading': 'トウキョウ',
        'pos': '名詞',
        'pos_detail_1': '固有名詞',
      });
      final m2 = Morpheme.fromToken({
        'surface_form': 'に',
        'reading': 'ニ',
        'pos': '助詞',
      });
      final res = AnalysisResult(
        source: '東京に',
        morphemes: [m1, m2],
      );
      final tsv = res.toAnkiTsv;
      expect(tsv, contains('東京に\tとうきょうに\ttoukyou ni\t完整句'));
      expect(tsv, contains('東京\tとうきょう\ttoukyou\t名詞/固有名詞'));
      expect(tsv.contains('\nに\t'), isFalse);
    });
  });

  group('安全与性能改进用例 (IMPROVEMENTS)', () {
    test('SEC-01: 超长文本分词截断保护与标记', () async {
      final huge = '本' * (kMaxInputLength + 500);
      final res = await JapaneseAnalyzer.instance.analyze(huge);
      expect(res.isTruncated, isTrue);
      expect(res.source.length, kMaxInputLength);
    });

    test('SEC-02: QueryStore 文本清洗与最大长度截断', () {
      final longText = 'A' * 300;
      final sanitized = QueryStore.sanitizeText(longText);
      expect(sanitized.length, QueryStore.maxQueryTextLength);

      const dirty = '東京\x00\x08テスト';
      expect(QueryStore.sanitizeText(dirty), '東京テスト');
    });

    test('SEC-03: Anki TSV HTML 特殊字符转义', () {
      const text = '<b>"test"</b>&\'sample\'';
      final escaped = AnalysisResult.escapeTsvField(text);
      expect(escaped, contains('&lt;b&gt;'));
      expect(escaped, contains('&quot;test&quot;'));
      expect(escaped, contains('&amp;'));
      expect(escaped.contains('<b'), isFalse);
    });

    test('ARCH-01: 单例 resetForTesting 状态复位', () {
      QueryStore.instance.recordQuery('测试');
      expect(QueryStore.instance.history, isNotEmpty);
      QueryStore.instance.resetForTesting();
      expect(QueryStore.instance.history, isEmpty);
      expect(QueryStore.instance.favorites, isEmpty);

      SettingsController.instance.resetForTesting();
      expect(SettingsController.instance.themeMode, AppThemeMode.system);
    });

    test('ARCH-03 & CODE-02: KanjiHomophones 同音词反向索引与音训推荐', () {
      // 验证 warmUp 可重复安全调用且触发倒排表就绪
      KanjiHomophones.warmUp();

      final flower = kanjiReadingDict['花']!;
      final homophones = KanjiHomophones.findHomophones(flower);
      expect(homophones, isNotEmpty);
      expect(homophones.any((r) => r.kanji == '鼻'), isTrue);

      final nichiList = KanjiHomophones.getByOnyomi('にち');
      expect(nichiList.any((r) => r.kanji == '日'), isTrue);

      final hanaList = KanjiHomophones.getByKunyomi('はな');
      expect(hanaList.any((r) => r.kanji == '花'), isTrue);
      expect(hanaList.any((r) => r.kanji == '鼻'), isTrue);
    });

    test('PERF-01: applyWithStats 单次遍历返回 FilterResult', () {
      const filter = KanjiFilter(frequencyMin: 1, frequencyMax: 50);
      final res = filter.applyWithStats(kanjiReadingDict.values);
      expect(res.items.length, 50);
      expect(res.excludedNoRankCount, greaterThan(0));
    });

    test('CODE-01: 改良平文罗马音全角标点符号转半角', () {
      final romaji = hiraganaToRomaji('わたし、にほん。');
      expect(romaji, 'watashi, nihon. ');
      expect(hiraganaToRomaji('「はい」'), '"hai"');
    });

    test('ROBUST-01: JapaneseAnalyzer 分词 isolate 异常崩溃时自动重启并重试', () async {
      final analyzer = JapaneseAnalyzer.instance;
      await analyzer.warmUp();
      expect(analyzer.isReady, isTrue);

      // 模拟 isolate 崩溃退出
      analyzer.simulateCrashForTesting();
      expect(analyzer.isReady, isFalse);

      // 再次调用 analyze，断言能自动自愈并返回正确结果
      final result = await analyzer.analyze('日本語');
      expect(result.morphemes, isNotEmpty);
      expect(result.fullHiragana, 'にほんご');
      expect(analyzer.isReady, isTrue);
    });

    test('ROBUST-02: isolate 无回信时请求超时并自动重建', () async {
      final analyzer = JapaneseAnalyzer.instance;
      await analyzer.warmUp();
      analyzer.simulateHangForTesting();

      final result = await analyzer.analyze(
        '日本語',
        timeout: const Duration(milliseconds: 300),
      );
      expect(result.fullHiragana, 'にほんご');
      expect(analyzer.isReady, isTrue);
    });

    test('ROBUST-03: analyze 在已取消时不执行分词或丢弃结果', () async {
      final analyzer = JapaneseAnalyzer.instance;
      await analyzer.warmUp();

      // 提前取消
      final res1 = await analyzer.analyze('日本語', isCancelled: () => true);
      expect(res1.morphemes, isEmpty);

      // 分析多行文本时取消
      final res2 = await analyzer.analyze('日本語\n東京', isCancelled: () => true);
      expect(res2.morphemes, isEmpty);
    });

    test('ROBUST-04: analyzeBatch 在 isolate 崩溃时自动自愈并重试成功', () async {
      final analyzer = JapaneseAnalyzer.instance;
      await analyzer.warmUp();

      analyzer.simulateCrashForTesting();
      expect(analyzer.isReady, isFalse);

      final results = await analyzer.analyzeBatch(['日本語', '桜']);
      expect(results.length, 2);
      expect(results[0].fullHiragana, 'にほんご');
      expect(results[1].fullHiragana, 'さくら');
      expect(analyzer.isReady, isTrue);
    });

    test('ROBUST-05: analyzeBatch 混合空行与取消状态边界测试', () async {
      final analyzer = JapaneseAnalyzer.instance;
      await analyzer.warmUp();

      // 混合空字符串与空白
      final results = await analyzer.analyzeBatch(['', '   ', '富士山', '']);
      expect(results.length, 4);
      expect(results[0].morphemes, isEmpty);
      expect(results[1].morphemes, isEmpty);
      expect(results[2].fullHiragana, 'ふじさん');
      expect(results[3].morphemes, isEmpty);

      // isCancelled 检查
      final cancelled = await analyzer.analyzeBatch(['富士山'], isCancelled: () => true);
      expect(cancelled, isEmpty);
    });

    test('PERF-02: 4000 字符长文本分词、分段及截断边界验证', () async {
      final analyzer = JapaneseAnalyzer.instance;
      // 构造超过 4000 字符的超长多段落文本 (测试截断边界与长文本分词鲁棒性)
      final text = '吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。\n' * 125;
      expect(text.length, greaterThan(kMaxInputLength));

      final res = await analyzer.analyze(text);
      expect(res.isTruncated, isTrue);
      expect(res.source.length, kMaxInputLength);
      expect(res.paragraphs, isNotEmpty);
      expect(res.morphemes, isNotEmpty);
    });

    test('DI-01: KanjiServices 默认单例组合与服务访问', () {
      final services = KanjiServices.defaultServices;
      expect(identical(services.analyzer, JapaneseAnalyzer.instance), isTrue);
      expect(identical(services.queryStore, QueryStore.instance), isTrue);
      expect(identical(services.settings, SettingsController.instance), isTrue);
      expect(identical(services.tts, TtsService.instance), isTrue);
      expect(identical(services.platform, PlatformService.instance), isTrue);
    });

    test('SEC-01: InputSanitizer 字符过滤与截断防护', () {
      expect(InputSanitizer.clean(''), '');
      expect(InputSanitizer.clean('   '), '');
      // 双向文本控制字符与零宽空格过滤
      expect(InputSanitizer.clean('abc\u202A\u200Bdef\uFEFF'), 'abcdef');
      // C0 控制字符过滤，但保留中间的换行与制表符，首尾空白正常 trim
      expect(InputSanitizer.clean('line1\x00\x07\nline2\tmore'), 'line1\nline2\tmore');
      expect(InputSanitizer.clean('  hello\nworld\t  '), 'hello\nworld');
      // 长度超限截断
      final long = 'a' * 5000;
      expect(InputSanitizer.clean(long, maxLength: 50).length, 50);
    });

    test('SEC-01: 字素簇截断不拆开代理对', () {
      final rare = 'a' * 49 + '𠮷';
      final kept = InputSanitizer.clean(rare, maxLength: 50);
      expect(kept, rare);
      expect(kept.runes.last, '𠮷'.runes.first);

      final cut = InputSanitizer.clean('a' * 50 + '𠮷', maxLength: 50);
      expect(cut, 'a' * 50);
      expect(cut.codeUnits.any((unit) => unit >= 0xD800 && unit <= 0xDBFF),
          isFalse);
    });

    test('SEC-02: TSV Formula Injection 防御测试', () {
      expect(AnalysisResult.escapeTsvField('=1+1'), "'=1+1");
      expect(AnalysisResult.escapeTsvField('+cmd|'), "'+cmd|");
      expect(AnalysisResult.escapeTsvField('-5'), "'-5");
      expect(AnalysisResult.escapeTsvField('@SUM(A1)'), "'@SUM(A1)");
      expect(AnalysisResult.escapeTsvField('|calc.exe'), "'|calc.exe");
      expect(AnalysisResult.escapeTsvField('%PATH%'), "'%PATH%");
      expect(AnalysisResult.escapeTsvField('  =cmd'), "'  =cmd");
      // 普通文本不受影响
      expect(AnalysisResult.escapeTsvField('日本語'), '日本語');
      expect(AnalysisResult.escapeTsvField('a=b'), 'a=b');
    });

    test('CODE-02: ViewMode.fromName 模式匹配解析', () {
      expect(ViewMode.fromName('vertical'), ViewMode.vertical);
      expect(ViewMode.fromName('furigana'), ViewMode.furigana);
      expect(ViewMode.fromName('alignment'), ViewMode.alignment);
      expect(ViewMode.fromName('unknown'), ViewMode.alignment);
      expect(ViewMode.fromName(null), ViewMode.alignment);
    });

    test('ARCH-01: HomeCoordinator 业务调度与防抖分词', () async {
      final services = KanjiServices.defaultServices;
      final coordinator = HomeCoordinator(services: services);

      expect(coordinator.loading, isTrue);
      await coordinator.init();
      expect(coordinator.loading, isFalse);
      expect(coordinator.errorKind, isNull);

      // 立即触发分词
      await coordinator.runAnalysis('桜');
      expect(coordinator.result, isNotNull);
      expect(coordinator.result!.singleKanji, isNotNull);
      expect(coordinator.lastAnalyzedText, '桜');

      // 收藏切换
      expect(coordinator.isFavorite('桜'), isFalse);
      final favorited = coordinator.toggleFavorite('桜');
      expect(favorited, isTrue);
      expect(coordinator.isFavorite('桜'), isTrue);
      coordinator.toggleFavorite('桜'); // 还原

      // 清空
      coordinator.clear();
      expect(coordinator.lastAnalyzedText, '');

      coordinator.dispose();
    });

    test('KANJI-CONV-01: KanjiConverter 简体字转日文新字体', () {
      expect(KanjiConverter.toJapaneseKanji('练习'), '練習');
      expect(KanjiConverter.toJapaneseKanji('练'), '練');
      expect(KanjiConverter.toJapaneseKanji('单'), '単');
      expect(KanjiConverter.toJapaneseKanji('发'), '発');
      expect(KanjiConverter.toJapaneseKanji('广'), '広');
      expect(KanjiConverter.toJapaneseKanji('变'), '変');
      expect(KanjiConverter.toJapaneseKanji('图'), '図');
      expect(KanjiConverter.toJapaneseKanji('铁'), '鉄');
      expect(KanjiConverter.toJapaneseKanji('关'), '関');
      expect(KanjiConverter.toJapaneseKanji('齿'), '歯');
      expect(KanjiConverter.toJapaneseKanji('气'), '気');
      expect(KanjiConverter.toJapaneseKanji('学'), '学');
      expect(KanjiConverter.toJapaneseKanji('国'), '国');
      expect(KanjiConverter.toJapaneseKanji('汉语'), '漢語');
      expect(KanjiConverter.toJapaneseKanji('机会'), '機会');
      expect(KanjiConverter.toJapaneseKanji('头发'), '頭髪');
      expect(KanjiConverter.toJapaneseKanji('占'), '占');
      expect(KanjiConverter.toJapaneseKanji('机'), '机');
      expect(KanjiConverter.toJapaneseKanji('携'), '携');
      expect(KanjiConverter.toJapaneseKanji('叶'), '叶');
      expect(KanjiConverter.toJapaneseKanji('干'), '干');
      expect(KanjiConverter.toJapaneseKanji('里'), '里');
      expect(KanjiConverter.toJapaneseKanji('过滤'), '過濾');

      expect(KanjiConverter.hasSimplified('练习'), isTrue);
      expect(KanjiConverter.hasSimplified('練習'), isFalse);
      expect(KanjiConverter.hasSimplified(''), isFalse);

      // 全字典反向安全校验
      for (final k in kanjiReadingDict.keys) {
        final converted = KanjiConverter.toJapaneseKanji(k);
        expect(
          kanjiReadingDict.containsKey(converted),
          isTrue,
          reason: '汉字 $k 转换后变为 $converted，但不在合法字典中',
        );
      }
    });
  });

  group('本地诊断日志', () {
    setUp(() => DiagnosticsLog.instance.clear());
    tearDown(() => DiagnosticsLog.instance.clear());

    test('分析失败类型可区分是否可重试', () {
      expect(const AnalyzerNotReady().retryable, isTrue);
      expect(const AnalyzerIsolateExited().retryable, isTrue);
      final timeout = AnalyzerTimeout(const Duration(milliseconds: 10));
      expect(timeout.retryable, isTrue);
      expect(timeout.message, contains('10ms'));
      expect(
        const AnalyzerTokenizeError(message: 'bad input').retryable,
        isFalse,
      );
    });

    test('记录模块、错误类型与堆栈并可导出', () {
      DiagnosticsLog.instance.record(
        'analysis',
        StateError('boom'),
        stackTrace: StackTrace.fromString('#0 test'),
      );
      final text = DiagnosticsLog.instance.export();
      expect(text, contains('[analysis] StateError'));
      expect(text, contains('boom'));
      expect(text, contains('#0 test'));
    });

    test('对包含引号文本与中日文字符串的异常消息自动脱敏', () {
      DiagnosticsLog.instance.record(
        'analysis',
        const FormatException('failed on \'秘密の日本語\' and \'user_token_123\''),
      );
      final text = DiagnosticsLog.instance.export();
      expect(text, isNot(contains('秘密の日本語')));
      expect(text, isNot(contains('user_token_123')));
      expect(text, contains('[REDACTED]'));
    });

    test('超过容量时只保留最近 100 条', () {
      for (var i = 0; i < 105; i++) {
        DiagnosticsLog.instance.record('module', Exception('e$i'));
      }
      expect(DiagnosticsLog.instance.entries.length, 100);
      expect(DiagnosticsLog.instance.export(), contains('e104'));
      expect(DiagnosticsLog.instance.export(), isNot(contains('e0\n')));
    });
  });

  group('KuromojiEngine 词典引擎封装', () {
    test('初始未构建状态下 tokenize 抛出 StateError', () {
      final engine = KuromojiEngine();
      expect(engine.isInitialized, isFalse);
      expect(() => engine.tokenize('テスト'), throwsStateError);
    });

    test('build() 成功初始化并正常切分词条', () async {
      final engine = KuromojiEngine();
      await engine.build();
      expect(engine.isInitialized, isTrue);

      final tokens = engine.tokenize('日本語');
      expect(tokens, isNotEmpty);
      expect(tokens.first['surface_form'], isNotNull);
    });
  });
}
