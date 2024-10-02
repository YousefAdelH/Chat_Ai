import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0XFF343541);
  static const secondary = Color(0xFFB6EC1D);
  static const bottom = Color(0xFF10A37F);
  static const white = Color(0xFFFFFFFF);
  static const smallContainer = Color(0x14FFFFFF);
  static const black = Color(0xFF202123);
  static const red = Color(0xFFED8C8C);
  static const chat2 = Color(0xFF5d5d67);
}

class AppFontNames {
  static const ralway = "Ralway";
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.primary,
  appBarTheme: const AppBarTheme(color: AppColors.primary),
  textTheme: const TextTheme(bodyText2: TextStyle(color: AppColors.white)),
);
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(color: AppColors.white),
  textTheme: const TextTheme(bodyText2: TextStyle(color: AppColors.black)),
);
