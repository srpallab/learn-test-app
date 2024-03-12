import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/utils/colors.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((value) {});
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: AppColors.kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: AppColors.kColorScheme.onPrimaryContainer,
          foregroundColor: AppColors.kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: AppColors.kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.kColorScheme.onSecondaryContainer,
                fontSize: 18,
              ),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: AppColors.kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: AppColors.kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kDarkColorScheme.primaryContainer,
            foregroundColor: AppColors.kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
    ),
  );
}
