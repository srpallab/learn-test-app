import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/platform_channels_controller.dart';

class PlatformChannelsView extends GetView<PlatformChannelsController> {
  const PlatformChannelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform Channels'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Obx(() {
                  return Text(controller.batteryLevel.value);
                }),
                ElevatedButton(
                  onPressed: controller.getBatterLevel,
                  child: const Text("Get Battery Level"),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: controller.gotoSettingsPage,
                  child: const Text("Goto Settings Page"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
