import 'package:flutter/material.dart';
import 'package:islami_app_final/home_screen.dart';
import 'package:islami_app_final/theme_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
        theme: ThemeApp.LightTheme);
  }
}
