import 'package:flutter/material.dart';
import 'package:islami_app_final/ahadeth/ahadeth_tab.dart';
import 'package:islami_app_final/ahadeth/hadeth_details.dart';

class HadethNameItem extends StatelessWidget {
  Hadeth hadeth;

  HadethNameItem({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetails.routeName, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
