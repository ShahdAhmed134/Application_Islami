import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      child: Container(
        color: provider.isDark() ? AppColor.primaryDark : AppColor.whiteColor,
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.light);
                },
                child: provider.appTheme == ThemeMode.light
                    ? getSelectedItem(AppLocalizations.of(context)!.light)
                    : getUnSelectedItem(AppLocalizations.of(context)!.light)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.dark);
                },
                child: provider.isDark()
                    ? getSelectedItem(AppLocalizations.of(context)!.dark)
                    : getUnSelectedItem(AppLocalizations.of(context)!.dark))
          ],
        ),
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: provider.isDark()
                    ? AppColor.yellow
                    : AppColor.primaryLight)),
        //   TextStyle(
        //       color:
        //           provider.isDark() ? AppColor.yellow : AppColor.primaryLight),
        // ),
        Icon(
          Icons.check,
          color: AppColor.primaryLight,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Text(
      text, style: Theme.of(context).textTheme.bodySmall);
  }
}
