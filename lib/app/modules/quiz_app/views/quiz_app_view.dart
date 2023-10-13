import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/layouts/app_decorations.dart';
import '../controllers/quiz_app_controller.dart';

class QuizAppView extends GetView<QuizAppController> {
  const QuizAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 13, 150),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Obx(() {
        return Container(
          decoration: quizPageDecoration(),
          child: controller.activeScreen.value,
        );
      }),
    );
  }
}
