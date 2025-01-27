import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/planet.dart';
import '../../../_widgets/others/icons.dart';
import '../../../_widgets/others/text.dart';
import 'sheet.dart';

class SegmentButton extends StatelessWidget {
  const SegmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Planet(
      onPressed: () => showSegmentsSheet(),
      margin: padM('t'),
      padding: padC('l20,r12,t8,b8'),
      minHeight: 60,
      gradient: styler.gradient([Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple]),
      child: Row(
        children: [
          Expanded(child: AppText('Make Segments', size: normal, weight: ft6)),
          AppIcon(Icons.arrow_forward, faded: true),
        ],
      ),
    );
  }
}
