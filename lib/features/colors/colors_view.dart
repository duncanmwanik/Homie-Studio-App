import 'package:flutter/material.dart';

import '../../_models/effect.dart';
import '../../_theme/spacing.dart';
import '../../_variables/features.dart';
import '../hub/_w/brightness.dart';
import '../hub/effect.dart';
import 'picker.dart';
import 'segments/segments.dart';
import 'var/colors.dart';

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
        AppColorPicker(),
        //
        Flexible(
          child: Padding(
            padding: padL('tb'),
            child: Wrap(
              spacing: smallWidth(),
              runSpacing: smallWidth(),
              children: [
                //
                for (Effect effect in hubColors)
                  EffectItem(
                    type: features.colors,
                    effect: effect,
                  ),
                //
              ],
            ),
          ),
        ),
        //
        SegmentButton()
        //
      ],
    );
  }
}
