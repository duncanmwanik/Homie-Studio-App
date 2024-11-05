import 'package:flutter/material.dart';

import '../_providers/_providers.dart';
import 'colors.dart';
import 'helpers.dart';
import 'variables.dart';

class AppColors {
  static const Color accent = Colors.red;

  static const Color darkPrimary = Color(0xff1b1d1c);
  static const Color lightPrimary = Color(0xffffffff);

  static const Color darkSecondary = Color(0xff272829);
  static const Color lightSecondary = Color(0xfffcfcfd);

  static const Color darkTertiary = Color(0xff383a39);
  static const Color lightTertiary = Color(0xffdfdfdf);

  static Color lightHover = Colors.grey.withOpacity(0.2);
  static Color darkHover = Colors.grey.withOpacity(0.1);

  static const Color darkText = Colors.white;
  static const Color lightText = Color(0xff333333);

  static Color darkTextFaded = Colors.white.withOpacity(0.7);
  static Color lightTextFaded = const Color(0xff333333).withOpacity(0.8);

  static Color darkTextExtraFaded = Colors.white.withOpacity(0.3);
  static Color lightTextExtraFaded = const Color(0xff333333).withOpacity(0.4);

  static const Color darkDividerColor = Colors.white12;
  static const Color lightDividerColor = Colors.black12;

  static const Color darkBottomNavBarColor = Color(0xff2f2f2f);
  static const Color lightBottomNavBarColor = Color(0xfff7f7f7);

  static Color textSelectionColor = accent.withOpacity(0.3);
}

class AppStyles {
  bool isDark = false;
  Color accent = backgroundColors[state.theme.themeAccent]!.color;

  void initialize(bool value) {
    isDark = value;
    accent = backgroundColors[state.theme.themeAccent]!.color;
  }

  // -------------------------- Primary Colors
  Color accentColor([double? opacity]) {
    return accent.withOpacity((opacity ?? 10) / 10);
  }

  Color primaryColor() {
    return isDark
        ? isBlack()
            ? Colors.black
            : AppColors.darkPrimary
        : AppColors.lightPrimary;
  }

  Color secondaryColor() {
    return isDark ? AppColors.darkSecondary : AppColors.lightSecondary;
  }

  Color tertiaryColor() {
    return isDark ? AppColors.darkTertiary : AppColors.lightTertiary;
  }

  Color navColor() {
    return isImage()
        ? transparent
        : isBlack()
            ? black
            : isDark
                ? AppColors.darkPrimary
                : AppColors.lightPrimary;
  }

  Color appColor(double weight) {
    return Colors.grey.withOpacity(weight / 10);
  }

  // -------------------------- Text Colors

  Color textColor({bool faded = false, bool extraFaded = false, String? bgColor}) {
    if (hasColour(bgColor)) {
      return AppColors.lightText;
    } else {
      if (extraFaded) return isDark ? AppColors.darkTextExtraFaded : AppColors.lightTextExtraFaded;
      if (faded) return isDark ? AppColors.darkTextFaded : AppColors.lightTextFaded;
      return isDark ? AppColors.darkText : AppColors.lightText;
    }
  }

  Color invertedTextColor() => isDark ? AppColors.lightText : AppColors.darkText;

  // -------------------------- Other Colors

  Color borderColor() => styler.appColor(isDark ? 1 : 1.5);

  // -------------------------- Borders

  Color? getItemColor([String? bgColor]) {
    return isImage()
        ? white.withOpacity(0.1)
        : isBlack()
            ? transparent
            : isDark
                ? styler.appColor(0.5)
                : transparent;
  }

  Color? getItemBgColor(String? bgColor, bool isShade) {
    if (bgColor != null && bgColor.isNotEmpty) {
      return isShade ? backgroundColors[bgColor]!.shadeColor : backgroundColors[bgColor]!.color;
    } else {
      return isImage()
          ? white.withOpacity(0.1)
          : isBlack()
              ? transparent
              : isDark
                  ? styler.appColor(0.5)
                  : transparent;
    }
  }
}
