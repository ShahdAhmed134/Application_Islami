import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:islami_app_final/provider/app_config_provider.dart';
import 'package:islami_app_final/setting/language_bottom_sheet.dart';
import 'package:islami_app_final/setting/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
        vertical: MediaQuery.of(context).size.height * 0.09,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColor.yellow)
                : Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? AppColor.yellow
                      : AppColor.primaryLight,
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                  showLanguageSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: provider.isDark()
                          ? AppColor.whiteColor
                          : AppColor.blackColor,
                    )
                  ],
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColor.yellow)
                : Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? AppColor.yellow
                      : AppColor.primaryLight,
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                  showThemeSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider.isDark()
                        ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: provider.isDark()
                          ? AppColor.whiteColor
                          : AppColor.blackColor,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void showLanguageSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        backgroundColor:
            provider.isDark() ? AppColor.primaryDark : AppColor.whiteColor);
  }

  void showThemeSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ThemeBottomSheet(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
    );
  }
}
