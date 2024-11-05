import 'package:flutter/material.dart';

import '../../_theme/helpers.dart';
import '../../_theme/variables.dart';
import '../buttons/button.dart';
import 'icons.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({super.key, this.color, required this.menuItems, this.isSmall = false});

  final String? color;
  final List<Widget> menuItems;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    bool hasColor = hasColour(color);

    return AppButton(
      tooltip: 'Color',
      menuItems: menuItems,
      isSquare: true,
      noStyling: true,
      isDropDown: true,
      height: isSmall ? null : 23,
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
