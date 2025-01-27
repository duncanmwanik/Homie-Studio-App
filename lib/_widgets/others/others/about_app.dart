import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../buttons/planet.dart';
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
        mph(),
        Flexible(child: AppText(size: large, 'Homie Studio', faded: true, weight: FontWeight.bold)),
        sph(),
        AppText(size: small, 'Version: 1.0.0', faded: true),
        tph(),
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Planet(
              onPressed: () {},
              noStyling: true,
              svp: true,
              radius: borderRadiusLarge,
              child: AppText(size: small, 'Terms', faded: true),
            ),
            tpw(),
            AppIcon(Icons.lens, size: 5),
            tpw(),
            Planet(
              onPressed: () {},
              noStyling: true,
              svp: true,
              radius: borderRadiusLarge,
              child: AppText(size: small, 'Privacy Policy', faded: true),
            ),
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
