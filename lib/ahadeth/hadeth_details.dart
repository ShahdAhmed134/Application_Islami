import 'package:flutter/material.dart';
import 'package:islami_app_final/ahadeth/ahadeth_tab.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadeth';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
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
            'Islami',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.05,
            horizontal: MediaQuery.of(context).size.height * 0.02,
          ),
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          decoration: BoxDecoration(
              color: provider.isDark()
                  ? AppColor.primaryDark
                  : AppColor.whiteColor,
              borderRadius: BorderRadius.circular(13)),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          args.title,
                          style: provider.isDark()
                              ? Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColor.yellow)
                              : Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Icon(
                        Icons.play_circle,
                        color: provider.isDark()
                            ? AppColor.yellow
                            : AppColor.whiteColor,
                      )
                    ],
                  )),
              Divider(
                color:
                    provider.isDark() ? AppColor.yellow : AppColor.primaryLight,
                thickness: 3,
                indent: MediaQuery.of(context).size.width * 0.07,
                endIndent: MediaQuery.of(context).size.width * 0.07,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      args.content[index],
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: provider.isDark()
                          ? Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: AppColor.yellow)
                          : Theme.of(context).textTheme.displayMedium,
                    );
                  },
                  itemCount: args.content.length,
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
