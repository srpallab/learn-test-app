import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final ColorScheme kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 182),
  );

  static final ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125),
  );
}
