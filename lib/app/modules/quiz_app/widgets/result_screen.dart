import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdd_test/app/modules/quiz_app/widgets/questions_summary.dart';

import '../../../data/questions.dart';

Widget resultScreen({
  required List<String> selectedAnswers,
  required void Function() resetQuiz,
}) {
  final List<Map<String, Object>> summary = [];
  final int numberOfTotalQuestions = questions.length;
  for (int i = 0; i < questions.length; i++) {
    summary.add({
      'question_index': i,
      'question': questions[i].question!,
      'correct_answer': questions[i].options[0]!,
      'user_answer': selectedAnswers[i],
    });
  }

  final int numberOfCorrectQuestions = summary.where((element) {
    return element['correct_answer'] == element['user_answer'];
  }).length;

  return SizedBox(
    width: Get.width,
    child: Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "You answered $numberOfCorrectQuestions out of "
            "$numberOfTotalQuestions question correctly!",
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 10),
          questionsSummary(summary: summary),
          const SizedBox(height: 10),
          TextButton(onPressed: resetQuiz, child: const Text("Restart Quiz!"))
        ],
      ),
    ),
  );
}
