import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_final/ahadeth/hadeth_name_item.dart';

import '../color_app.dart';

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
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/ahadeth_logo.png')),
        Divider(
          color: AppColor.primaryLight,
          thickness: 3,
        ),
        Text(
          'Ahadeth',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Divider(
          color: AppColor.primaryLight,
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