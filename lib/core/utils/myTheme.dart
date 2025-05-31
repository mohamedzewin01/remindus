import 'package:flutter/material.dart';
import 'package:remindus/core/resources/color_manager.dart';


class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorManager.primary,
      scaffoldBackgroundColor: ColorManager.lightBackground,
      appBarTheme: AppBarTheme(
        color: ColorManager.primary,
        iconTheme: const IconThemeData(color: ColorManager.lightText),
        titleTextStyle: const TextStyle(
          color: ColorManager.lightText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: ColorManager.darkText),
        bodyMedium: TextStyle(color: ColorManager.greyText),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorManager.primary,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.accent),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorManager.primaryDark,
      scaffoldBackgroundColor: ColorManager.darkBackground,
      appBarTheme: AppBarTheme(
        color: ColorManager.darkBackground,
        iconTheme: const IconThemeData(color: ColorManager.lightText),
        titleTextStyle: const TextStyle(
          color: ColorManager.lightText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: ColorManager.lightText),
        bodyMedium: TextStyle(color: ColorManager.greyText),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorManager.primaryDark,
      ),
      colorScheme: const ColorScheme.dark().copyWith(secondary: ColorManager.accent),
    );
  }
}
