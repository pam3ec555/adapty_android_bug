package com.example.adapty_test

import android.os.Bundle
import android.util.Log
import androidx.core.content.res.ResourcesCompat
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterFragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    private val CHANNEL = "font_check"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "hasComfortaaBold") {
                val typeface = ResourcesCompat.getFont(this, R.font.comfortaa_bold)
                result.success(typeface != null)
            } else {
                result.notImplemented()
            }
        }
    }
}
