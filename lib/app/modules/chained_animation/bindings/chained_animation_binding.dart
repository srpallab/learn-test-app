import 'package:get/get.dart';

import '../controllers/chained_animation_controller.dart';

class ChainedAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChainedAnimationController>(
      () => ChainedAnimationController(),
    );
  }
}
