import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/simple_animation_controller.dart';

class SimpleAnimationView extends GetView<SimpleAnimationController> {
  const SimpleAnimationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Simple Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationCtl,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateY(
                  controller.animation.value,
                ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
