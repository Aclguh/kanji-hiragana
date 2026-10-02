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
import 'package:kanji_hiragana/core/kanji_filter.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';
import 'package:kanji_hiragana/core/kanji_words_dict.dart';
import 'package:kanji_hiragana/core/settings.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/filter_drawer.dart';
import 'package:kanji_hiragana/widgets/filter_result_page.dart';
import 'package:kanji_hiragana/widgets/settings_drawer.dart';
import 'package:kanji_hiragana/widgets/single_kanji_view.dart';
import 'package:kanji_hiragana/widgets/sliding_drawer.dart';
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
  }
}
