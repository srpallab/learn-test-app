import 'dart:math';

import 'package:get/get.dart';

class RollDiceController extends GetxController {
  final Random randomizer = Random();
  final RxInt diceNumber = 1.obs;

  void rollDice() {
    diceNumber.value = randomizer.nextInt(6) + 1;
  }
}
