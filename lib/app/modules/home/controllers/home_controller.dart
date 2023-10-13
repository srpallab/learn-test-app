import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> menuList = [
    {
      'name': "Roll Dice",
      "goto": () {
        Get.toNamed(Routes.ROLL_DICE);
      },
    },
    {
      'name': "Quiz App",
      "goto": () {
        Get.toNamed(Routes.QUIZ_APP);
      },
    },
    {
      'name': "Audio Record",
      "goto": () {
        Get.toNamed(Routes.AUDIO_RECORD_AND_PLAY);
      },
    },
    {
      'name': "Expense Tracker",
      "goto": () {
        Get.toNamed(Routes.EXPENSE_TRACKER);
      },
    },
  ];
}
