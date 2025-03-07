import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItem(AppLocalizations.of(context)!.english)
                  : getUnSelectedItem(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItem(AppLocalizations.of(context)!.arabic))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: provider.isDark()
                    ? AppColor.yellow
                    : AppColor.primaryLight)),
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
