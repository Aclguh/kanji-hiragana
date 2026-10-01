// 重组件的宿主机 widget 测试。
//
// integration_test 仍是最终门槛 (AGENTS.md), 这里让核心组件的行为
// 回归在 `flutter test` 时即被发现, 不必连接真机。
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/kanji_filter.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';
import 'package:kanji_hiragana/core/kanji_words_dict.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/filter_drawer.dart';
import 'package:kanji_hiragana/widgets/single_kanji_view.dart';
import 'package:kanji_hiragana/widgets/sliding_drawer.dart';

Widget _host(Widget child) => MaterialApp(
      theme: AppTheme.dark(),
      home: Scaffold(body: child),
    );

/// [SingleKanjiView] 是不滚动的 Column, 需要可滚动宿主
/// (真机上由结果区提供; 测试里缺失会直接溢出判失败)。
Widget _scrollHost(Widget child) => MaterialApp(
      theme: AppTheme.dark(),
      home: Scaffold(
        body: SingleChildScrollView(child: child),
      ),
    );

void main() {
  group('FilterDrawerContent 区间校验', () {
    testWidgets('笔画下限大于上限时显示倒置提示', (tester) async {
      await tester.pumpWidget(_host(
        FilterDrawerContent(initial: KanjiFilter.initial, onSubmit: (_) {}),
      ));

      // 四个输入框: 笔画 min/max + 频率 min/max。
      final fields = find.byType(TextField);
      expect(fields, findsNWidgets(4));
      expect(find.text('下限大于上限, 将没有结果'), findsNothing);

      await tester.enterText(fields.at(0), '10');
      await tester.enterText(fields.at(1), '5');
      await tester.pump();

      expect(find.text('下限大于上限, 将没有结果'), findsOneWidget);
    });

    testWidgets('点「查看结果」回传当前条件', (tester) async {
      KanjiFilter? submitted;
      await tester.pumpWidget(_host(FilterDrawerContent(
        initial: KanjiFilter.initial,
        onSubmit: (f) => submitted = f,
      )));

      final fields = find.byType(TextField);
      await tester.enterText(fields.at(0), '3');
      await tester.enterText(fields.at(1), '5');
      await tester.pump();

      await tester.tap(find.text('查看结果'));
      await tester.pump();

      expect(submitted, isNotNull);
      expect(submitted!.strokesMin, 3);
      expect(submitted!.strokesMax, 5);
    });
  });

  group('SlidingDrawer 开关遮罩', () {
    // 面板自身也包 IgnorePointer, 用「child 是 AnimatedOpacity」
    // 唯一锁定遮罩那一个。
    final scrimPointer = find.byWidgetPredicate(
      (w) => w is IgnorePointer && w.child is AnimatedOpacity,
    );

    Future<void> pump(WidgetTester tester, bool open) async {
      await tester.pumpWidget(_host(
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
  });

  group('SingleKanjiView 分组渲染', () {
    // 「生」: 音读 2 条 / 训读 18 条 / 常见词 8 个, 是字典里读音最多的字,
    // 训读组超过 maxPerGroup=8, 能覆盖折叠路径。
    final reading = kanjiReadingDict['生']!;

    testWidgets('音读与训读分组各自渲染', (tester) async {
      await tester.pumpWidget(_scrollHost(SingleKanjiView(reading: reading)));

      expect(find.text('音読'), findsOneWidget);
      expect(find.text('訓読'), findsOneWidget);
      // 音读 2 条未超折叠线, 全部可见。
      expect(find.text(reading.onyomi.first), findsOneWidget);
      expect(find.text(reading.onyomi.last), findsOneWidget);
    });

    testWidgets('训读超过 8 条时折叠为「等 N 项」, 点击展开', (tester) async {
      await tester.pumpWidget(_scrollHost(SingleKanjiView(reading: reading)));

      // 折叠态: 训读只显示前 8 条, 尾块提示剩余数量。
      final kunReadings = reading.kunyomi;
      expect(kunReadings.length, greaterThan(8));
      expect(find.text('等 10 项'), findsOneWidget);
      expect(find.text(kunReadings.last), findsNothing);

      // 点击尾块展开全部。
      await tester.tap(find.text('等 10 项'));
      await tester.pump();

      expect(find.text('等 10 项'), findsNothing);
      expect(find.text('收起'), findsOneWidget);
      expect(find.text(kunReadings.last), findsOneWidget);
    });

    testWidgets('常见词分组渲染词面', (tester) async {
      await tester.pumpWidget(_scrollHost(SingleKanjiView(reading: reading)));

      // 词面来自构建期生成的字典数据, 取真实首词断言。
      expect(kanjiWordsDict['生'], isNotNull);
      expect(find.text(kanjiWordsDict['生']!.first.word), findsOneWidget);
    });
  });
}
