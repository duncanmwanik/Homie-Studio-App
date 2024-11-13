import 'package:flutter/material.dart';

import '../../_models/effect.dart';
import '../../_theme/spacing.dart';
import '../hub/_w/brightness.dart';
import 'color.dart';
import 'var/colors.dart';
import 'w/color_circle.dart';

class ColorsView extends StatelessWidget {
  const ColorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        BrightnessSlider(),
        //
        ColorCircle(),
        //
        Flexible(
          child: Padding(
            padding: padSL('tb'),
            child: Wrap(
              spacing: smallWidth(),
              runSpacing: smallWidth(),
              children: [
                for (Effect effect in hubColors) ColorItem(effect: effect),
              ],
            ),
          ),
        )
        //
      ],
    );
  }
}
