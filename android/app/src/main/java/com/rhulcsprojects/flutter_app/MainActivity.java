package com.rhulcsprojects.flutter_app;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.rhulcsprojects.flutter_app/time";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            if (call.method.equals("getCurrentTime")) {
                                String currentTime = getCurrentTime();

                                if (currentTime != null) {
                                    result.success(currentTime);
                                } else {
                                    result.error("UNAVAILABLE", "Getting the current time is not possible.", null);
                                }
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    private String getCurrentTime() {
        Date currentTime = new Date();
        SimpleDateFormat  dtf = new SimpleDateFormat("HH:mm:ss");
        dtf.format(currentTime);
        return dtf.format(currentTime);
    }
}
