import 'package:flutter/material.dart';

import '../_widgets/buttons/planet.dart';
import '../_widgets/others/icons.dart';
import 'spacing.dart';
import 'theme_menu.dart';
import 'variables.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, this.rightPadding = true});
  final bool rightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: rightPadding ? padM('r') : noPadding,
      child: Planet(
        menu: themeMenu(),
        tooltip: 'Theme',
        isRound: true,
        noStyling: true,
        child: AppIcon(Icons.dark_mode, faded: true),
      ),
    );
  }
}
