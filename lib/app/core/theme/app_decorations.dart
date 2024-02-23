import 'package:flutter/material.dart';

BoxDecoration quizPageDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 78, 13, 150),
        Color.fromARGB(255, 105, 15, 168),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
