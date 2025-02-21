import 'package:flutter/material.dart';
import 'package:islami_app_final/color_app.dart';

class ThemeApp {
  static final ThemeData LightTheme = ThemeData(
      primaryColor: AppColor.primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: AppColor.blackColor),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor),
        labelLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor),
        bodyLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor),
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor),
        displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor),
      ));
}
