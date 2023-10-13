import 'package:get/get.dart';

import '../modules/audio_record_and_play/index.dart';
import '../modules/expense_tracker/index.dart';
import '../modules/home/index.dart';
import '../modules/quiz_app/index.dart';
import '../modules/roll_dice/index.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROLL_DICE,
      page: () => const RollDiceView(),
      binding: RollDiceBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_APP,
      page: () => const QuizAppView(),
      binding: QuizAppBinding(),
    ),
    GetPage(
      name: _Paths.AUDIO_RECORD_AND_PLAY,
      page: () => const AudioRecordAndPlayView(),
      binding: AudioRecordAndPlayBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSE_TRACKER,
      page: () => const ExpenseTrackerView(),
      binding: ExpenseTrackerBinding(),
    ),
  ];
}
