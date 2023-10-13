import 'package:flutter/material.dart';

Widget startScreen({required void Function() switchScreens}) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        spacerSection(),
        const Text(
          "Learn Flutter the Fun way!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        spacerSection(),
        OutlinedButton.icon(
          onPressed: switchScreens,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz!"),
        )
      ],
    ),
  );
}

SizedBox spacerSection() => const SizedBox(height: 40);
