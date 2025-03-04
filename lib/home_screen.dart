import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/ahadeth/ahadeth_tab.dart';
import 'package:islami_app_final/provider/app_config_provider.dart';
import 'package:islami_app_final/quran/quran_tab.dart';
import 'package:islami_app_final/radio/radio_tab.dart';
import 'package:islami_app_final/sebha/sebha_tab.dart';
import 'package:islami_app_final/setting/setting_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDark()
            ? Image.asset(
                'assets/images/main_background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
          'assets/images/background_light.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/quran_icon.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage('assets/images/hadeth_icon.png')),
                    label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/sebha_icon.png')),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/radio_icon.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.setting),
              ],
            ),
          ),
          body: Tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget> Tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab()
  ];
}
