import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../_models/effect.dart';
import '../hub/_w/brightness.dart';
import '../hub/_w/speed.dart';
import 'pattern.dart';
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
            padding: padSL('tb'),
            child: Wrap(
              spacing: smallWidth(),
              runSpacing: smallWidth(),
              children: [
                for (Effect effect in hubPatterns) PatternItem(effect: effect),
              ],
            ),
          ),
        ),
        //
      ],
    );
  }
}
