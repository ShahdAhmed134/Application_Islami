import 'package:flutter/material.dart';
import 'package:islami_app_final/quran/quran_details.dart';

class SuraNameItem extends StatelessWidget {
  String name, number;
  int index;

  SuraNameItem({required this.name, required this.number, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(QuranDetails.routeName,
            arguments: SuraNameArgs(name: name, index: index));
      },
      child: Row(
        children: [
          Expanded(
              child: Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          Expanded(
            child: Text(
              number,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
