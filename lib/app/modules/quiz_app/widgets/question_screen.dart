import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_text_styles.dart';
import 'answer_button.dart';

Widget questionScreen({
  required String question,
  required List options,
  required void Function(String) chooseAnswer,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question,
          style: AppTextStyles.question,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        ...options
            .map((e) => AnswerButton(title: e, onTap: () => chooseAnswer(e))),
      ],
    ),
  );
}
