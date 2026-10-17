import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/morpheme.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/home/export_sheet.dart';

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

  const sampleResult = AnalysisResult(
    source: '桜の花',
    morphemes: [
      Morpheme(
        surface: '桜',
        partOfSpeech: '名詞',
        partOfSpeechDetail: '一般',
        readingKatakana: 'サクラ',
        pronunciationKatakana: 'サクラ',
        hiragana: 'さくら',
        pronunciationHiragana: 'さくら',
        romaji: 'sakura',
        containsKanji: true,
      ),
      Morpheme(
        surface: 'の',
        partOfSpeech: '助词',
        partOfSpeechDetail: '連体化',
        readingKatakana: 'ノ',
        pronunciationKatakana: 'ノ',
        hiragana: 'の',
        pronunciationHiragana: 'の',
        romaji: 'no',
        containsKanji: false,
      ),
      Morpheme(
        surface: '花',
        partOfSpeech: '名詞',
        partOfSpeechDetail: '一般',
        readingKatakana: 'ハナ',
        pronunciationKatakana: 'ハナ',
        hiragana: 'はな',
        pronunciationHiragana: 'はな',
        romaji: 'hana',
        containsKanji: true,
      ),
    ],
  );

  Widget createHost({
    required Widget child,
    AppStrings strings = const ZhStrings(),
  }) {
    return AppStringsScope(
      strings: strings,
      child: MaterialApp(
        theme: AppTheme.dark(),
        home: Scaffold(body: child),
      ),
    );
  }

  testWidgets('showAnalysisExportSheet 导出 HTML Ruby', (tester) async {
    const s = ZhStrings();
    await tester.pumpWidget(createHost(
      child: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () => showAnalysisExportSheet(context, sampleResult),
          child: const Text('Open'),
        ),
      ),
      strings: s,
    ));

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text(s.exportRuby), findsOneWidget);
    expect(find.text(s.exportBrackets), findsOneWidget);
    expect(find.text(s.exportAnki), findsOneWidget);

    await tester.tap(find.text(s.exportRuby));
    await tester.pumpAndSettle();

    expect(clipboardContent, sampleResult.toHtmlRuby);
    expect(find.text(s.copiedRuby), findsOneWidget);
  });

  testWidgets('showAnalysisExportSheet 导出括号注音', (tester) async {
    const s = ZhStrings();
    await tester.pumpWidget(createHost(
      child: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () => showAnalysisExportSheet(context, sampleResult),
          child: const Text('Open'),
        ),
      ),
      strings: s,
    ));

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    await tester.tap(find.text(s.exportBrackets));
    await tester.pumpAndSettle();

    expect(clipboardContent, sampleResult.toBracketAnnotation);
    expect(find.text(s.copiedBrackets), findsOneWidget);
  });

  testWidgets('showAnalysisExportSheet 导出 Anki 牌组格式 (英文界面)', (tester) async {
    const s = EnStrings();
    await tester.pumpWidget(createHost(
      child: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () => showAnalysisExportSheet(context, sampleResult),
          child: const Text('Open'),
        ),
      ),
      strings: s,
    ));

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text(s.exportAnki), findsOneWidget);

    await tester.tap(find.text(s.exportAnki));
    await tester.pumpAndSettle();

    final expectedAnki = sampleResult.toAnkiTsvFormatted(
      sentenceTag: s.ankiTagSentence,
      onyomiPrefix: s.ankiOnyomiPrefix,
      kunyomiPrefix: s.ankiKunyomiPrefix,
      noteFormatter: s.ankiNote,
      baseFormPrefix: s.ankiBaseFormPrefix,
      englishMeaning: true,
    );
    expect(clipboardContent, expectedAnki);
    expect(find.text(s.copiedAnki), findsOneWidget);
  });
}
