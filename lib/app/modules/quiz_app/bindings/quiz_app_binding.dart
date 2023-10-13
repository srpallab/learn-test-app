import 'package:get/get.dart';

import '../controllers/quiz_app_controller.dart';

class QuizAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizAppController>(
      () => QuizAppController(),
    );
  }
}
