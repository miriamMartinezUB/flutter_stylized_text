
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterStylizedText {
  static const MethodChannel _channel = MethodChannel('flutter_stylized_text');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
