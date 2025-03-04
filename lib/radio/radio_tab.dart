import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_final/color_app.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text(
          AppLocalizations.of(context)!.quran_radio,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous_rounded,
              color:
                  provider.isDark() ? AppColor.yellow : AppColor.primaryLight,
              size: 50,
            ),
            Icon(
              Icons.play_arrow_rounded,
              color:
                  provider.isDark() ? AppColor.yellow : AppColor.primaryLight,
              size: 50,
            ),
            Icon(
              Icons.skip_next,
              color:
                  provider.isDark() ? AppColor.yellow : AppColor.primaryLight,
              size: 50,
            ),
          ],
        ),
      ],
    );
  }
}