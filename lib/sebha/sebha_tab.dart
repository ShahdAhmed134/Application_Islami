import 'package:flutter/material.dart';
import 'package:islami_app_final/color_app.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  int counter = 0, index = 0;
  double _angle = 0;
  List<String> azkar = [
    "سبحان اللّه",
    "الحمدلله",
    "الله اكبر",
    "لا اله الا الله"
  ];

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          GestureDetector(
            onTap: onClick,
            child: Stack(alignment: Alignment.topCenter, children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09,
                    bottom: MediaQuery.of(context).size.height * 0.04),
                child: Transform.rotate(
                  angle: _angle,
                  child: Image.asset(
                    'assets/images/body_of_sebha.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.05),
                child: Image.asset(
                  'assets/images/head_of_sebha.png',
                ),
              )
            ]),
          ),
          Text(
            'number of tasbeh',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: AppColor.gold),
            child: Text(
              '$counter',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.primaryLight),
            child: Text(
              azkar[index],
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteColor),
            ),
          )
        ],
      ),
    );
  }

  void onClick() {
    if (counter % 33 == 0) {
      index++;
    }
    if (index == azkar.length) {
      index = 0;
    }
    counter++;
    _angle += 360 / 6;
    setState(() {});
  }
}
