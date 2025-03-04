import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:islami_app_final/quran/constants.dart';
import 'package:islami_app_final/quran/sura_name_item.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/quran_logo.png')),
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Divider(
                    color: provider.isDark()
                        ? AppColor.yellow
                        : AppColor.primaryLight,
                    thickness: 3,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        AppLocalizations.of(context)!.sura_name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                      Expanded(
                          child: Text(
                        AppLocalizations.of(context)!.numbers,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ))
                    ],
                  ),
                  Divider(
                    color: provider.isDark()
                        ? AppColor.yellow
                        : AppColor.primaryLight,
                    thickness: 3,
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return SuraNameItem(
                        name: Constants.suraNames[index],
                        number: Constants.versesNumber[index].toString(),
                        index: index,
                      );
                    }),
                  )
                ],
              ),
              VerticalDivider(
                color:
                    provider.isDark() ? AppColor.yellow : AppColor.primaryLight,
                thickness: 3,
                indent: 7,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
