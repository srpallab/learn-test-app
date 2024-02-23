import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chained_animation_controller.dart';

class ChainedAnimationView extends GetView<ChainedAnimationController> {
  const ChainedAnimationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chained Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: const Color(0xff0057b7),
              width: 200,
              height: 200,
            ),
            Container(
              color: const Color(0xffffd700),
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
