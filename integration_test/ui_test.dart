import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/home_page.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/about_page.dart';
import 'package:kanji_hiragana/widgets/alignment_table.dart';
import 'package:kanji_hiragana/widgets/filter_drawer.dart';
import 'package:kanji_hiragana/widgets/filter_result_page.dart';
import 'package:kanji_hiragana/widgets/furigana_view.dart';
import 'package:kanji_hiragana/widgets/settings_drawer.dart';
import 'package:kanji_hiragana/widgets/single_kanji_view.dart';
import 'package:kanji_hiragana/widgets/vector_icon.dart';

/// 在设备 / 模拟器上驱动的界面测试。
///
/// 覆盖需求:
/// 1. 空输入时: 仅输入框(居中), 不显示工具栏与结果。
/// 2. 输入后: 工具栏与结果区出现。
/// 3. 单个汉字: 展示音读 / 训读, 且**不显示**对照表与注音组件。
/// 4. 右下角设置抽屉 / 左下角筛选抽屉, 以及关于页与全屏筛选页。
/// 5. 两个悬浮按钮仅在主界面(空态)出现, 输入后消失。
void main() {
  /// 悬停式搭建主界面 (等待词典就绪, 避免停在 loading)。
  Future<void> pumpHome(WidgetTester tester) async {
    await JapaneseAnalyzer.instance.warmUp();
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.dark(), home: const HomePage()),
    );
    await tester.pumpAndSettle();
  }

  /// 悬浮按钮是否可见 (透明度为 1 视作可见)。
  bool buttonsVisible(WidgetTester tester) {
    final widgets = tester.widgetList<AnimatedOpacity>(
      find.ancestor(
        of: find.byType(VectorIcon),
        matching: find.byType(AnimatedOpacity),
      ),
    );
    return widgets.any((w) => w.opacity == 1);
  }

  testWidgets('空态只显示输入框, 不显示工具栏', (tester) async {
    await pumpHome(tester);

    // 输入框存在且 hint 为空态文案。
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('输入日语汉字'), findsOneWidget);

    // 空态不应出现视图切换与罗马音开关。
    expect(find.text('对照表'), findsNothing);
    expect(find.text('注音'), findsNothing);
    expect(find.text('罗马音'), findsNothing);

    // 空态下两个悬浮按钮可见。
    expect(buttonsVisible(tester), isTrue);
  });

  testWidgets('输入后两个悬浮按钮消失, 清空后恢复', (tester) async {
    await pumpHome(tester);

    // 空态: 按钮可见。
    expect(buttonsVisible(tester), isTrue);

    // 输入多字后按钮消失。
    await tester.enterText(find.byType(TextField), '日本の文化');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(buttonsVisible(tester), isFalse);

    // 输入单个汉字同样不显示按钮。
    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(buttonsVisible(tester), isFalse);

    // 清空后回到空态, 按钮恢复。
    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();
    expect(buttonsVisible(tester), isTrue);
  });

  testWidgets('输入多字后出现工具栏与结果', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日本の文化');
    // 等待防抖 + 解析 + 动画。
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // 工具栏出现。
    expect(find.text('对照表'), findsOneWidget);
    expect(find.text('注音'), findsOneWidget);
    // 结果出现: 逐词对照含平假名。
    expect(find.text('にっぽん'), findsWidgets);
    expect(find.text('nippon'), findsWidgets);
  });

  testWidgets('输入单个汉字展示音读与训读', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // 音读 / 训读分组标题。
    expect(find.text('音読'), findsOneWidget);
    expect(find.text('訓読'), findsOneWidget);
    // 音读内容。
    expect(find.text('にち'), findsWidgets);
    expect(find.text('じつ'), findsWidgets);

    // 单汉字不显示对照表与注音组件。
    expect(find.byType(AlignmentTable), findsNothing);
    expect(find.byType(FuriganaView), findsNothing);
    // 视图切换与罗马音开关随之隐藏。
    expect(find.text('对照表'), findsNothing);
    expect(find.text('注音'), findsNothing);
    expect(find.text('罗马音'), findsNothing);
  });

  testWidgets('多字仍显示对照表, 切回单汉字后隐藏', (tester) async {
    await pumpHome(tester);

    // 多字: 出现对照表。
    await tester.enterText(find.byType(TextField), '日本の文化');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.byType(AlignmentTable), findsOneWidget);

    // 删到只剩一个汉字: 对照表消失, 改为音训读详解。
    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.byType(AlignmentTable), findsNothing);
    expect(find.byType(SingleKanjiView), findsOneWidget);
  });

  testWidgets('清空后回到空态', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日本');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.text('对照表'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    // 回到空态: 工具栏消失。
    expect(find.text('对照表'), findsNothing);
  });

  testWidgets('右下角按钮展开设置抽屉, 点遮罩可收起', (tester) async {
    await pumpHome(tester);

    // 展开设置抽屉。
    await tester.tap(find.byTooltip('设置'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsDrawerContent), findsOneWidget);
    expect(find.text('主题'), findsOneWidget);
    expect(find.text('旋转屏幕'), findsOneWidget);
    expect(find.text('关于'), findsOneWidget);

    // 三种主题模式都在。
    expect(find.text('浅色'), findsOneWidget);
    expect(find.text('深色'), findsOneWidget);
    expect(find.text('跟随系统'), findsOneWidget);

    // 点关闭按钮收起。
    await tester.tap(find.byTooltip('关闭'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsDrawerContent), findsNothing);

    // 再次展开, 改点遮罩 (面板之外的左下角区域) 收起。
    await tester.tap(find.byTooltip('设置'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsDrawerContent), findsOneWidget);

    final size = tester.view.physicalSize / tester.view.devicePixelRatio;
    // 设置抽屉自右侧滑出并占屏幕 2/3, 故左侧 1/6 宽度处必为遮罩。
    await tester.tapAt(Offset(size.width * 0.06, size.height / 2));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsDrawerContent), findsNothing);
  });

  testWidgets('左下角按钮展开筛选抽屉并进入全屏筛选页', (tester) async {
    await pumpHome(tester);

    // 展开筛选抽屉。
    await tester.tap(find.byTooltip('筛选汉字'));
    await tester.pumpAndSettle();
    expect(find.byType(FilterDrawerContent), findsOneWidget);
    expect(find.text('排序'), findsOneWidget);
    // 「笔画数」「使用频率」既是分组标题也是不限选项, 因此会有多处。
    expect(find.text('笔画数'), findsWidgets);
    expect(find.text('使用频率'), findsWidgets);
    expect(find.text('查看结果'), findsOneWidget);

    // 选一个笔画数, 再进入全屏筛选结果页。
    await tester.tap(find.text('3').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('查看结果'));
    await tester.pumpAndSettle();

    expect(find.byType(FilterResultPage), findsOneWidget);
    expect(find.text('筛选结果'), findsOneWidget);
  });

  testWidgets('关于页展示版本与仓库', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('设置'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('关于'));
    await tester.pumpAndSettle();

    expect(find.byType(AboutPage), findsOneWidget);
    expect(find.text('1.0.1'), findsWidgets);
    expect(
      find.text('https://github.com/Aclguh/kanji-hiragana'),
      findsOneWidget,
    );
    expect(find.text('许可'), findsOneWidget);
    expect(find.text('致谢'), findsOneWidget);
  });
}

