import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlatformChannelsController extends GetxController {
  static const MethodChannel platform = MethodChannel('srpallab.com/tdd');
  RxString batteryLevel = 'Unknown battery level.'.obs;

  Future<void> getBatterLevel() async {
    String batteryLevelLocal;
    try {
      final int? result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevelLocal = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevelLocal = "Failed to get battery level: '${e.message}'.";
    }
    batteryLevel.value = batteryLevelLocal;
  }

  Future<void> gotoSettingsPage() async {
    try {
      await platform.invokeMethod('gotoSettings');
    } on PlatformException catch (e) {
      log("Failed to start intent: '${e.message}'.");
    }
  }
}
