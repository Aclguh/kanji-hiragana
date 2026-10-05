package com.kanjihiragana.kanji_hiragana

import android.content.Intent
import android.os.Bundle
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Locale

class MainActivity : FlutterActivity(), TextToSpeech.OnInitListener {
    private val PLATFORM_CHANNEL = "kanji_hiragana/platform"
    private val TTS_CHANNEL = "kanji_hiragana/tts"

    private var initialProcessedText: String? = null
    private var platformChannel: MethodChannel? = null
    private var ttsChannel: MethodChannel? = null
    private var tts: TextToSpeech? = null
    private var ttsReady = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleProcessTextIntent(intent)
        tts = TextToSpeech(this, this)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        handleProcessTextIntent(intent)
    }

    private fun handleProcessTextIntent(intent: Intent?) {
        if (intent?.action == Intent.ACTION_PROCESS_TEXT) {
            val text = intent.getCharSequenceExtra(Intent.EXTRA_PROCESS_TEXT)?.toString()
            if (!text.isNullOrEmpty()) {
                initialProcessedText = text
                platformChannel?.invokeMethod("onProcessText", text)
            }
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        platformChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PLATFORM_CHANNEL).apply {
            setMethodCallHandler { call, result ->
                when (call.method) {
                    "getInitialProcessedText" -> {
                        val text = initialProcessedText
                        initialProcessedText = null
                        result.success(text)
                    }
                    else -> result.notImplemented()
                }
            }
        }

        ttsChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, TTS_CHANNEL).apply {
            setMethodCallHandler { call, result ->
                when (call.method) {
                    "isAvailable" -> result.success(ttsReady)
                    "speak" -> {
                        val text = call.argument<String>("text") ?: ""
                        if (ttsReady && text.isNotEmpty()) {
                            tts?.stop()
                            tts?.speak(text, TextToSpeech.QUEUE_FLUSH, null, "KANJI_TTS_${System.currentTimeMillis()}")
                            result.success(true)
                        } else {
                            result.success(false)
                        }
                    }
                    "stop" -> {
                        tts?.stop()
                        result.success(true)
                    }
                    else -> result.notImplemented()
                }
            }
        }
    }

    override fun onInit(status: Int) {
        if (status == TextToSpeech.SUCCESS) {
            val result = tts?.setLanguage(Locale.JAPANESE)
            ttsReady = result != TextToSpeech.LANG_MISSING_DATA && result != TextToSpeech.LANG_NOT_SUPPORTED
            tts?.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
                override fun onStart(utteranceId: String?) {
                    runOnUiThread { ttsChannel?.invokeMethod("onSpeakStart", utteranceId) }
                }
                override fun onDone(utteranceId: String?) {
                    runOnUiThread { ttsChannel?.invokeMethod("onSpeakDone", utteranceId) }
                }
                override fun onError(utteranceId: String?) {
                    runOnUiThread { ttsChannel?.invokeMethod("onSpeakError", utteranceId) }
                }
            })
        } else {
            ttsReady = false
        }
    }

    override fun onDestroy() {
        tts?.stop()
        tts?.shutdown()
        tts = null
        super.onDestroy()
    }
}
