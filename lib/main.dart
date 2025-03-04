import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/home_screen.dart';
import 'package:islami_app_final/provider/app_config_provider.dart';
import 'package:islami_app_final/quran/quran_details.dart';
import 'package:islami_app_final/theme_app.dart';
import 'package:provider/provider.dart';

import 'ahadeth/hadeth_details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
          QuranDetails.routeName: (context) => QuranDetails(),
          HadethDetails.routeName: (context) => HadethDetails(),
        },
      theme: ThemeApp.LightTheme,
      themeMode: provider.appTheme,
      darkTheme: ThemeApp.DarkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
