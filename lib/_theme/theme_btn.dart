import 'package:flutter/material.dart';

import '../_widgets/buttons/button.dart';
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
      child: AppButton(
        menuItems: themeMenu(),
        menuWidth: 300,
        tooltip: 'Theme',
        isSquare: true,
        noStyling: true,
        iconSize: 22,
        leading: Icons.dark_mode,
      ),
    );
  }
}
