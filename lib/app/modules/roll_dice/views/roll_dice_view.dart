import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/roll_dice_controller.dart';

class RollDiceView extends GetView<RollDiceController> {
  const RollDiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Image.asset(
                    "assets/images/dice-${controller.diceNumber.value}.png",
                    height: 200,
                  );
                }),
                TextButton(
                  onPressed: controller.rollDice,
                  child: const Text(
                    "ROLL DICE",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
