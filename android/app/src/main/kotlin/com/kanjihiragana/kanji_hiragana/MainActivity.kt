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

    // 与 Dart 侧 kMaxInputLength (4000) 统一截断阈值，防止跨平台 IPC 冗余传输与内存开销
    private val MAX_PROCESS_TEXT_LENGTH = 4000

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
                val safeText = text.take(MAX_PROCESS_TEXT_LENGTH)
                initialProcessedText = safeText
                platformChannel?.invokeMethod("onProcessText", safeText)
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
                    "isAvailable" -> {
                        if (!ttsReady && tts != null) {
                            checkTtsLanguage()
                        }
                        result.success(ttsReady)
                    }
                    "speak" -> {
                        val text = call.argument<String>("text") ?: ""
                        val utteranceId = call.argument<String>("utteranceId")
                            ?: "KANJI_TTS_${System.currentTimeMillis()}"
                        if (!ttsReady && tts != null) {
                            checkTtsLanguage()
                        }
                        if (ttsReady && text.isNotEmpty()) {
                            tts?.stop()
                            tts?.speak(text, TextToSpeech.QUEUE_FLUSH, null, utteranceId)
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

    private fun checkTtsLanguage(): Boolean {
        val result = tts?.setLanguage(Locale.JAPANESE)
        ttsReady = result != null && result != TextToSpeech.LANG_MISSING_DATA && result != TextToSpeech.LANG_NOT_SUPPORTED
        return ttsReady
    }

    override fun onInit(status: Int) {
        if (status == TextToSpeech.SUCCESS) {
            checkTtsLanguage()
            tts?.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
                override fun onStart(utteranceId: String?) {
                    runOnUiThread { ttsChannel?.invokeMethod("onSpeakStart", utteranceId) }
                }
                override fun onDone(utteranceId: String?) {
                    runOnUiThread { ttsChannel?.invokeMethod("onSpeakDone", utteranceId) }
                }
                @Deprecated("Deprecated in Java")
                override fun onError(utteranceId: String?) {
                    runOnUiThread { ttsChannel?.invokeMethod("onSpeakError", utteranceId) }
                }
                override fun onError(utteranceId: String?, errorCode: Int) {
                    runOnUiThread {
                        val args = mapOf("utteranceId" to utteranceId, "errorCode" to errorCode)
                        ttsChannel?.invokeMethod("onSpeakError", args)
                    }
                }
            })
        } else {
            ttsReady = false
        }
    }

    override fun onDestroy() {
        platformChannel?.setMethodCallHandler(null)
        ttsChannel?.setMethodCallHandler(null)
        platformChannel = null
        ttsChannel = null
        tts?.stop()
        tts?.shutdown()
        tts = null
        super.onDestroy()
    }
}
