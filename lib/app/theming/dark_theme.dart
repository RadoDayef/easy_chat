import 'package:easy_chat/app/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData theme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: AppColors.textDarkColor,
        backgroundColor: AppColors.primaryDarkColor,
        shape: RoundedRectangleBorder(borderRadius: .circular(24)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillDarkColor,
      contentPadding: .symmetric(horizontal: 18, vertical: 12),
      hintStyle: TextStyle(color: AppColors.disableDarkColor, fontSize: 14, fontWeight: FontWeight.w400),
      labelStyle: TextStyle(color: AppColors.disableDarkColor, fontSize: 14, fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(15),
        borderSide: BorderSide(color: AppColors.disableDarkColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(15),
        borderSide: BorderSide(color: AppColors.primaryDarkColor, width: 1.7),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: .circular(15),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: .circular(15),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.7),
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 9, color: AppColors.textDarkColor),
      titleSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      titleMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDarkColor),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textDarkColor),
      displaySmall: TextStyle(color: AppColors.textDarkColor, fontSize: 13, fontWeight: FontWeight.w500),
      displayLarge: TextStyle(color: AppColors.textDarkColor, fontSize: 30, fontWeight: FontWeight.w900),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textDarkColor),
      headlineSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primaryDarkColor),
      headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primaryDarkColor),
      headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.disableDarkColor),
    ),
  );
}
