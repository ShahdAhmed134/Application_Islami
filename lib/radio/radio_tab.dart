import 'package:flutter/material.dart';
import 'package:islami_app_final/color_app.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text(
          'Quran Radio',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous_rounded,
              color: AppColor.primaryLight,
              size: 50,
            ),
            Icon(
              Icons.play_arrow_rounded,
              color: AppColor.primaryLight,
              size: 50,
            ),
            Icon(
              Icons.skip_next,
              color: AppColor.primaryLight,
              size: 50,
            ),
          ],
        ),
      ],
    );
  }
}
