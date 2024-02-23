import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SimpleAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationCtl;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationCtl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(animationCtl);
    animationCtl.repeat();
  }

  @override
  void onClose() {
    animationCtl.dispose();
    super.onClose();
  }
}
