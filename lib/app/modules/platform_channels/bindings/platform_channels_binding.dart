import 'package:get/get.dart';

import '../controllers/platform_channels_controller.dart';

class PlatformChannelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlatformChannelsController>(
      () => PlatformChannelsController(),
    );
  }
}
