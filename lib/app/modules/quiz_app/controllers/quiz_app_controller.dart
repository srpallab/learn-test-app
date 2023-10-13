import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/questions.dart';
import '../models/quiz_question_model.dart';
import '../widgets/question_screen.dart';
import '../widgets/result_screen.dart';
import '../widgets/start_screen.dart';

class QuizAppController extends GetxController {
  late final Rx<Widget> activeScreen;

  final RxInt questionIndex = 0.obs;
  final Rx<QuizQuestionModel>? selectedQuestion =
      QuizQuestionModel(null, []).obs;

  final List<String> selectedAnswers = [];

  void switchScreens() {
    selectedQuestion?.value = questions[questionIndex.value];
    activeScreen.value = questionScreen(
      question: selectedQuestion!.value.question!,
      options: selectedQuestion!.value.getShuffledAnswers(),
      chooseAnswer: chooseAnswer,
    );
  }

  void chooseAnswer(String answer) {
    log("$answer ${questionIndex.value}");
    selectedAnswers.add(answer);

    if (questionIndex.value < (questions.length - 1)) {
      questionIndex.value += 1;
      switchScreens();
    } else {
      activeScreen.value = resultScreen(
        selectedAnswers: selectedAnswers,
        resetQuiz: () {
          questionIndex.value = 0;
          activeScreen.value = startScreen(switchScreens: switchScreens);
        },
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    activeScreen = startScreen(switchScreens: switchScreens).obs;
  }
}
