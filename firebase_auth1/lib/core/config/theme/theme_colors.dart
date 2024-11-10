import 'package:firebase_auth1/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    fontFamily: 'CircularStd',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondbackground,
      hintStyle: const TextStyle(
          color: Color(0xffA7A7A7), fontWeight: FontWeight.w500),
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
      ),
    ),
  );
}
