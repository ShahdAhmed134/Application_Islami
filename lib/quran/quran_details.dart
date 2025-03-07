import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = 'quran';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> suraContent = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraNameArgs;
    if (suraContent.isEmpty) {
      loadFile(args.index);
    }
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
            AppLocalizations.of(context)!.app_title,
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
                      Text(args.name,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: provider.isDark()
                                      ? AppColor.yellow
                                      : AppColor.blackColor)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: provider.isDark()
                            ? AppColor.yellow
                            : AppColor.blackColor,
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
              (suraContent.isEmpty)
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryLight,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(
                            '${suraContent[index]}(${index + 1})',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        },
                        itemCount: suraContent.length,
                      ),
                    )
            ],
          ),
        ),
      ),
    ]);
  }

//   void loadFile(int index) async {
//     String content =
//         await rootBundle.loadString('assets/files/${index + 1}.txt');
//     List<String> lines = content.split('\n');
//     suraContent = lines;
//     setState(() {});
//   }
  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');

    // إزالة آخر مسافة في كل سطر
    List<String> modifiedLines = lines.map((line) => line.trimRight()).toList();

    suraContent = modifiedLines;
    setState(() {});
  }
}

class SuraNameArgs {
  String name;
  int index;

  SuraNameArgs({required this.name, required this.index});
}
