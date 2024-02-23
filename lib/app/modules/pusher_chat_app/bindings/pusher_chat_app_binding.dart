import 'package:get/get.dart';

import '../controllers/pusher_chat_app_controller.dart';

class PusherChatAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PusherChatAppController>(
      () => PusherChatAppController(),
    );
  }
}
