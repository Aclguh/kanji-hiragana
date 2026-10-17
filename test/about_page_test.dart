import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/about_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  String? clipboardContent;

  setUp(() {
    clipboardContent = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (MethodCall methodCall) async {
      if (methodCall.method == 'Clipboard.setData') {
        final args = methodCall.arguments as Map<dynamic, dynamic>;
        clipboardContent = args['text'] as String?;
        return null;
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null);
  });

  Widget createHost({
    AppStrings strings = const ZhStrings(),
    ThemeData? theme,
  }) {
    return AppStringsScope(
      strings: strings,
      child: MaterialApp(
        theme: theme ?? AppTheme.dark(),
        home: const AboutPage(),
      ),
    );
  }

  testWidgets('AboutPage 渲染基本信息、版本号与致谢 (中文)', (tester) async {
    const s = ZhStrings();
    await tester.pumpWidget(createHost(strings: s));
    await tester.pumpAndSettle();

    expect(find.text(s.about), findsOneWidget);
    expect(find.text(AboutPage.version), findsWidgets);
    expect(find.text(AboutPage.buildNumber), findsOneWidget);
    expect(find.text('com.kanjihiragana.kanji_hiragana'), findsOneWidget);

    expect(find.text(s.repositoryLabel), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text(AboutPage.repoUrl), findsOneWidget);

    expect(find.text(s.licensesSection), findsOneWidget);
    expect(find.text('MIT License'), findsOneWidget);
    expect(find.text('KANJIDIC2'), findsOneWidget);
    expect(find.text('kuromoji · IPADIC'), findsOneWidget);

    expect(find.text(s.creditsSection), findsOneWidget);
  });

  testWidgets('AboutPage 点击 GitHub 复制仓库地址到剪贴板并弹出提示', (tester) async {
    const s = ZhStrings();
    await tester.pumpWidget(createHost(strings: s));
    await tester.pumpAndSettle();

    await tester.tap(find.text('GitHub'));
    await tester.pumpAndSettle();

    expect(clipboardContent, AboutPage.repoUrl);
    expect(find.text(s.repositoryCopied), findsOneWidget);
  });

  testWidgets('AboutPage 在浅色主题与英文语言下正确渲染', (tester) async {
    const s = EnStrings();
    await tester.pumpWidget(createHost(
      strings: s,
      theme: AppTheme.light(),
    ));
    await tester.pumpAndSettle();

    expect(find.text(s.about), findsOneWidget);
    expect(find.text(s.versionLabel), findsWidgets);
    expect(find.text(s.repositoryLabel), findsOneWidget);
    expect(find.text(s.licensesSection), findsOneWidget);
    expect(find.text(s.creditsSection), findsOneWidget);

    await tester.tap(find.text('GitHub'));
    await tester.pumpAndSettle();

    expect(clipboardContent, AboutPage.repoUrl);
    expect(find.text(s.repositoryCopied), findsOneWidget);
  });
}
