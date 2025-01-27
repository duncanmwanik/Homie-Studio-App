import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../_services/hive/boxes.dart';
import '../../../_theme/breakpoints.dart';
import '../../../_theme/spacing.dart';
import '../../../_widgets/buttons/planet.dart';
import '../../../_widgets/others/icons.dart';

class PanelToggle extends StatelessWidget {
  const PanelToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isSmallPC(),
      child: ValueListenableBuilder(
          valueListenable: globalBox.listenable(keys: ['showPanelOptions']),
          builder: (context, box, w) {
            bool isMediumPC = box.get('showPanelOptions', defaultValue: false);

            return Planet(
              onPressed: () => globalBox.put('showPanelOptions', !isMediumPC),
              tooltipDirection: AxisDirection.down,
              margin: padM('r'),
              isRound: true,
              noStyling: true,
              child: AppIcon(
                isMediumPC ? Icons.keyboard_double_arrow_left : Icons.keyboard_double_arrow_right,
                extraFaded: true,
              ),
              // child: AppSvg('side', size: extra, extraFaded: true),
            );
          }),
    );
  }
}
