// HomePage 宿主机 Widget 测试 (IMP-06)。
//
// 验证主页核心交互链路 (输入防抖、展开态、视图切换、单字模式、
// 收藏与清空), 无需真机即可在 CI 与本地快速回归。

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/query_store.dart';
import 'package:kanji_hiragana/core/settings.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/home_page.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/alignment_table.dart';
import 'package:kanji_hiragana/widgets/furigana_view.dart';
import 'package:kanji_hiragana/widgets/single_kanji_view.dart';
import 'package:kanji_hiragana/widgets/vertical_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    // 词典与常驻 isolate 在真实异步线程完成构建与握手
    await JapaneseAnalyzer.instance.warmUp();
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await SettingsController.instance.load();
    await SettingsController.instance.setAutoRotate(false);
    await SettingsController.instance.setLanguage(AppLanguage.zh);
    await SettingsController.instance.setShowRomaji(true);
    await SettingsController.instance.setViewModeName('alignment');

    await QueryStore.instance.load();
    QueryStore.instance.clearHistory();
    for (final f in QueryStore.instance.favorites.toList()) {
      QueryStore.instance.toggleFavorite(f);
    }
  });

  Future<void> pumpHome(WidgetTester tester) async {
    await tester.pumpWidget(
      AppStringsScope(
        strings: const ZhStrings(),
        child: MaterialApp(
          theme: AppTheme.dark(),
          home: const HomePage(),
        ),
      ),
    );
    // 给 HomePage._init() 留出就绪时间
    await tester.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 60));
    });
    await tester.pumpAndSettle();
  }

  Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      // 推进 FakeAsync 驱动防抖 Timer
      await tester.pump(const Duration(milliseconds: 100));
      // 释放事件循环让跨 isolate 通信回执进入主 isolate
      await tester.runAsync(() async {
        await Future<void>.delayed(const Duration(milliseconds: 40));
      });
      await tester.pump();
      if (finder.evaluate().isNotEmpty) return;
    }
    fail('等待超时: $finder');
  }

  group('HomePage 基础交互链路', () {
    testWidgets('空态渲染居中输入框与预设提示词', (tester) async {
      await pumpHome(tester);

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('输入日语汉字'), findsOneWidget);
      expect(find.text('对照表'), findsNothing);
      expect(find.text('注音'), findsNothing);
      expect(find.text('纵书'), findsNothing);
    });

    testWidgets('输入句子后停留在主界面，点击右箭头按钮才展开对照表', (tester) async {
      await pumpHome(tester);

      final input = find.byType(TextField);
      await tester.enterText(input, '日本語を勉強する');
      await tester.pump();

      // 输入后停留在主界面，尚未展开结果区
      expect(find.byType(AlignmentTable), findsNothing);
      final searchButton = find.byTooltip('查询');
      expect(searchButton, findsOneWidget);

      // 点击右箭头按钮触发查询并进入查询界面
      await tester.tap(searchButton);
      await tester.pump();

      await pumpUntilFound(tester, find.byType(AlignmentTable));

      expect(find.byType(AlignmentTable), findsOneWidget);
      expect(find.text('对照表'), findsOneWidget);
      expect(find.text('注音'), findsOneWidget);
      expect(find.text('纵书'), findsOneWidget);
      expect(find.text('日本語'), findsOneWidget);
    });

    testWidgets('输入简体汉字自动转化为日文新字体并查询 (练习->練習, 练->練)', (tester) async {
      await pumpHome(tester);

      final input = find.byType(TextField);
      // 输入简体多字词
      await tester.enterText(input, '练习');
      await tester.pump();

      final searchButton = find.byTooltip('查询');
      await tester.tap(searchButton);
      await tester.pump();

      await pumpUntilFound(tester, find.byType(AlignmentTable));

      // 文本框规范化为「練習」
      final field = tester.widget<TextField>(find.byType(TextField));
      expect(field.controller?.text, '練習');
      expect(
        find.descendant(
          of: find.byType(AlignmentTable),
          matching: find.text('練習'),
        ),
        findsOneWidget,
      );

      // 单汉字测试: 输入简体「练」
      await tester.enterText(input, '练');
      await tester.pump();
      await tester.tap(searchButton);
      await tester.pump();

      await pumpUntilFound(tester, find.byType(SingleKanjiView));
      expect(field.controller?.text, '練');
      expect(find.text('音読'), findsOneWidget);
      expect(find.text('訓読'), findsOneWidget);
    });

    testWidgets('查询界面内修改文本不立即刷新，点击右箭头按钮后才刷新', (tester) async {
      await pumpHome(tester);

      final input = find.byType(TextField);
      await tester.enterText(input, '日本語');
      await tester.pump();
      await tester.tap(find.byTooltip('查询'));
      await tester.pump();

      await pumpUntilFound(tester, find.byType(AlignmentTable));
      expect(
        find.descendant(
          of: find.byType(AlignmentTable),
          matching: find.text('日本語'),
        ),
        findsOneWidget,
      );

      // 在查询界面中修改输入内容为「文化」
      await tester.enterText(input, '文化');
      await tester.pump();

      // 验证尚未刷新，原有内容仍可见，文化尚未在对照表出现
      expect(
        find.descendant(
          of: find.byType(AlignmentTable),
          matching: find.text('日本語'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(AlignmentTable),
          matching: find.text('文化'),
        ),
        findsNothing,
      );

      // 点击右箭头按钮后刷新
      await tester.tap(find.byTooltip('查询'));
      await tester.pump();

      await pumpUntilFound(
        tester,
        find.descendant(
          of: find.byType(AlignmentTable),
          matching: find.text('文化'),
        ),
      );
      expect(
        find.descendant(
          of: find.byType(AlignmentTable),
          matching: find.text('文化'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('视图模式切换: 对照表 -> 注音 -> 纵书', (tester) async {
      await pumpHome(tester);

      await tester.enterText(find.byType(TextField), '日本の文化');
      await tester.pump();
      await tester.tap(find.byTooltip('查询'));
      await tester.pump();
      await pumpUntilFound(tester, find.byType(AlignmentTable));

      // 切换到注音视图
      await tester.tap(find.text('注音'));
      await tester.pumpAndSettle();
      expect(find.byType(FuriganaView), findsOneWidget);
      expect(find.byType(AlignmentTable), findsNothing);

      // 切换到纵书视图
      await tester.tap(find.text('纵书'));
      await tester.pumpAndSettle();
      expect(find.byType(VerticalView), findsOneWidget);
      expect(find.byType(FuriganaView), findsNothing);

      // 切回对照表视图
      await tester.tap(find.text('对照表'));
      await tester.pumpAndSettle();
      expect(find.byType(AlignmentTable), findsOneWidget);
    });

    testWidgets('单汉字输入触发 SingleKanjiView 详解', (tester) async {
      await pumpHome(tester);

      await tester.enterText(find.byType(TextField), '日');
      await tester.pump();
      await tester.tap(find.byTooltip('查询'));
      await tester.pump();
      await pumpUntilFound(tester, find.byType(SingleKanjiView));

      expect(find.byType(SingleKanjiView), findsOneWidget);
      expect(find.byType(AlignmentTable), findsNothing);
      expect(find.byType(FuriganaView), findsNothing);
      expect(find.text('音読'), findsOneWidget);
      expect(find.text('訓読'), findsOneWidget);
    });

    testWidgets('清空按钮重置回空态', (tester) async {
      await pumpHome(tester);

      await tester.enterText(find.byType(TextField), 'こんにちは');
      await tester.pump();
      await tester.tap(find.byTooltip('查询'));
      await tester.pump();
      await pumpUntilFound(tester, find.byType(AlignmentTable));

      // 点击清空图标
      final clearButton = find.byTooltip('清空');
      expect(clearButton, findsOneWidget);
      await tester.tap(clearButton);
      await tester.pumpAndSettle();

      expect(find.byType(AlignmentTable), findsNothing);
      expect(find.text('对照表'), findsNothing);
    });

    testWidgets('enterText 为空时回到空态', (tester) async {
      await pumpHome(tester);
      await tester.enterText(find.byType(TextField), '日本');
      await tester.pump();
      await tester.tap(find.byTooltip('查询'));
      await tester.pump();
      await pumpUntilFound(tester, find.byType(AlignmentTable));
      expect(find.text('对照表'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '');
      await tester.pumpAndSettle();
      expect(find.text('对照表'), findsNothing);
    });

    testWidgets('收藏星标切换', (tester) async {
      await pumpHome(tester);

      await tester.enterText(find.byType(TextField), '桜');
      await tester.pump();
      await tester.tap(find.byTooltip('查询'));
      await tester.pump();
      await pumpUntilFound(tester, find.byType(SingleKanjiView));

      final favoriteBtn = find.byTooltip('收藏');
      expect(favoriteBtn, findsOneWidget);

      expect(QueryStore.instance.isFavorite('桜'), isFalse);
      await tester.tap(favoriteBtn);
      await tester.pump();
      expect(QueryStore.instance.isFavorite('桜'), isTrue);

      await tester.tap(favoriteBtn);
      await tester.pump();
      expect(QueryStore.instance.isFavorite('桜'), isFalse);
    });
  });
}
