import 'package:flutter/material.dart';

import '../../../_widgets/buttons/button.dart';
import '../settings_sheet.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      leading: Icons.settings,
      noStyling: true,
      isRound: true,
      onPressed: () => showSettingsBottomSheet(),
    );
  }
}
