import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> menuList = [
    {
      'name': "Roll Dice",
      "goto": () => Get.toNamed(Routes.ROLL_DICE),
    },
    {
      'name': "Quiz App",
      "goto": () => Get.toNamed(Routes.QUIZ_APP),
    },
    {
      'name': "Audio Record",
      "goto": () => Get.toNamed(Routes.AUDIO_RECORD_AND_PLAY),
    },
    {
      'name': "Expense Tracker",
      "goto": () => Get.toNamed(Routes.EXPENSE_TRACKER),
    },
    {
      'name': "Chat App",
      'goto': () => Get.toNamed(Routes.PUSHER_CHAT_APP),
    },
    {
      'name': "Simple Animation",
      'goto': () => Get.toNamed(Routes.SIMPLE_ANIMATION),
    },
    {
      'name': "Chained Animation",
      'goto': () => Get.toNamed(Routes.CHAINED_ANIMATION),
    },
    {
      'name': "Platform Channels ",
      'goto': () => Get.toNamed(Routes.PLATFORM_CHANNELS),
    },
    {
      'name': "Custom Chart",
      'goto': () => Get.toNamed(Routes.CUSTOM_CHART),
    },
  ];
}
