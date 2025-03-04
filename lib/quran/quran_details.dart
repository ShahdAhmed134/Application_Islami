import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = 'quran';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> suraContent = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraNameArgs;
    if (suraContent.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      Image.asset(
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
              color: Color(0xccffffff),
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
                          args.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Icon(Icons.play_circle)
                    ],
                  )),
              Divider(
                color: AppColor.primaryLight,
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
                            style: Theme.of(context).textTheme.displayMedium,
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

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    suraContent = lines;
    setState(() {});
  }
}

class SuraNameArgs {
  String name;
  int index;

  SuraNameArgs({required this.name, required this.index});
}
