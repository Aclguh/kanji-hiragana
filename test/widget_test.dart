// 重组件的宿主机 widget 测试。
//
// integration_test 仍是最终门槛 (AGENTS.md), 这里让核心组件的行为
// 回归在 `flutter test` 时即被发现, 不必连接真机。
//
// 全部重组件用例在深色与浅色主题下各跑一遍: 浅色配色 (对比度、
// 描边可见性) 之前零回归保障, 布局溢出作为硬错误也会一并暴露。
import 'dart:ui' show Tristate;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:kanji_hiragana/core/kanji_filter.dart';
import 'package:kanji_hiragana/core/kanji_homophones.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';
import 'package:kanji_hiragana/core/kanji_words_dict.dart';
import 'package:kanji_hiragana/core/morpheme.dart';
import 'package:kanji_hiragana/core/query_store.dart';
import 'package:kanji_hiragana/core/settings.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/core/yojijukugo_dict.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/alignment_table.dart';
import 'package:kanji_hiragana/widgets/anki_export_sheet.dart';
import 'package:kanji_hiragana/widgets/filter_drawer.dart';
import 'package:kanji_hiragana/widgets/filter_result_page.dart';
import 'package:kanji_hiragana/widgets/furigana_view.dart';
import 'package:kanji_hiragana/widgets/radical_picker_sheet.dart';
import 'package:kanji_hiragana/widgets/settings_drawer.dart';
import 'package:kanji_hiragana/widgets/single_kanji_view.dart';
import 'package:kanji_hiragana/widgets/sliding_drawer.dart';
import 'package:kanji_hiragana/widgets/vertical_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final themes = {'dark': AppTheme.dark(), 'light': AppTheme.light()};

  for (final entry in themes.entries) {
    final name = entry.key;
    final theme = entry.value;

    Widget host(Widget child) => AppStringsScope(
          strings: const ZhStrings(),
          child: MaterialApp(
            theme: theme,
            home: Scaffold(body: child),
          ),
        );

    /// [SingleKanjiView] 是不滚动的 Column, 需要可滚动宿主
    /// (真机上由结果区提供; 测试里缺失会直接溢出判失败)。
    Widget scrollHost(Widget child) => AppStringsScope(
          strings: const ZhStrings(),
          child: MaterialApp(
            theme: theme,
            home: Scaffold(
              body: SingleChildScrollView(child: child),
            ),
          ),
        );

    group('FilterDrawerContent 区间校验 ($name)', () {
      testWidgets('笔画下限大于上限时显示倒置提示', (tester) async {
        await tester.pumpWidget(host(
          FilterDrawerContent(initial: KanjiFilter.initial, onSubmit: (_) {}),
        ));

        // 输入框: 笔画 min/max + 频率 min/max + 读音反查 + 含义搜索。
        final fields = find.byType(TextField);
        expect(fields, findsNWidgets(6));
        expect(find.text('下限大于上限, 将没有结果'), findsNothing);

        await tester.enterText(fields.at(0), '10');
        await tester.enterText(fields.at(1), '5');
        await tester.pump();

        expect(find.text('下限大于上限, 将没有结果'), findsOneWidget);
      });

      testWidgets('点「查看结果」回传当前条件 (含读音反查与含义搜索)', (tester) async {
        KanjiFilter? submitted;
        await tester.pumpWidget(host(FilterDrawerContent(
          initial: KanjiFilter.initial,
          onSubmit: (f) => submitted = f,
        )));

        final fields = find.byType(TextField);
        await tester.enterText(fields.at(0), '3');
        await tester.enterText(fields.at(1), '5');
        await tester.enterText(fields.at(4), 'こう');
        await tester.enterText(fields.at(5), 'sun');
        await tester.ensureVisible(find.text('水'));
        await tester.tap(find.text('水'));
        await tester.pump();

        await tester.tap(find.text('查看结果'));
        await tester.pump();

        expect(submitted, isNotNull);
        expect(submitted!.strokesMin, 3);
        expect(submitted!.strokesMax, 5);
        expect(submitted!.readingQuery, 'こう');
        expect(submitted!.meaningQuery, 'sun');
        expect(submitted!.radical, 85);
      });
    });

    group('SlidingDrawer 开关遮罩 ($name)', () {
      // 面板自身也包 IgnorePointer, 用「child 是 AnimatedOpacity」
      // 唯一锁定遮罩那一个。
      final scrimPointer = find.byWidgetPredicate(
        (w) => w is IgnorePointer && w.child is AnimatedOpacity,
      );

      Future<void> pump(WidgetTester tester, bool open) async {
        await tester.pumpWidget(host(
          SlidingDrawer(
            side: DrawerSide.left,
            open: open,
            panel: const Text('面板内容'),
            child: const Text('主内容'),
          ),
        ));
        await tester.pumpAndSettle();
      }

      testWidgets('展开时面板可见且遮罩可命中', (tester) async {
        await pump(tester, true);

        expect(find.text('面板内容'), findsOneWidget);
        expect(find.text('主内容'), findsOneWidget);
        expect(
          tester.widget<IgnorePointer>(scrimPointer).ignoring,
          isFalse,
        );
      });

      testWidgets('收起时面板不构建且遮罩不拦截手势', (tester) async {
        await pump(tester, false);

        expect(find.text('面板内容'), findsNothing);
        expect(find.text('主内容'), findsOneWidget);
        expect(
          tester.widget<IgnorePointer>(scrimPointer).ignoring,
          isTrue,
        );
      });

      testWidgets('关闭动画期间面板内容仍构建, 结束后才卸载', (tester) async {
        await pump(tester, true);

        // 切换为关闭态后动画进行中: 内容必须还在树里,
        // 否则滑出的只是空框 (关闭动画形同虚设)。
        await tester.pumpWidget(host(
          const SlidingDrawer(
            side: DrawerSide.left,
            open: false,
            panel: Text('面板内容'),
            child: Text('主内容'),
          ),
        ));
        await tester.pump(const Duration(milliseconds: 100));
        expect(find.text('面板内容'), findsOneWidget);
        expect(find.text('主内容'), findsOneWidget);

        await tester.pumpAndSettle();
        expect(find.text('面板内容'), findsNothing);
      });
    });

    group('SingleKanjiView 分组渲染 ($name)', () {
      // 「生」是字典里读音最多的字, 训读组超过 maxPerGroup, 能覆盖折叠路径。
      // 期望条数一律运行时从字典计算, 字典重生成后测试无需改动。
      final reading = kanjiReadingDict['生']!;

      testWidgets('音读与训读分组各自渲染', (tester) async {
        await tester
            .pumpWidget(scrollHost(SingleKanjiView(reading: reading)));

        expect(find.text('音読'), findsOneWidget);
        expect(find.text('訓読'), findsOneWidget);
        // 音读未超折叠线, 全部可见 (前提: 该字音读数不超过 maxPerGroup)。
        expect(reading.onyomi.length,
            lessThanOrEqualTo(SingleKanjiView.maxPerGroup));
        expect(find.text(reading.onyomi.first), findsOneWidget);
        expect(find.text(reading.onyomi.last), findsOneWidget);
      });

      testWidgets('训读超过折叠线时折叠为「等 N 项」, 点击展开', (tester) async {
        await tester
            .pumpWidget(scrollHost(SingleKanjiView(reading: reading)));

        // 折叠态: 训读只显示前 maxPerGroup 条, 尾块提示剩余数量。
        final kunReadings = reading.kunyomi;
        final hiddenLabel =
            '等 ${kunReadings.length - SingleKanjiView.maxPerGroup} 项';
        expect(kunReadings.length, greaterThan(SingleKanjiView.maxPerGroup));
        expect(find.text(hiddenLabel), findsOneWidget);
        expect(find.text(kunReadings.last), findsNothing);

        // 点击尾块展开全部。
        await tester.tap(find.text(hiddenLabel));
        await tester.pump();

        expect(find.text(hiddenLabel), findsNothing);
        expect(find.text('收起'), findsOneWidget);
        expect(find.text(kunReadings.last), findsOneWidget);
      });

      testWidgets('常见词分组渲染词面', (tester) async {
        await tester
            .pumpWidget(scrollHost(SingleKanjiView(reading: reading)));

        // 词面来自构建期生成的字典数据, 取真实首词断言。
        expect(kanjiWordsDict['生'], isNotNull);
        expect(find.text(kanjiWordsDict['生']!.first.word), findsOneWidget);
      });

      testWidgets('同音汉字推荐分组与部首展示', (tester) async {
        await tester
            .pumpWidget(scrollHost(SingleKanjiView(reading: reading)));

        expect(find.text('同音汉字'), findsOneWidget);
        expect(find.text('部首 '), findsOneWidget);
      });

      testWidgets('四字熟语分组渲染', (tester) async {
        final readingHi = kanjiReadingDict['日']!;
        await tester
            .pumpWidget(scrollHost(SingleKanjiView(reading: readingHi)));

        expect(find.text('四字熟語'), findsOneWidget);
        expect(find.text('日進月歩'), findsOneWidget);
      });
    });

    group('错误与空态路径 ($name)', () {
      testWidgets('设置加载失败提示在抽屉打开后才发生也能实时出现',
          (tester) async {
        // 正常加载后打开抽屉: 无提示。
        SharedPreferences.setMockInitialValues({});
        await SettingsController.instance.load();
        await tester.pumpWidget(
          host(SettingsDrawerContent(onOpenAbout: () {})),
        );
        expect(find.textContaining('设置加载失败'), findsNothing);

        // 抽屉打开后才异步发生一次失败的加载: 提示必须实时出现 ——
        // loadError 的展示监听 settings, 而不是只在 build 时读一次。
        SharedPreferences.setMockInitialValues({
          'settings.show_romaji': 'corrupted',
        });
        await SettingsController.instance.load();
        await tester.pump();

        expect(find.textContaining('设置加载失败'), findsOneWidget);
      });

      testWidgets('筛选无结果时显示空态提示', (tester) async {
        // 笔画下限超出字典上限, 必然空结果 (前提由模型层先验证)。
        const filter = KanjiFilter(strokesMin: 99);
        expect(filter.apply(kanjiReadingDict.values), isEmpty);

        await tester.pumpWidget(host(const FilterResultPage(filter: filter)));

        expect(find.text('没有符合条件的汉字'), findsOneWidget);
        expect(find.text('试试放宽笔画或频率范围'), findsOneWidget);
      });
    });

    group('可访问性语义 ($name)', () {
      testWidgets('展开的抽屉在语义树中暴露遮罩关闭按钮', (tester) async {
        final semantics = tester.ensureSemantics();
        await tester.pumpWidget(host(
          const SlidingDrawer(
            side: DrawerSide.left,
            open: true,
            panel: Text('面板内容'),
            child: Text('主内容'),
          ),
        ));
        await tester.pumpAndSettle();

        // 「点击空白处关闭」对读屏不可感知, 遮罩须以「关闭」按钮
        // 的身份可发现、可激活。
        final closeNode = tester.getSemantics(find.bySemanticsLabel('关闭'));
        expect(closeNode.flagsCollection.isButton, isTrue);

        semantics.dispose();
      });

      testWidgets('筛选胶囊以按钮语义播报选中状态', (tester) async {
        final semantics = tester.ensureSemantics();
        await tester.pumpWidget(host(
          FilterDrawerContent(initial: KanjiFilter.initial, onSubmit: (_) {}),
        ));

        // 「学年」胶囊 (避开与分区标题同名的「笔画数」/「使用频率」):
        // 默认排序是使用频率, 此刻未选中。
        final chip = tester.getSemantics(find.text('学年'));
        expect(chip.flagsCollection.isButton, isTrue);
        expect(chip.flagsCollection.isSelected, Tristate.isFalse);

        await tester.tap(find.text('学年'));
        await tester.pump();

        // 点选后语义树的选中状态实时翻转。
        final selectedChip = tester.getSemantics(find.text('学年'));
        expect(selectedChip.flagsCollection.isSelected, Tristate.isTrue);

        semantics.dispose();
      });

      testWidgets('折叠尾块播报按钮角色与展开状态', (tester) async {
        final semantics = tester.ensureSemantics();
        final reading = kanjiReadingDict['生']!;
        final kunReadings = reading.kunyomi;
        final hiddenLabel =
            '等 ${kunReadings.length - SingleKanjiView.maxPerGroup} 项';
        await tester.pumpWidget(scrollHost(SingleKanjiView(reading: reading)));

        final footer = tester.getSemantics(find.text(hiddenLabel));
        expect(footer.flagsCollection.isButton, isTrue);
        // isExpanded 为 null 表示无展开状态, false 表示折叠中。
        expect(footer.flagsCollection.isExpanded, isNot(Tristate.none));
        expect(footer.flagsCollection.isExpanded, Tristate.isFalse);

        await tester.tap(find.text(hiddenLabel));
        await tester.pump();

        final expandedFooter = tester.getSemantics(find.text('收起'));
        expect(expandedFooter.flagsCollection.isExpanded, Tristate.isTrue);

        semantics.dispose();
      });
    });

    group('AlignmentTable 对照表 ($name)', () {
      testWidgets('渲染词素各列与摘要信息', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '日本語',
          'reading': 'ニホンゴ',
          'pos': '名詞',
        });
        final m2 = Morpheme.fromToken({
          'surface_form': 'を',
          'reading': 'ヲ',
          'pos': '助詞',
        });
        final m3 = Morpheme.fromToken({
          'surface_form': '勉強',
          'reading': 'ベンキョウ',
          'pos': '名詞',
        });
        final m4 = Morpheme.fromToken({
          'surface_form': 'する',
          'reading': 'スル',
          'pos': '動詞',
        });
        final res = AnalysisResult(
          source: '日本語を勉強する',
          morphemes: [m1, m2, m3, m4],
          paragraphs: [
            [m1, m2, m3, m4],
          ],
        );
        await tester.pumpWidget(scrollHost(AlignmentTable(
          result: res,
          showRomaji: true,
        )));

        expect(find.text('日本語'), findsOneWidget);
        expect(find.text('にほんご'), findsOneWidget);
        expect(find.text('nihongo'), findsOneWidget);
        expect(find.text('を'), findsNWidgets(2));
        expect(find.text('勉強'), findsOneWidget);
        expect(find.text('する'), findsNWidgets(2));
      });

      testWidgets('多段落分界线渲染与隐藏罗马音', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '猫',
          'reading': 'ネコ',
          'pos': '名詞',
        });
        final m2 = Morpheme.fromToken({
          'surface_form': '犬',
          'reading': 'イヌ',
          'pos': '名詞',
        });
        final res = AnalysisResult(
          source: '猫\n犬',
          morphemes: [m1, m2],
          paragraphs: [
            [m1],
            [m2],
          ],
        );
        await tester.pumpWidget(scrollHost(AlignmentTable(
          result: res,
          showRomaji: false,
        )));

        expect(find.text('猫'), findsOneWidget);
        expect(find.text('犬'), findsOneWidget);
        expect(find.byType(Divider), findsOneWidget);
        expect(find.text('neko'), findsNothing);
      });
    });

    group('FuriganaView 振假名 ($name)', () {
      testWidgets('教材式注音排版渲染', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '日本語',
          'reading': 'ニホンゴ',
          'pos': '名詞',
        });
        final m2 = Morpheme.fromToken({
          'surface_form': 'の',
          'reading': 'ノ',
          'pos': '助詞',
        });
        final res = AnalysisResult(
          source: '日本の',
          morphemes: [m1, m2],
          paragraphs: [
            [m1, m2],
          ],
        );
        await tester.pumpWidget(scrollHost(FuriganaView(
          result: res,
          showRomaji: true,
        )));

        expect(find.text('日本語'), findsOneWidget);
        expect(find.text('にほんご'), findsOneWidget);
        expect(find.text('nihongo'), findsOneWidget);
        expect(find.text('の'), findsOneWidget);
      });

      testWidgets('隐藏罗马音与纯假名不显示 ruby 上标', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': 'わたし',
          'reading': 'ワタシ',
          'pos': '名詞',
        });
        final res = AnalysisResult(
          source: 'わたし',
          morphemes: [m1],
          paragraphs: [
            [m1],
          ],
        );
        await tester.pumpWidget(scrollHost(FuriganaView(
          result: res,
          showRomaji: false,
        )));

        expect(find.text('わたし'), findsOneWidget);
        expect(find.text('watashi'), findsNothing);
      });
    });

    group('VerticalView 竖排视图 ($name)', () {
      testWidgets('和风纵书渲染汉字与假名', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '日本',
          'reading': 'ニッポン',
          'pos': '名詞',
        });
        final m2 = Morpheme.fromToken({
          'surface_form': 'の',
          'reading': 'ノ',
          'pos': '助詞',
        });
        final res = AnalysisResult(
          source: '日本の',
          morphemes: [m1, m2],
          paragraphs: [
            [m1, m2],
          ],
        );
        await tester.pumpWidget(scrollHost(VerticalView(
          result: res,
          showRomaji: true,
        )));

        expect(find.text('日'), findsOneWidget);
        expect(find.text('本'), findsOneWidget);
        expect(find.text('の'), findsOneWidget);
        expect(find.text('に'), findsOneWidget);
      });

      testWidgets('长段落超阈值自动向左折列排版', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '吾輩は猫である',
          'reading': 'ワガハイハネコデアル',
          'pos': '名詞',
        });
        final m2 = Morpheme.fromToken({
          'surface_form': '名前はまだ無い',
          'reading': 'ナマエハマダナイ',
          'pos': '名詞',
        });
        final m3 = Morpheme.fromToken({
          'surface_form': 'どこで生れたかとんと見当がつかぬ',
          'reading': 'ドコデウマレタカトントケントウガツカヌ',
          'pos': '名詞',
        });
        final res = AnalysisResult(
          source: '吾輩は猫である名前はまだ無いどこで生れたかとんと見当がつかぬ',
          morphemes: [m1, m2, m3],
          paragraphs: [
            [m1, m2, m3],
          ],
        );
        await tester.pumpWidget(scrollHost(VerticalView(
          result: res,
          showRomaji: true,
        )));

        expect(find.text('吾'), findsOneWidget);
        expect(find.text('猫'), findsOneWidget);
        expect(find.text('見'), findsOneWidget);
      });

      testWidgets('避头尾禁则排版: 句读与标点正常悬挂渲染', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '一二三四五六七八九十一二三四',
          'reading': 'イチニサンシゴロクシチハチキュウジュウイチニサンシ',
          'pos': '名詞',
        });
        final mPunct = Morpheme.fromToken({
          'surface_form': '。',
          'reading': '。',
          'pos': '記号',
        });
        final res = AnalysisResult(
          source: '一二三四五六七八九十一二三四。',
          morphemes: [m1, mPunct],
          paragraphs: [
            [m1, mPunct],
          ],
        );
        await tester.pumpWidget(scrollHost(VerticalView(
          result: res,
          showRomaji: true,
        )));

        expect(find.text('。'), findsOneWidget);
      });
    });

    group('RadicalPickerSheet 部首检字表 ($name)', () {
      testWidgets('展示部首并响应选择', (tester) async {
        int? picked;
        await tester.pumpWidget(host(RadicalPickerSheet(
          selectedRadical: null,
          onSelect: (r) => picked = r,
        )));

        expect(find.text('康熙 214 部首检字'), findsOneWidget);
        expect(find.text('一'), findsWidgets);
        await tester.tap(find.text('一').first);
        await tester.pump();

        expect(picked, 1);
      });
    });

    group('AnkiExportSheet 导出弹窗 ($name)', () {
      testWidgets('渲染收藏列表与导出入口', (tester) async {
        await tester.pumpWidget(host(const AnkiExportSheet(
          favorites: ['日', '東京'],
        )));

        expect(find.textContaining('收藏词条导出 (2)'), findsOneWidget);
        expect(find.text('Anki 牌组格式 (TSV 制表符分隔)'), findsOneWidget);
        expect(find.textContaining('纯文本列表'), findsOneWidget);
      });
    });

    group('无障碍超大文字缩放渲染 ($name)', () {
      Widget largeFontHost(Widget child, {bool scrollable = false}) {
        final content =
            scrollable ? SingleChildScrollView(child: child) : child;
        return AppStringsScope(
          strings: const ZhStrings(),
          child: MaterialApp(
            theme: theme,
            home: MediaQuery(
              data: const MediaQueryData(
                size: Size(360, 640),
                textScaler: TextScaler.linear(1.8),
              ),
              child: Scaffold(body: content),
            ),
          ),
        );
      }

      testWidgets('单汉字详解与同音字在大字号下安全换行', (tester) async {
        final kanji = kanjiReadingDict['日']!;
        await tester.pumpWidget(largeFontHost(
          SingleKanjiView(reading: kanji),
          scrollable: true,
        ));
        expect(tester.takeException(), isNull);
        expect(find.text('日'), findsWidgets);
      });

      testWidgets('对照表与总结在大字号下安全换行', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '吾輩',
          'reading': 'ワガハイ',
          'pos': '名詞',
        });
        final res = AnalysisResult(
          source: '吾輩',
          morphemes: [m1],
          paragraphs: [
            [m1],
          ],
        );
        await tester.pumpWidget(largeFontHost(
          AlignmentTable(result: res),
          scrollable: true,
        ));
        expect(tester.takeException(), isNull);
        expect(find.text('吾輩'), findsOneWidget);
      });

      testWidgets('筛选抽屉表单在大字号下正常构建', (tester) async {
        await tester.pumpWidget(largeFontHost(
          FilterDrawerContent(
            initial: KanjiFilter.initial,
            onSubmit: (_) {},
          ),
        ));
        expect(tester.takeException(), isNull);
        expect(find.text('重置'), findsOneWidget);
      });

      testWidgets('振假名视图在大字号下安全排版无溢出', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '日本語',
          'reading': 'ニホンゴ',
          'pos': '名詞',
        });
        final m2 = Morpheme.fromToken({
          'surface_form': 'の',
          'reading': 'ノ',
          'pos': '助詞',
        });
        final res = AnalysisResult(
          source: '日本の',
          morphemes: [m1, m2],
          paragraphs: [
            [m1, m2],
          ],
        );
        await tester.pumpWidget(largeFontHost(
          FuriganaView(
            result: res,
            showRomaji: true,
          ),
          scrollable: true,
        ));
        expect(tester.takeException(), isNull);
        expect(find.text('日本語'), findsOneWidget);
        expect(find.text('にほんご'), findsOneWidget);
      });

      testWidgets('竖排视图在大字号下安全排版无溢出', (tester) async {
        final m1 = Morpheme.fromToken({
          'surface_form': '吾輩',
          'reading': 'ワガハイ',
          'pos': '名詞',
        });
        final res = AnalysisResult(
          source: '吾輩',
          morphemes: [m1],
          paragraphs: [
            [m1],
          ],
        );
        await tester.pumpWidget(largeFontHost(
          VerticalView(result: res, showRomaji: false),
          scrollable: true,
        ));
        expect(tester.takeException(), isNull);
        expect(find.text('吾'), findsOneWidget);
        expect(find.text('輩'), findsOneWidget);
      });
    });

    group('SingleKanji 子组件独立渲染 ($name)', () {
      testWidgets('NoReadingNotice 独立渲染未收录提示卡片', (tester) async {
        await tester.pumpWidget(scrollHost(const NoReadingNotice()));
        expect(find.byType(NoReadingNotice), findsOneWidget);
        expect(find.byIcon(Icons.info_outline_rounded), findsOneWidget);
        expect(find.text(const ZhStrings().readingsNotFound), findsOneWidget);
      });

      testWidgets('KanjiHeroCard 渲染汉字、释义与元信息', (tester) async {
        final r = kanjiReadingDict['日']!;
        await tester.pumpWidget(scrollHost(KanjiHeroCard(reading: r)));
        expect(find.text('日'), findsNWidgets(2)); // 大字形与释义各包含一次
        expect(find.text('太阳'), findsOneWidget);
        expect(find.text('4'), findsOneWidget);
      });

      testWidgets('ReadingGroup 渲染读音并支持折叠展开', (tester) async {
        await tester.pumpWidget(scrollHost(
          const ReadingGroup(
            label: '音读',
            sublabel: 'Onyomi',
            badge: '4 项',
            color: AppTheme.accent,
            readings: ['にち', 'じつ', 'ひ', 'か'],
            maxItems: 2,
          ),
        ));
        expect(find.text('音读'), findsOneWidget);
        expect(find.text('にち'), findsOneWidget);
        expect(find.text('等 2 项'), findsOneWidget);

        await tester.tap(find.text('等 2 项'));
        await tester.pump();
        expect(find.text('收起'), findsOneWidget);
      });

      testWidgets('CommonWordsGroup 渲染词列表与词性标签', (tester) async {
        final words = kanjiWordsDict['日']!;
        String? tapped;
        await tester.pumpWidget(scrollHost(
          CommonWordsGroup(
            words: words,
            onWordTap: (w) => tapped = w,
          ),
        ));
        expect(find.text('常见词汇'), findsOneWidget);
        expect(find.text('日本'), findsOneWidget);

        await tester.tap(find.text('日本'));
        await tester.pump();
        expect(tapped, '日本');
      });

      testWidgets('HomophonesGroup 渲染同音字候选', (tester) async {
        final r = kanjiReadingDict['日']!;
        final homophones = KanjiHomophones.findHomophones(r);
        await tester.pumpWidget(scrollHost(
          HomophonesGroup(
            homophones: homophones,
            onWordTap: (_) {},
          ),
        ));
        expect(find.text('同音汉字'), findsOneWidget);
        expect(homophones, isNotEmpty);
      });

      testWidgets('YojijukugoGroup 渲染成语推荐', (tester) async {
        final yojijukugo = getYojijukugoForKanji('日');
        await tester.pumpWidget(scrollHost(
          YojijukugoGroup(
            entries: yojijukugo,
            onWordTap: (_) {},
          ),
        ));
        expect(find.text('四字熟語'), findsOneWidget);
        expect(yojijukugo, isNotEmpty);
        expect(find.text('日進月歩'), findsOneWidget);
      });

      testWidgets('FilterResultPage 点击网格进入详情页、切换收藏并点击常见词回调', (tester) async {
        SharedPreferences.setMockInitialValues({});
        await QueryStore.instance.load();
        QueryStore.instance.clearHistory();
        for (final f in QueryStore.instance.favorites.toList()) {
          QueryStore.instance.toggleFavorite(f);
        }

        String? poppedWord;
        await tester.pumpWidget(AppStringsScope(
          strings: const ZhStrings(),
          child: MaterialApp(
            theme: theme,
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () async {
                    poppedWord = await Navigator.of(context).push<String>(
                      MaterialPageRoute(
                        builder: (_) => const FilterResultPage(
                          filter: KanjiFilter(strokesMin: 4, strokesMax: 4),
                        ),
                      ),
                    );
                  },
                  child: const Text('OpenFilter'),
                ),
              ),
            ),
          ),
        ));

        await tester.tap(find.text('OpenFilter'));
        await tester.pumpAndSettle();

        final cell = find.byKey(const ValueKey('kanji_cell:日'));
        expect(cell, findsOneWidget);

        await tester.tap(cell);
        await tester.pumpAndSettle();

        expect(find.text('常见词汇'), findsOneWidget);
        expect(find.byIcon(Icons.star_border_rounded), findsOneWidget);

        await tester.tap(find.byIcon(Icons.star_border_rounded));
        await tester.pump();
        expect(find.byIcon(Icons.star_rounded), findsOneWidget);
        expect(QueryStore.instance.isFavorite('日'), isTrue);

        // 等待 SnackBar 自动收起，避免遮挡底部词汇
        await tester.pump(const Duration(milliseconds: 1000));
        await tester.pumpAndSettle();

        await tester.ensureVisible(find.text('日本'));
        await tester.tap(find.text('日本'));
        await tester.pumpAndSettle();

        expect(poppedWord, '日本');
      });

      testWidgets('AnkiExportSheet 导出纯文本列表与 Anki TSV', (tester) async {
        String? copiedText;
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, (call) async {
          if (call.method == 'Clipboard.setData') {
            final args = call.arguments as Map<dynamic, dynamic>;
            copiedText = args['text'] as String?;
          }
          return null;
        });

        addTearDown(() {
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(SystemChannels.platform, null);
        });

        await tester.pumpWidget(AppStringsScope(
          strings: const ZhStrings(),
          child: MaterialApp(
            theme: theme,
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    AnkiExportSheet.show(context, favorites: const ['日', '月', '练']);
                  },
                  child: const Text('OpenSheet'),
                ),
              ),
            ),
          ),
        ));

        await tester.tap(find.text('OpenSheet'));
        await tester.pumpAndSettle();

        expect(find.text('收藏词条导出 (3)'), findsOneWidget);
        expect(find.text('复制 纯文本列表'), findsOneWidget);

        await tester.tap(find.text('复制 纯文本列表'));
        await tester.pumpAndSettle();
        expect(copiedText, '日\n月\n练');

        await tester.tap(find.text('OpenSheet'));
        await tester.pumpAndSettle();

        expect(find.text('Anki 牌组格式 (TSV 制表符分隔)'), findsOneWidget);
        await tester.tap(find.text('Anki 牌组格式 (TSV 制表符分隔)'));
        await tester.pumpAndSettle();

        expect(copiedText, contains('#separator:tab'));
        expect(copiedText, contains('日'));
        expect(copiedText, contains('練'));
      });
    });
  }
}
