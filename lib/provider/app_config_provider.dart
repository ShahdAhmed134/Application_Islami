import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  /// data
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  /// change data
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) return;

    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appLanguage == newTheme) return;

    appTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
