import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/home_page.dart';
import 'package:kanji_hiragana/core/japanese_analyzer.dart';
import 'package:kanji_hiragana/core/query_store.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/about_page.dart';
import 'package:kanji_hiragana/widgets/alignment_table.dart';
import 'package:kanji_hiragana/widgets/filter_drawer.dart';
import 'package:kanji_hiragana/widgets/filter_result_page.dart';
import 'package:kanji_hiragana/widgets/furigana_view.dart';
import 'package:kanji_hiragana/widgets/settings_drawer.dart';
import 'package:kanji_hiragana/widgets/single_kanji_view.dart';
import 'package:kanji_hiragana/widgets/vector_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 在设备 / 模拟器上驱动的界面测试。
///
/// 覆盖需求:
/// 1. 空输入时: 仅输入框(居中), 不显示工具栏与结果。
/// 2. 输入后: 工具栏与结果区出现。
/// 3. 单个汉字: 展示音读 / 训读, 且**不显示**对照表与注音组件。
/// 4. 右下角设置抽屉 / 左下角筛选抽屉, 以及关于页与全屏筛选页。
/// 5. 两个悬浮按钮仅在主界面(空态)出现, 输入后消失。
/// 6. 查询历史与收藏词条、收藏星标、单字详解的常见词汇区。
void main() {
  /// 用 mock preferences 复位查询历史与收藏。
  ///
  /// QueryStore 是单例, 状态会跨用例残留, 每个用例前都要复位。
  Future<void> resetQueryStore() async {
    SharedPreferences.setMockInitialValues({});
    await QueryStore.instance.load();
    QueryStore.instance.clearHistory();
    for (final f in QueryStore.instance.favorites.toList()) {
      QueryStore.instance.toggleFavorite(f);
    }
  }

  /// 悬停式搭建主界面 (等待词典就绪, 避免停在 loading)。
  ///
  /// 同时复位查询历史 / 收藏, 保证用例互不影响。
  Future<void> pumpHome(WidgetTester tester) async {
    await JapaneseAnalyzer.instance.warmUp();
    await resetQueryStore();
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

  /// 模拟一次系统返回键。
  ///
  /// 通过平台通道派发 `popRoute`, 与真机返回键走同一条 PopScope 逻辑。
  Future<void> simulateBack(WidgetTester tester) async {
    await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
      'flutter/navigation',
      const JSONMethodCodec().encodeMethodCall(
        const MethodCall('popRoute'),
      ),
      (_) {},
    );
    await tester.pumpAndSettle();
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

  testWidgets('系统返回键先清空输入, 再返回时才退出', (tester) async {
    await pumpHome(tester);

    // 输入内容后按下返回键: 应清空文本而非退出。
    await tester.enterText(find.byType(TextField), '日本の文化');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.text('对照表'), findsOneWidget);

    await simulateBack(tester);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller?.text,
      isEmpty,
    );
    // 回到空态。
    expect(find.text('对照表'), findsNothing);

    // 已无输入时再按返回: 交由系统处理 (此处 PopScope 应允许 pop)。
    // 用谓词定位应用自己的 PopScope: 新版 Flutter 框架内部也持有
    // PopScope, 按 byType 会匹配到多个。
    final scope = tester.widget<PopScope<Object?>>(
      find.byWidgetPredicate(
        (w) => w is PopScope<Object?> && w.child is Scaffold,
      ),
    );
    expect(scope.canPop, isTrue);
  });

  testWidgets('抽屉展开时返回键先收起抽屉', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('设置'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsDrawerContent), findsOneWidget);

    await simulateBack(tester);
    expect(find.byType(SettingsDrawerContent), findsNothing);
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

  testWidgets('对照表全文平假名与罗马音可复制', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日本');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.byType(AlignmentTable), findsOneWidget);
    expect(find.text('全文平假名'), findsOneWidget);
    expect(find.text('全文罗马音'), findsOneWidget);

    // 对照表底部摘要有两个复制按钮
    final copyButtons = find.descendant(
      of: find.byType(AlignmentTable),
      matching: find.byIcon(Icons.copy_rounded),
    );
    expect(copyButtons, findsNWidgets(2));

    await tester.tap(copyButtons.first);
    await tester.pumpAndSettle();
    expect(find.text('已复制全文平假名'), findsOneWidget);
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

  testWidgets('查询后清空, 空态出现历史词条且点按可回查', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日本の文化');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    // 空态出现「最近查询」区与刚查过的词条。
    expect(find.text('最近查询'), findsOneWidget);
    expect(find.text('日本の文化'), findsOneWidget);

    // 点按词条 → 回填并重新展开结果。
    await tester.tap(find.text('日本の文化'));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.byType(AlignmentTable), findsOneWidget);
    expect(find.text('对照表'), findsOneWidget);
  });

  testWidgets('长按历史词条移除并弹出提示', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日本の文化');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    expect(find.text('日本の文化'), findsOneWidget);

    // 长按词条移除。
    await tester.longPress(find.text('日本の文化'));
    await tester.pumpAndSettle();

    expect(find.text('已移除历史「日本の文化」'), findsOneWidget);
    expect(find.text('日本の文化'), findsNothing);
  });

  testWidgets('点按清空历史移除全部词条并弹出提示', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日本の文化');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    expect(find.text('最近查询'), findsOneWidget);
    await tester.tap(find.text('清空'));
    await tester.pumpAndSettle();

    expect(find.text('已清空历史'), findsOneWidget);
    expect(find.text('最近查询'), findsNothing);
  });

  testWidgets('连续输入折叠为一条历史', (tester) async {
    await pumpHome(tester);

    // 打字过程中的中间态不应各自留痕。
    await tester.enterText(find.byType(TextField), '私');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '私は学生');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    expect(find.text('私は学生'), findsOneWidget);
    expect(find.text('私'), findsNothing);
  });

  testWidgets('星标收藏查询, 空态出现收藏词条', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // 点 AppBar 星标收藏: 空心 → 实心。
    await tester.tap(find.byIcon(Icons.star_border_rounded));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.star_rounded), findsWidgets);

    // 清空后空态出现「收藏」区。
    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();
    expect(find.text('收藏'), findsOneWidget);
    // 「日」同时出现在收藏区与历史区 (收藏不把条目从历史中移走)。
    expect(find.text('日'), findsNWidgets(2));

    // 点收藏词条恢复查询 → 单字详解。
    await tester.tap(find.text('日').first);
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.byType(SingleKanjiView), findsOneWidget);
  });

  testWidgets('长按收藏词条取消收藏并弹出提示', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // 收藏
    await tester.tap(find.byIcon(Icons.star_border_rounded));
    await tester.pumpAndSettle();

    // 清空输入回到空态
    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    expect(find.text('收藏'), findsOneWidget);
    // 「日」在收藏和历史各一个，收藏区排在前面
    await tester.longPress(find.text('日').first);
    await tester.pumpAndSettle();

    expect(find.text('已取消收藏「日」'), findsOneWidget);
    expect(find.text('收藏'), findsNothing);
  });

  testWidgets('单字详解出现常见词汇区', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text('常见词汇'), findsOneWidget);
    // 词面 + 平假名读音各出现一次。
    expect(find.text('日本'), findsOneWidget);
    expect(find.text('にっぽん'), findsOneWidget);
  });

  testWidgets('点按常见词跳转查询展开对照表', (tester) async {
    await pumpHome(tester);

    await tester.enterText(find.byType(TextField), '日');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.byType(SingleKanjiView), findsOneWidget);

    // 点按常见搭配词「日本」
    await tester.tap(find.text('日本'));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // 自动以「日本」展开对照表分析结果
    expect(find.byType(SingleKanjiView), findsNothing);
    expect(find.byType(AlignmentTable), findsOneWidget);
    expect(find.widgetWithText(TextField, '日本'), findsOneWidget);
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

  /// 抽屉内「下限 / 上限」四个输入框 (笔画 min/max, 频率 min/max)。
  Finder rangeFields() => find.descendant(
        of: find.byType(FilterDrawerContent),
        matching: find.byType(TextField),
      );

  testWidgets('筛选抽屉: 分组顺序与范围输入框', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('筛选汉字'));
    await tester.pumpAndSettle();
    expect(find.byType(FilterDrawerContent), findsOneWidget);

    // 抽屉内的文本查找统一限定在 FilterDrawerContent 内:
    // 另一个抽屉面板同样挂载在树上, 会出现同名分组标题 (如「其他」)。
    Finder drawerText(String label) => find.descendant(
          of: find.byType(FilterDrawerContent),
          matching: find.text(label),
        );

    // 分组标题各出现一次; 「使用频率」与「笔画数」因排序 chip 同名
    // (排序 chips 全量渲染, 默认选中「使用频率」) 各出现两次。
    for (final label in ['排序', '读音构成', '其他']) {
      expect(drawerText(label), findsOneWidget, reason: '缺少分组: $label');
    }
    expect(drawerText('使用频率'), findsNWidgets(2));
    expect(drawerText('笔画数'), findsNWidgets(2));

    // 「其他」应排在「读音构成」之后。
    final readingDy = tester.getTopLeft(drawerText('读音构成')).dy;
    final otherDy = tester.getTopLeft(drawerText('其他')).dy;
    expect(otherDy > readingDy, isTrue,
        reason: '「其他」应排在「读音构成」之后');

    // 笔画与频率各是「下限 ~ 上限」两个输入框, 共 4 个。
    expect(rangeFields(), findsNWidgets(4));

    // 「人名」对应 grade 9 与 10 两档, 应合并为一个选项而非重复出现。
    expect(drawerText('人名'), findsOneWidget);

    // 留空即不限, 不应出现倒置提示。
    expect(find.text('下限大于上限, 将没有结果'), findsNothing);
  });

  testWidgets('筛选抽屉: 输入笔画与频率范围后进入结果页', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('筛选汉字'));
    await tester.pumpAndSettle();

    // 笔画 3 ~ 5
    await tester.enterText(rangeFields().at(0), '3');
    await tester.enterText(rangeFields().at(1), '5');
    await tester.pumpAndSettle();

    // 频率 1 ~ 100 (第二个范围, 可能在折叠线以下, 先滚动到可见)
    await tester.ensureVisible(rangeFields().at(2));
    await tester.pumpAndSettle();
    await tester.enterText(rangeFields().at(2), '1');
    await tester.enterText(rangeFields().at(3), '100');
    await tester.pumpAndSettle();

    await tester.tap(find.text('查看结果'));
    await tester.pumpAndSettle();

    expect(find.byType(FilterResultPage), findsOneWidget);
    expect(find.text('筛选结果'), findsOneWidget);
    // 笔画 3~5 且频率 1~100 共 30 字, 结果非空。
    expect(find.text('30 字'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('筛选抽屉: 下限大于上限给出提示', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('筛选汉字'));
    await tester.pumpAndSettle();

    await tester.enterText(rangeFields().at(0), '9');
    await tester.enterText(rangeFields().at(1), '3');
    await tester.pumpAndSettle();

    expect(find.text('下限大于上限, 将没有结果'), findsOneWidget);

    // 删掉下限即恢复, 验证「清空输入框能解除限制」。
    await tester.enterText(rangeFields().at(0), '');
    await tester.pumpAndSettle();
    expect(find.text('下限大于上限, 将没有结果'), findsNothing);
  });

  testWidgets('筛选抽屉: 重置清空范围输入', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('筛选汉字'));
    await tester.pumpAndSettle();

    await tester.enterText(rangeFields().at(0), '3');
    await tester.enterText(rangeFields().at(1), '5');
    await tester.pumpAndSettle();

    await tester.tap(find.text('重置'));
    await tester.pumpAndSettle();

    for (var i = 0; i < 4; i++) {
      final field = tester.widget<TextField>(rangeFields().at(i));
      expect(field.controller?.text, isEmpty, reason: '第 $i 个输入框未清空');
    }
  });

  testWidgets('筛选抽屉全链路: 笔画筛选 → 结果页 → 点入首字详情 → 收藏 → 返回首页空态验证', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('筛选汉字'));
    await tester.pumpAndSettle();

    // 笔画 1 ~ 5
    await tester.enterText(rangeFields().at(0), '1');
    await tester.enterText(rangeFields().at(1), '5');
    await tester.pumpAndSettle();

    // 查看结果
    await tester.tap(find.text('查看结果'));
    await tester.pumpAndSettle();

    expect(find.byType(FilterResultPage), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);

    // 找到首个汉字格并记录字符
    final cellFinder = find.descendant(
      of: find.byType(GridView),
      matching: find.byWidgetPredicate(
        (w) => w.runtimeType.toString() == '_KanjiCell',
      ),
    );
    expect(cellFinder, findsWidgets);

    final kanjiTextFinder = find.descendant(
      of: cellFinder.first,
      matching: find.byType(Text),
    );
    final kanji = tester.widget<Text>(kanjiTextFinder.first).data!;

    // 点入首字进入详情页
    await tester.tap(cellFinder.first);
    await tester.pumpAndSettle();

    // 详情页验证
    expect(find.byType(SingleKanjiView), findsOneWidget);
    final detailStarButton = find.descendant(
      of: find.byType(AppBar),
      matching: find.byIcon(Icons.star_border_rounded),
    );
    expect(detailStarButton, findsOneWidget);

    // 点按收藏
    await tester.tap(detailStarButton);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.star_rounded), findsOneWidget);

    // 返回结果页
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(FilterResultPage), findsOneWidget);

    // 返回主页
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(FilterResultPage), findsNothing);

    // 首页空态出现「收藏」区并包含刚刚收藏的汉字
    expect(find.text('收藏'), findsOneWidget);
    expect(find.text(kanji), findsOneWidget);
  });

  testWidgets('设置抽屉: 旋转屏幕默认关闭', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('设置'));
    await tester.pumpAndSettle();

    final sw = tester.widget<Switch>(
      find.descendant(of: find.byType(SettingsDrawerContent), matching: find.byType(Switch)),
    );
    expect(sw.value, isFalse, reason: '旋转屏幕应默认关闭');
  });

  testWidgets('设置抽屉: 语言分组位于「其他」上方, 点击后展开选项', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('设置'));
    await tester.pumpAndSettle();

    // 设置抽屉里的文本查找限定在面板内: 「语言」的分组标签与选择器标题
    // 各出现一次, 「其他」也同时存在于筛选抽屉面板中。
    final settingsScope = find.byType(SettingsDrawerContent);
    Finder settingsText(String label) => find.descendant(
          of: settingsScope,
          matching: find.text(label),
        );

    // 语言分组排在「其他」之前。
    final langDy = tester.getTopLeft(settingsText('语言').first).dy;
    final otherDy = tester.getTopLeft(settingsText('其他')).dy;
    expect(langDy < otherDy, isTrue, reason: '语言应在其他之上');

    // 收起态只显示当前语言, 不显示另一个选项。
    expect(find.text('中文'), findsOneWidget);
    expect(find.text('English'), findsNothing);

    // 点击后展开两个选项: 当前语言「中文」同时出现在标题与选中项, 共两处。
    await tester.tap(settingsText('语言').at(1));
    await tester.pumpAndSettle();
    expect(find.text('中文'), findsNWidgets(2));
    expect(find.text('English'), findsOneWidget);
  });

  testWidgets('英文界面: 文案切换为英文, 漢字仮名 四字保持不变', (tester) async {
    await JapaneseAnalyzer.instance.warmUp();
    await resetQueryStore();
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark(),
        home: const AppStringsScope(
          strings: EnStrings(),
          child: HomePage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // 品牌标识在任何语言下都保持繁体原样。
    expect(find.text('漢字仮名'), findsOneWidget);

    // 其余文案均为英文。
    expect(find.text('Type Japanese kanji to see hiragana and romaji'),
        findsOneWidget);
    expect(find.text('Enter Japanese kanji'), findsOneWidget);
    expect(find.byTooltip('Filter kanji'), findsOneWidget);
    expect(find.byTooltip('Settings'), findsOneWidget);

    // 输入后工具栏与结果也是英文。句子取 東京に行きます:
    // 恰好覆盖 名詞/動詞/助動詞 三种词性各一次。
    await tester.enterText(find.byType(TextField), '東京に行きます');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.text('Table'), findsOneWidget);
    expect(find.text('Furigana'), findsOneWidget);
    // 「Romaji」既是开关标签, 也是对照表列头, 故会有多处。
    expect(find.text('Romaji'), findsWidgets);
    expect(find.text('对照表'), findsNothing);
    expect(find.text('罗马音'), findsNothing);

    // 词性标签来自 IPADIC 的日文分类, 英文界面下也要翻译 (包含细分分类)。
    expect(find.text('noun · proper'), findsOneWidget);
    expect(find.text('verb · main'), findsOneWidget);
    expect(find.text('aux.'), findsOneWidget);
    expect(find.textContaining('名詞'), findsNothing);
    expect(find.textContaining('動詞'), findsNothing);
  });

  testWidgets('英文界面: 单汉字释义取用英文原文', (tester) async {
    await JapaneseAnalyzer.instance.warmUp();
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark(),
        home: const AppStringsScope(
          strings: EnStrings(),
          child: HomePage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '生');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // 「生」的英文释义取自 KANJIDIC2 原文。
    expect(find.text('life'), findsOneWidget);
    // 学年只显示数字, 不能渲染成 "Grade Grade 1"。
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Grade Grade 1'), findsNothing);
    // 音训读分组标题保留日文原字。
    expect(find.text('音読'), findsOneWidget);
    expect(find.text('訓読'), findsOneWidget);
    expect(find.text("On'yomi · 音読み"), findsOneWidget);
    expect(find.text('Sino-Japanese'), findsOneWidget);
    expect(find.text('Native Japanese'), findsOneWidget);
  });

  testWidgets('英文界面: 设置与筛选抽屉全部为英文', (tester) async {
    await JapaneseAnalyzer.instance.warmUp();
    await resetQueryStore();
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark(),
        home: const AppStringsScope(
          strings: EnStrings(),
          child: HomePage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // 设置抽屉
    await tester.tap(find.byTooltip('Settings'));
    await tester.pumpAndSettle();
    expect(find.text('Appearance & behavior'), findsOneWidget);
    expect(find.text('Light'), findsOneWidget);
    expect(find.text('Dark'), findsOneWidget);
    expect(find.text('System'), findsOneWidget);
    expect(find.text('Screen'), findsOneWidget);
    expect(find.text('Auto-rotate'), findsOneWidget);
    // 「Language」的分组标签与选择器标题各一次。
    expect(find.text('Language'), findsNWidgets(2));
    expect(find.text('About'), findsOneWidget);
    // 中文残留
    expect(find.text('主题'), findsNothing);
    expect(find.text('语言'), findsNothing);

    await tester.tap(find.byTooltip('Close'));
    await tester.pumpAndSettle();

    // 筛选抽屉。断言限定在面板内: 「Other」同时存在于设置抽屉的分组里。
    await tester.tap(find.byTooltip('Filter kanji'));
    await tester.pumpAndSettle();
    final filterScope = find.byType(FilterDrawerContent);
    expect(
        find.descendant(of: filterScope, matching: find.text('Sort')),
        findsOneWidget);
    expect(
        find.descendant(of: filterScope, matching: find.text('Stroke count')),
        findsOneWidget);
    expect(
        find.descendant(of: filterScope, matching: find.text('Frequency')),
        findsWidgets);
    expect(
        find.descendant(of: filterScope, matching: find.text('Readings')),
        // 「Readings」同时是 sectionReadings 标题与「读音数量」排序 chip。
        findsNWidgets(2));
    expect(
        find.descendant(of: filterScope, matching: find.text('Other')),
        findsOneWidget);
    expect(
        find.descendant(of: filterScope, matching: find.text('Reset')),
        findsOneWidget);
    expect(
        find.descendant(of: filterScope, matching: find.text('View results')),
        findsOneWidget);
    expect(find.text('Any'), findsWidgets);
    expect(find.text('排序'), findsNothing);
    expect(find.text('查看结果'), findsNothing);
  });

  testWidgets('关于页展示版本与仓库', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byTooltip('设置'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('关于'));
    await tester.pumpAndSettle();

    expect(find.byType(AboutPage), findsOneWidget);
    expect(find.text('1.0.3'), findsWidgets);
    expect(
      find.text('https://github.com/Aclguh/kanji-hiragana'),
      findsOneWidget,
    );
    expect(find.text('许可'), findsOneWidget);
    expect(find.text('致谢'), findsOneWidget);
  });
}

