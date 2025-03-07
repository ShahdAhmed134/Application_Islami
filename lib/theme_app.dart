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
            color: AppColor.blackColor,
            fontFamily: 'El Messiri'),
        labelLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor,
            fontFamily: 'El Messiri'),
        labelMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor,
            fontFamily: 'Monotype Koufi'),
        bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
            fontFamily: 'Amiri'),
        bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor,
            fontFamily: 'Monotype Koufi'),
      ));
  static final ThemeData DarkTheme = ThemeData(
      primaryColor: AppColor.primaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColor.whiteColor),
          elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: AppColor.yellow),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor,
            fontFamily: 'El Messiri'),
        labelLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColor.whiteColor,
            fontFamily: 'El Messiri'),
        labelMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor,
            fontFamily: 'Monotype Koufi'),
        bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.whiteColor, ////
            fontFamily: 'Amiri'),
        bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor,
            fontFamily: 'Monotype Koufi'),
      ));
}
