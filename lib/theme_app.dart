import 'package:flutter/material.dart';
import 'package:islami_app_final/color_app.dart';

class ThemeApp {
  static final ThemeData LightTheme = ThemeData(
      primaryColor: AppColor.primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: AppColor.blackColor));
}
