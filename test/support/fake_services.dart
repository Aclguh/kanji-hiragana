import 'dart:async';

import 'package:kanji_hiragana/core/analyzer_service.dart';
import 'package:kanji_hiragana/core/kanji_reading_dict.dart';
import 'package:kanji_hiragana/core/kanji_services.dart';
import 'package:kanji_hiragana/core/morpheme.dart';
import 'package:kanji_hiragana/core/platform_text_source.dart';
import 'package:kanji_hiragana/core/query_store.dart';
import 'package:kanji_hiragana/core/settings.dart';
import 'package:kanji_hiragana/core/speech_service.dart';

/// 测试用分析器: 不启动 kuromoji isolate, 返回固定的分词结果。
class FakeAnalyzer implements AnalyzerService {
  int warmUpCalls = 0;
  bool failBatch = false;

  @override
  Future<void> warmUp() async {
    warmUpCalls++;
  }

  @override
  Future<AnalysisResult> analyze(
    String text, {
    bool Function()? isCancelled,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (isCancelled?.call() ?? false) {
      return AnalysisResult(source: text, morphemes: const []);
    }
    await Future<void>.delayed(Duration.zero);
    return resultFor(text);
  }

  @override
  Future<List<AnalysisResult>> analyzeBatch(
    List<String> texts, {
    bool Function()? isCancelled,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (failBatch) {
      throw StateError('fake batch failure');
    }
    final output = <AnalysisResult>[];
    for (final text in texts) {
      output.add(await analyze(text, isCancelled: isCancelled));
    }
    return output;
  }

  static AnalysisResult resultFor(String text) {
    if (text.length == 1) {
      final reading = kanjiReadingDict[text];
      if (reading != null) {
        return AnalysisResult(
          source: text,
          morphemes: [
            _token(text, _katakanaFor(_firstReading(reading.onyomi, reading.kunyomi, text))),
          ],
          paragraphs: [
            [
              _token(text, _katakanaFor(_firstReading(reading.onyomi, reading.kunyomi, text))),
            ],
          ],
          singleKanji: reading,
        );
      }
    }

    final pairs = switch (text) {
      '日本語を勉強する' => [
          ('日本語', 'ニホンゴ'),
          ('を', 'ヲ'),
          ('勉強', 'ベンキョウ'),
          ('する', 'スル'),
        ],
      '日本の文化' => [
          ('日本', 'ニッポン'),
          ('の', 'ノ'),
          ('文化', 'ブンカ'),
        ],
      '日本語' => [('日本語', 'ニホンゴ')],
      '文化' => [('文化', 'ブンカ')],
      '練習' => [('練習', 'レンシュウ')],
      '日本' => [('日本', 'ニッポン')],
      'こんにちは' => [('こんにちは', 'コンニチハ')],
      _ => [
          for (final char in text.split(''))
            if (char.trim().isNotEmpty) (char, _katakanaFor(char)),
        ],
    };
    final morphemes = [for (final pair in pairs) _token(pair.$1, pair.$2)];
    return AnalysisResult(
      source: text,
      morphemes: morphemes,
      paragraphs: [morphemes],
    );
  }

  static String _firstReading(
    List<String> onyomi,
    List<String> kunyomi,
    String fallback,
  ) {
    if (onyomi.isNotEmpty) return onyomi.first;
    if (kunyomi.isNotEmpty) return kunyomi.first;
    return fallback;
  }

  static Morpheme _token(String surface, String reading) {
    return Morpheme.fromToken({
      'surface_form': surface,
      'reading': reading,
      'pronunciation': reading,
      'pos': '名詞',
      'pos_detail_1': '一般',
      'basic_form': surface,
    });
  }

  static String _katakanaFor(String hiragana) {
    final buffer = StringBuffer();
    for (final rune in hiragana.runes) {
      if (rune >= 0x3041 && rune <= 0x3096) {
        buffer.writeCharCode(rune + 0x60);
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }
}

class FakeSpeechService implements SpeechService {
  bool available = true;
  String? lastSpoken;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<bool> speak(String text) async {
    lastSpoken = text;
    return available;
  }

  @override
  Future<void> stop() async {}
}

class FakePlatformTextSource implements PlatformTextSource {
  final _controller = StreamController<String>.broadcast();
  String? initialText;

  @override
  Stream<String> get onProcessedText => _controller.stream;

  @override
  Future<String?> getInitialProcessedText() async => initialText;

  void emit(String text) => _controller.add(text);

  void dispose() => _controller.close();
}

/// 构造使用真实设置/历史单例、但分析器与平台通道为 fake 的服务集合。
KanjiServices buildFakeServices({
  FakeAnalyzer? analyzer,
  FakeSpeechService? speech,
  FakePlatformTextSource? platform,
}) {
  return KanjiServices(
    analyzer: analyzer ?? FakeAnalyzer(),
    queryStore: QueryStore.instance,
    settings: SettingsController.instance,
    tts: speech ?? FakeSpeechService(),
    platform: platform ?? FakePlatformTextSource(),
  );
}
