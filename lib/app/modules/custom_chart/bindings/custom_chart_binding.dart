import 'package:get/get.dart';

import '../controllers/custom_chart_controller.dart';

class CustomChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomChartController>(
      () => CustomChartController(),
    );
  }
}
