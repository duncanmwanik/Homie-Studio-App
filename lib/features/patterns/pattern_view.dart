import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../_models/effect.dart';
import '../../_variables/features.dart';
import '../hub/_w/brightness.dart';
import '../hub/_w/speed.dart';
import '../hub/effect.dart';
import 'var/patterns.dart';

class PatternView extends StatelessWidget {
  const PatternView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        BrightnessSlider(),
        SpeedSlider(),
        //
        Flexible(
          child: Padding(
            padding: padL('tb'),
            child: Wrap(
              spacing: smallWidth(),
              runSpacing: smallWidth(),
              children: [
                for (Effect effect in hubPatterns)
                  EffectItem(
                    type: features.patterns,
                    effect: effect,
                  ),
              ],
            ),
          ),
        ),
        //
      ],
    );
  }
}
