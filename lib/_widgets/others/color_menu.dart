import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/colors.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/button.dart';
import '../menu/menu_item.dart';
import 'color_item.dart';
import 'icons.dart';

List<Widget> colorMenu({String? selectedColor, String title = '', Function(String newColor)? onSelect, bool showRemove = true}) {
  return [
    //
    MenuItem(label: 'Choose color for: $title', faded: true, smallHeight: true, popTrailing: true),
    menuDivider(), ph(1),
    //
    Wrap(
      spacing: tinyWidth(),
      runSpacing: tinyWidth(),
      children: [
        //
        if (showRemove)
          AppButton(
            onPressed: () => popWhatsOnTop(todo: () => onSelect!('')),
            isSquare: true,
            width: 30,
            height: 30,
            dryWidth: true,
            padding: noPadding,
            color: styler.appColor(1),
            child: Center(
              child: AppIcon(Icons.close, size: 15, faded: true),
            ),
          ),
        //
        for (String color in backgroundColors.keys) ColorItem(color: color, selectedColor: selectedColor, onSelect: onSelect),
        //
      ],
    ),
  ];
}
