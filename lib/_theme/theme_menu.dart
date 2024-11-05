import 'package:flutter/material.dart';

import '../_helpers/navigation.dart';
import '../_providers/_providers.dart';
import '../_widgets/buttons/button.dart';
import '../_widgets/menu/menu_item.dart';
import '../_widgets/others/color_item.dart';
import '../_widgets/others/others/divider.dart';
import '../_widgets/others/text.dart';
import 'colors.dart';
import 'helpers.dart';
import 'spacing.dart';
import 'styler.dart';
import 'variables.dart';

List<Widget> themeMenu() {
  Map<String, ColorObject> themeColors = {...backgroundColors};
  themeColors.removeWhere((key, value) => !value.isTheme);

  return [
    //
    MenuItem(label: 'Choose theme', smallHeight: true, popTrailing: true),
    tph(),
    //
    GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: tinyWidth(),
      crossAxisSpacing: tinyWidth(),
      crossAxisCount: 2,
      childAspectRatio: 2.8,
      children: List.generate(themeImages.length, (index) {
        String themeImage = themeImages.keys.toList()[index];
        String themeType = themeImages[themeImage] ?? 'light';
        Color color = themeType == 'light' ? black : white;
        bool isImage = !['light', 'dark', 'black'].contains(themeImage);
        bool isDark = ['dark'].contains(themeImage);
        bool isBlack = ['black'].contains(themeImage);

        return AppButton(
          onPressed: () => popWhatsOnTop(todoLast: () => state.theme.setThemeImage(themeImage, themeType, state.theme.themeAccent)),
          noStyling: true,
          padding: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusTiny),
              image: isImage ? DecorationImage(image: AssetImage(getThemeImage(themeImage)), fit: BoxFit.cover) : null,
              border: Border.all(color: themeImage == state.theme.themeImage ? styler.borderColor() : transparent),
              color: isBlack ? black : (isDark ? AppColors.darkPrimary : white),
            ),
            child: Center(
              child: AppText(
                size: small,
                text: '${themeImage.substring(0, 1).toUpperCase()}${themeImage.substring(1)}',
                color: color,
              ),
            ),
          ),
        );
      }),
    ),
    //
    AppDivider(height: mediumHeight()),
    //
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
  ];
}
