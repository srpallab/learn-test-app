import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pusher_chat_app_controller.dart';

class PusherChatAppView extends GetView<PusherChatAppController> {
  const PusherChatAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusher Channels Example'),
      ),
      body: Obx(() {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.isPusherConnected.value
                ? const Text("Connected")
                : const Text("Connecting"));
      }),
    );
  }
}
