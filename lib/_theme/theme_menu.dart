import 'package:flutter/material.dart';

import '../_helpers/extentions/strings.dart';
import '../_helpers/navigation.dart';
import '../_models/menu.dart';
import '../_providers/_providers.dart';
import '../_widgets/buttons/planet.dart';
import '../_widgets/menu/menu_item.dart';
import '../_widgets/others/color_item.dart';
import '../_widgets/others/others/divider.dart';
import '../_widgets/others/text.dart';
import 'colors.dart';
import 'spacing.dart';
import 'styler.dart';
import 'variables.dart';

Menu themeMenu() {
  Map<String, ColorObject> themeColors = {...backgroundColors};
  themeColors.removeWhere((key, value) => !value.isTheme);

  return Menu(
    width: 300, // TODO: a must for some reason
    items: [
      //
      const MenuItem(label: 'Choose theme', smallHeight: true, popTrailing: true),
      tph(),
      // theme + background images
      GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 2.8,
        children: List.generate(themeImages.length, (index) {
          String themeImage = themeImages.keys.toList()[index];
          String themeType = themeImages[themeImage] ?? 'light';
          Color color = themeType == 'light' ? black : white;
          bool isDark = ['dark'].contains(themeImage);
          bool isSelected = themeImage == state.theme.themeImage;

          return Planet(
            onPressed: () => popWhatsOnTop(todoLast: () => state.theme.setThemeImage(themeImage, themeType, state.theme.themeAccent)),
            noStyling: !isSelected,
            color: styler.accentColor(),
            padding: padT(),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadiusTiny),
                    border: Border.all(color: isSelected ? styler.borderColor() : transparent),
                    color: (isDark ? AppColors.darkPrimary : white),
                  ),
                ),
                Center(child: AppText(size: small, themeImage.cap(), color: color))
              ],
            ),
          );
        }),
      ),
      //
      AppDivider(height: mediumHeight()),
      // accent colors
      GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: tinyWidth(),
        crossAxisSpacing: tinyWidth(),
        crossAxisCount: 8,
        children: List.generate(themeColors.length, (index) {
          String color = themeColors.keys.toList()[index];

          return ColorItem(
            color: color,
            selectedColor: state.theme.themeAccent,
            onSelect: (newColor) {
              state.theme.setThemeImage(state.theme.themeImage, state.theme.themeType, newColor);
            },
          );
        }),
      ),
      //
    ],
  );
}
