import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_models/menu.dart';
import '../../_theme/colors.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/planet.dart';
import '../menu/menu_item.dart';
import 'color_item.dart';
import 'icons.dart';

Menu colorMenu({
  String? selectedColor,
  String? title,
  Function(String newColor)? onSelect,
  Function()? onRemove,
  bool showRemove = true,
  bool showX = false,
}) {
  return Menu(
    width: 300,
    items: [
      //
      MenuItem(label: title ?? 'Choose color', faded: true, smallHeight: true, popTrailing: true),
      menuDivider(), ph(1),
      //
      Wrap(
        spacing: tinyWidth(),
        runSpacing: tinyWidth(),
        children: [
          //
          if (showRemove)
            Planet(
              onPressed: () => popWhatsOnTop(todo: () => onRemove != null ? onRemove() : onSelect!('')),
              isRound: true,
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
          if (showX)
            Planet(
              onPressed: () => popWhatsOnTop(todo: () => onSelect!('x')),
              isRound: true,
              width: 30,
              height: 30,
              dryWidth: true,
              padding: noPadding,
              color: styler.appColor(1),
              child: Center(
                child: AppIcon(Icons.circle, size: tiny, extraFaded: true),
              ),
            ),
          //
          for (String color in backgroundColors.keys) ColorItem(color: color, selectedColor: selectedColor, onSelect: onSelect),
          //
        ],
      ),
    ],
  );
}
