import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

class AppTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme = ThemeData(
      fontFamily: 'cairo',
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.textColor,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.whiteColor,
        headerForegroundColor: AppColors.primaryColor,
      ),
      timePickerTheme: TimePickerThemeData(
          backgroundColor: AppColors.whiteColor,
          dialBackgroundColor: AppColors.primaryColor,
          hourMinuteColor: AppColors.primaryColor,
          dayPeriodColor: AppColors.accentColor,
          hourMinuteTextColor: AppColors.textColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.accentColor,
        filled: true,
        hintStyle: TextStyle(fontSize: 15, color: AppColors.textColor),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ));
}
