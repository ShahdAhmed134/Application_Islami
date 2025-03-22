import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  int counter = 0, index = 0;
  double _angle = 0;
  List<String> azkar = [
    "سبحان اللّه",
    "الحمدلله",
    "الله اكبر",
    "لا اله الا الله"
  ];

  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          GestureDetector(
            onTap: onClick,
            child: Stack(alignment: Alignment.topCenter, children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09,
                    bottom: MediaQuery.of(context).size.height * 0.04),
                child: Transform.rotate(
                  angle: _angle,
                  child: provider.isDark()
                      ? Image.asset(
                          'assets/images/dark_body_of_seb7a.png',
                        )
                      : Image.asset(
                          'assets/images/body_of_sebha.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.05),
                child: provider.isDark()
                    ? Image.asset(
                        'assets/images/dark_head_of_seb7a.png',
                      )
                    : Image.asset(
                        'assets/images/head_of_sebha.png',
                ),
              )
            ]),
          ),
          Text(
            AppLocalizations.of(context)!.counter,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: provider.isDark() ? AppColor.yellow : AppColor.gold),
            child: Text(
              '$counter',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: provider.isDark()
                    ? AppColor.yellow
                    : AppColor.primaryLight),
            child: Text(
              azkar[index],
                style: Theme.of(context).textTheme.labelLarge),
          ),
        ],
      ),
    );
  }

  void onClick() {
    if (counter == 33) {
      index++;
      counter = 0;
    }
    if (index == azkar.length) {
      index = 0;
    }
    counter++;

    _angle += 360 / 6;
    setState(() {});
  }
}