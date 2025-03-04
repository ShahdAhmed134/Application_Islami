import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/ahadeth/hadeth_name_item.dart';
import 'package:provider/provider.dart';

import '../color_app.dart';
import '../provider/app_config_provider.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/ahadeth_logo.png')),
        Divider(
          color: provider.isDark() ? AppColor.yellow : AppColor.primaryLight,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Divider(
          color: provider.isDark() ? AppColor.yellow : AppColor.primaryLight,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryLight,
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return HadethNameItem(hadeth: ahadethList[index]);
                  },
                  itemCount: ahadethList.length,
                ),
        )
      ],
    );
  }

  void loadFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      print(hadethList[i]);
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}