import 'package:flutter/material.dart';

import '../../_theme/variables.dart';
import '../../_widgets/others/text.dart';

class MixerView extends StatelessWidget {
  const MixerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        Center(
          child: AppText('Mixer', faded: true, size: title),
        ),
        //
      ],
    );
  }
}
