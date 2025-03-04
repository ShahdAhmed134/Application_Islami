import 'package:flutter/material.dart';
import 'package:islami_app_final/home_screen.dart';
import 'package:islami_app_final/quran/quran_details.dart';
import 'package:islami_app_final/theme_app.dart';
import 'ahadeth/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          QuranDetails.routeName: (context) => QuranDetails(),
          HadethDetails.routeName: (context) => HadethDetails(),
        },
      theme: ThemeApp.LightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('ar'),
    );
  }
}
