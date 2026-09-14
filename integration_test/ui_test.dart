import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/home_page.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/theme.dart';

/// 在设备 / 模拟器上驱动的界面测试。
///
/// 覆盖需求:
/// 1. 空输入时: 仅输入框(居中), 不显示工具栏与结果。
/// 2. 输入后: 工具栏与结果区出现。
/// 3. 单个汉字: 展示音读 / 训读。
void main() {
  testWidgets('空态只显示输入框, 不显示工具栏', (tester) async {
    // 等待词典就绪, 否则界面停在 loading。
    await JapaneseAnalyzer.instance.warmUp();

    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.dark(), home: const HomePage()),
    );
    await tester.pumpAndSettle();

    // 输入框存在且 hint 为空态文案。
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('输入日语汉字'), findsOneWidget);

    // 空态不应出现视图切换与罗马音开关。
    expect(find.text('对照表'), findsNothing);
    expect(find.text('注音'), findsNothing);
    expect(find.text('罗马音'), findsNothing);
  });

  testWidgets('输入多字后出现工具栏与结果', (tester) async {
    await JapaneseAnalyzer.instance.warmUp();

    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.dark(), home: const HomePage()),
    );
    await tester.pumpAndSettle();

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
    await JapaneseAnalyzer.instance.warmUp();

    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.dark(), home: const HomePage()),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // 音读 / 训读分组标题。
    expect(find.text('音読'), findsOneWidget);
    expect(find.text('訓読'), findsOneWidget);
    // 音读内容。
    expect(find.text('にち'), findsWidgets);
    expect(find.text('じつ'), findsWidgets);
  });

  testWidgets('清空后回到空态', (tester) async {
    await JapaneseAnalyzer.instance.warmUp();

    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.dark(), home: const HomePage()),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '日本');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.text('对照表'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    // 回到空态: 工具栏消失。
    expect(find.text('对照表'), findsNothing);
  });
}
