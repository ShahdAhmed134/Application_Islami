import 'package:flutter/material.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:islami_app_final/quran/constants.dart';
import 'package:islami_app_final/quran/quran_details.dart';
import 'package:islami_app_final/quran/sura_name_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/quran_logo.png')),
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Divider(
                    color: AppColor.primaryLight,
                    thickness: 3,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'sura name',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                      Expanded(
                          child: Text(
                        'numbers',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ))
                    ],
                  ),
                  Divider(
                    color: AppColor.primaryLight,
                    thickness: 3,
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return SuraNameItem(
                        name: Constants.suraNames[index],
                        number: Constants.versesNumber[index].toString(),
                        index: index,
                      );
                    }),
                  )
                ],
              ),
              VerticalDivider(
                color: AppColor.primaryLight,
                thickness: 3,
                indent: 7,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
