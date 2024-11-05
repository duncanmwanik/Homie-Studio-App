import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../buttons/button.dart';
import '../icons.dart';
import '../images.dart';
import '../text.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        elph(),
        AppImage('logo.png', size: 50),
        spw(),
        Flexible(child: AppText(size: large, text: 'Homie', faded: true, weight: FontWeight.bold)),
        sph(),
        AppText(size: small, text: 'Version: 1.0.1', faded: true),
        tph(),
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            AppButton(onPressed: () {}, noStyling: true, svp: true, child: AppText(size: small, text: 'Terms', faded: true)),
            tpw(),
            AppIcon(Icons.lens, size: 5),
            tpw(),
            AppButton(onPressed: () {}, noStyling: true, svp: true, child: AppText(size: small, text: 'Privacy Policy', faded: true)),
            //
          ],
        ),
        //
        elph(),
        //
      ],
    );
  }
}
