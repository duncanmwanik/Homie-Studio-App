import 'package:flutter/material.dart';

import '../../_theme/spacing.dart';
import '../../_widgets/buttons/planet.dart';
import '../../_widgets/others/icons.dart';
import 'settings_sheet.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Planet(
      onPressed: () => showSettingsBottomSheet(),
      tooltipDirection: AxisDirection.down,
      margin: padM('l'),
      isRound: true,
      noStyling: true,
      child: AppIcon(Icons.settings, faded: true),
    );
  }
}
