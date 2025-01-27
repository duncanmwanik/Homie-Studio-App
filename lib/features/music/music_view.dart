import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../_models/effect.dart';
import '../../_variables/features.dart';
import '../hub/_w/brightness.dart';
import '../hub/_w/sensitivity.dart';
import '../hub/effect.dart';
import 'var/music.dart';

class MusicView extends StatelessWidget {
  const MusicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        BrightnessSlider(),
        SensitivitySlider(),
        //
        Flexible(
          child: Padding(
            padding: padL('tb'),
            child: Wrap(
              spacing: smallWidth(),
              runSpacing: smallWidth(),
              children: [
                //
                for (Effect effect in hubMusic)
                  EffectItem(
                    type: features.music,
                    effect: effect,
                  ),
                //
              ],
            ),
          ),
        ),
        //
      ],
    );
  }
}
