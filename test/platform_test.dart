// 平台通道服务 Mock 测试与英文文案遍历 (IMP-10)。
//
// 覆盖 TtsService、PlatformService 平台通道链路与 EnStrings 完整文案定义。

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/core/platform_service.dart';
import 'package:kanji_hiragana/core/strings.dart';
import 'package:kanji_hiragana/core/tts_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  const ttsChannel = MethodChannel('kanji_hiragana/tts');
  const platformChannel = MethodChannel('kanji_hiragana/platform');

  tearDown(() {
    messenger.setMockMethodCallHandler(ttsChannel, null);
    messenger.setMockMethodCallHandler(platformChannel, null);
  });

  group('TtsService 平台通道与竞态测试', () {
    test('isAvailable 状态检测', () async {
      messenger.setMockMethodCallHandler(ttsChannel, (call) async {
        if (call.method == 'isAvailable') return true;
        return null;
      });

      expect(await TtsService.instance.isAvailable(), isTrue);

      messenger.setMockMethodCallHandler(ttsChannel, (call) async {
        if (call.method == 'isAvailable') return false;
        return null;
      });

      expect(await TtsService.instance.isAvailable(), isFalse);

      messenger.setMockMethodCallHandler(ttsChannel, (call) async {
        throw PlatformException(code: 'UNAVAILABLE');
      });

      expect(await TtsService.instance.isAvailable(), isFalse);
    });

    test('speak 空文本直接返回 false', () async {
      final success = await TtsService.instance.speak('   ');
      expect(success, isFalse);
      expect(TtsService.instance.isSpeaking, isFalse);
    });

    test('speak 正常播放与成功返回', () async {
      MethodCall? lastCall;
      messenger.setMockMethodCallHandler(ttsChannel, (call) async {
        lastCall = call;
        if (call.method == 'speak') return true;
        return null;
      });

      final success = await TtsService.instance.speak('桜');
      expect(success, isTrue);
      expect(lastCall?.method, 'speak');
      expect(lastCall?.arguments['text'], '桜');
      expect(lastCall?.arguments['utteranceId'], isNotNull);
      expect(TtsService.instance.isSpeaking, isTrue);
      expect(TtsService.instance.speakingText, '桜');
    });

    test('speak 原生返回失败时状态自动复位', () async {
      messenger.setMockMethodCallHandler(ttsChannel, (call) async {
        if (call.method == 'speak') return false;
        return null;
      });

      final success = await TtsService.instance.speak('富士山');
      expect(success, isFalse);
      expect(TtsService.instance.isSpeaking, isFalse);
      expect(TtsService.instance.speakingText, '');
    });

    test('原生回调 onSpeakDone 校验 utteranceId 避免竞态', () async {
      messenger.setMockMethodCallHandler(ttsChannel, (call) async => true);

      await TtsService.instance.speak('猫');
      final activeId = TtsService.instance.currentUtteranceId;
      expect(activeId, isNotNull);
      expect(TtsService.instance.isSpeaking, isTrue);

      // 模拟旧词语的回调到达 (过期 utteranceId)
      final staleMessage = const StandardMethodCodec().encodeMethodCall(
        const MethodCall('onSpeakDone', 'tts_old_stale_id'),
      );
      await messenger.handlePlatformMessage(
        'kanji_hiragana/tts',
        staleMessage,
        (_) {},
      );

      // 当前状态不应被旧回调熄灭
      expect(TtsService.instance.isSpeaking, isTrue);
      expect(TtsService.instance.speakingText, '猫');

      // 模拟当前活跃 ID 完成回调到达
      final doneMessage = const StandardMethodCodec().encodeMethodCall(
        MethodCall('onSpeakDone', activeId),
      );
      await messenger.handlePlatformMessage(
        'kanji_hiragana/tts',
        doneMessage,
        (_) {},
      );

      // 状态正常熄灭
      expect(TtsService.instance.isSpeaking, isFalse);
      expect(TtsService.instance.speakingText, '');
      expect(TtsService.instance.currentUtteranceId, isNull);
    });

    test('stop 停止发音并通知原生通道', () async {
      bool stopCalled = false;
      messenger.setMockMethodCallHandler(ttsChannel, (call) async {
        if (call.method == 'stop') stopCalled = true;
        return null;
      });

      await TtsService.instance.stop();
      expect(stopCalled, isTrue);
      expect(TtsService.instance.isSpeaking, isFalse);
    });
  });

  group('PlatformService 划词通信测试', () {
    test('getInitialProcessedText 获取初始划词', () async {
      messenger.setMockMethodCallHandler(platformChannel, (call) async {
        if (call.method == 'getInitialProcessedText') return '  東京  ';
        return null;
      });

      final initial =
          await PlatformService.instance.getInitialProcessedText();
      expect(initial, '東京');
    });

    test('onProcessText 运行时划词推送流', () async {
      final textFuture = PlatformService.instance.onProcessedText.first;

      final message = const StandardMethodCodec().encodeMethodCall(
        const MethodCall('onProcessText', '京都'),
      );
      await messenger.handlePlatformMessage(
        'kanji_hiragana/platform',
        message,
        (_) {},
      );

      final received = await textFuture;
      expect(received, '京都');
    });

    test('getInitialProcessedText 原生异常与空内容优雅降级', () async {
      // 1. 原生返回 null
      messenger.setMockMethodCallHandler(platformChannel, (call) async => null);
      expect(await PlatformService.instance.getInitialProcessedText(), isNull);

      // 2. 原生返回纯空白
      messenger.setMockMethodCallHandler(platformChannel, (call) async => '   ');
      expect(await PlatformService.instance.getInitialProcessedText(), isNull);

      // 3. 原生抛出 PlatformException
      messenger.setMockMethodCallHandler(platformChannel, (call) async {
        throw PlatformException(code: 'ERROR', message: 'failed');
      });
      expect(await PlatformService.instance.getInitialProcessedText(), isNull);
    });

    test('onProcessText 忽略空内容与未知方法名', () async {
      bool receivedAny = false;
      final sub = PlatformService.instance.onProcessedText.listen((_) {
        receivedAny = true;
      });

      // 模拟未知方法名
      final unknownMessage = const StandardMethodCodec().encodeMethodCall(
        const MethodCall('unknownMethod', 'test'),
      );
      await messenger.handlePlatformMessage(
        'kanji_hiragana/platform',
        unknownMessage,
        (_) {},
      );

      // 模拟 null 参数
      final nullMessage = const StandardMethodCodec().encodeMethodCall(
        const MethodCall('onProcessText', null),
      );
      await messenger.handlePlatformMessage(
        'kanji_hiragana/platform',
        nullMessage,
        (_) {},
      );

      // 模拟全空白字符
      final emptyMessage = const StandardMethodCodec().encodeMethodCall(
        const MethodCall('onProcessText', '   '),
      );
      await messenger.handlePlatformMessage(
        'kanji_hiragana/platform',
        emptyMessage,
        (_) {},
      );

      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(receivedAny, isFalse);
      await sub.cancel();
    });
  });

  group('多语言文案覆盖测试 (ZhStrings & EnStrings)', () {
    test('遍历检验中英文案对称性与非空断言', () {
      const zh = ZhStrings();
      const en = EnStrings();

      expect(zh.language, AppLanguage.zh);
      expect(en.language, AppLanguage.en);

      // 通用
      expect(zh.appTitle.isNotEmpty, isTrue);
      expect(en.appTitle.isNotEmpty, isTrue);
      expect(zh.close.isNotEmpty, isTrue);
      expect(en.close.isNotEmpty, isTrue);
      expect(zh.copy.isNotEmpty, isTrue);
      expect(en.copy.isNotEmpty, isTrue);

      // 主界面
      expect(zh.inputHint.isNotEmpty, isTrue);
      expect(en.inputHint.isNotEmpty, isTrue);
      expect(zh.clear.isNotEmpty, isTrue);
      expect(en.clear.isNotEmpty, isTrue);
      expect(zh.filterKanji.isNotEmpty, isTrue);
      expect(en.filterKanji.isNotEmpty, isTrue);
      expect(zh.settings.isNotEmpty, isTrue);
      expect(en.settings.isNotEmpty, isTrue);
      expect(zh.viewAlignment.isNotEmpty, isTrue);
      expect(en.viewAlignment.isNotEmpty, isTrue);
      expect(zh.viewFurigana.isNotEmpty, isTrue);
      expect(en.viewFurigana.isNotEmpty, isTrue);
      expect(zh.viewVertical.isNotEmpty, isTrue);
      expect(en.viewVertical.isNotEmpty, isTrue);
      expect(zh.romajiToggle.isNotEmpty, isTrue);
      expect(en.romajiToggle.isNotEmpty, isTrue);
      expect(zh.speak.isNotEmpty, isTrue);
      expect(en.speak.isNotEmpty, isTrue);
      expect(zh.speaking.isNotEmpty, isTrue);
      expect(en.speaking.isNotEmpty, isTrue);
      expect(zh.paste.isNotEmpty, isTrue);
      expect(en.paste.isNotEmpty, isTrue);

      // 导出与 Anki
      expect(zh.export.isNotEmpty, isTrue);
      expect(en.export.isNotEmpty, isTrue);
      expect(zh.exportRuby.isNotEmpty, isTrue);
      expect(en.exportRuby.isNotEmpty, isTrue);
      expect(zh.exportBrackets.isNotEmpty, isTrue);
      expect(en.exportBrackets.isNotEmpty, isTrue);
      expect(zh.exportAnki.isNotEmpty, isTrue);
      expect(en.exportAnki.isNotEmpty, isTrue);
      expect(zh.exportFavorites.isNotEmpty, isTrue);
      expect(en.exportFavorites.isNotEmpty, isTrue);
      expect(zh.ttsUnavailable.isNotEmpty, isTrue);
      expect(en.ttsUnavailable.isNotEmpty, isTrue);
      expect(zh.ankiTagSentence.isNotEmpty, isTrue);
      expect(en.ankiTagSentence.isNotEmpty, isTrue);
      expect(zh.ankiTagFavorite.isNotEmpty, isTrue);
      expect(en.ankiTagFavorite.isNotEmpty, isTrue);
      expect(zh.ankiBaseFormPrefix('食べる').isNotEmpty, isTrue);
      expect(en.ankiBaseFormPrefix('食べる').isNotEmpty, isTrue);
      expect(zh.ankiOnyomiPrefix('こう').isNotEmpty, isTrue);
      expect(en.ankiOnyomiPrefix('こう').isNotEmpty, isTrue);
      expect(zh.ankiKunyomiPrefix('ひ').isNotEmpty, isTrue);
      expect(en.ankiKunyomiPrefix('ひ').isNotEmpty, isTrue);
      expect(zh.ankiNote(4, 100).isNotEmpty, isTrue);
      expect(en.ankiNote(4, 100).isNotEmpty, isTrue);

      // 词性
      final poses = ['名詞', '動詞', '助動詞', '形容詞', '副詞', '助詞', '連体詞', '接続詞', '感動詞'];
      for (final pos in poses) {
        expect(zh.posLabel(pos).isNotEmpty, isTrue);
        expect(en.posLabel(pos).isNotEmpty, isTrue);
      }

      // 筛选与设置
      expect(zh.filterTitle.isNotEmpty, isTrue);
      expect(en.filterTitle.isNotEmpty, isTrue);
      expect(zh.reset.isNotEmpty, isTrue);
      expect(en.reset.isNotEmpty, isTrue);
      expect(zh.settings.isNotEmpty, isTrue);
      expect(en.settings.isNotEmpty, isTrue);
      expect(zh.settingsSubtitle.isNotEmpty, isTrue);
      expect(en.settingsSubtitle.isNotEmpty, isTrue);
      expect(zh.aboutTitle('1.0.0').isNotEmpty, isTrue);
      expect(en.aboutTitle('1.0.0').isNotEmpty, isTrue);
    });

    test('FAULT-01: 原生平台通道抛出 PlatformException 时优雅降级', () async {
      messenger.setMockMethodCallHandler(ttsChannel, (call) async {
        throw PlatformException(code: 'ERROR', message: 'TTS engine failure');
      });

      final success = await TtsService.instance.speak('桜');
      expect(success, isFalse);
      expect(TtsService.instance.isSpeaking, isFalse);
      expect(TtsService.instance.speakingText, '');

      messenger.setMockMethodCallHandler(platformChannel, (call) async {
        throw PlatformException(code: 'UNAVAILABLE');
      });
      final initial = await PlatformService.instance.getInitialProcessedText();
      expect(initial, isNull);
    });
  });
}
