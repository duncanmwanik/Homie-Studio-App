import 'package:flutter/material.dart';

import '../../_models/menu.dart';
import '../../_theme/helpers.dart';
import '../../_theme/variables.dart';
import '../buttons/planet.dart';
import 'icons.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({super.key, this.color, required this.menu, this.isSmall = false});

  final String? color;
  final Menu menu;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    bool hasColor = hasColour(color);

    return Planet(
      tooltip: 'Color',
      menu: menu,
      isRound: true,
      noStyling: true,
      srp: true,
      minHeight: isSmall ? null : 23,
      child: isSmall
          ? const AppIcon(Icons.color_lens_rounded, size: 16, faded: true)
          : AppIcon(
              Icons.lens,
              size: 20,
              color: hasColor ? styler.getItemBgColor(color, false) : (styler.isDark ? Colors.white24 : Colors.black54),
            ),
    );
  }
}
