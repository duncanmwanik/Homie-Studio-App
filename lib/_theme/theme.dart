import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styler.dart';
import 'variables.dart';

class AppTheme {
  static ThemeData themeData(bool isDark) {
    return ThemeData(
      primaryColor: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      scaffoldBackgroundColor: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      cardColor: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      canvasColor: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      shadowColor: isDark ? AppColors.darkTextFaded : AppColors.lightTextFaded,
      hintColor: isDark ? AppColors.darkTextFaded : AppColors.lightTextFaded,
      highlightColor: isDark ? AppColors.darkHover : AppColors.lightHover,
      hoverColor: isDark ? AppColors.darkHover : AppColors.lightHover,
      focusColor: isDark ? AppColors.darkHover : AppColors.lightHover,
      disabledColor: isDark ? AppColors.darkTextFaded : AppColors.lightTextFaded,
      dialogTheme: const DialogTheme(elevation: 0),
      timePickerTheme: TimePickerThemeData(
        elevation: 0,
        backgroundColor: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
        helpTextStyle: GoogleFonts.inter(fontSize: small, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadiusMedium)),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: extra,
          color: isDark ? AppColors.darkText : AppColors.lightText,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: isDark ? AppColors.darkBottomNavBarColor : AppColors.lightBottomNavBarColor,
        elevation: isDark ? 1 : 6,
        foregroundColor: isDark ? AppColors.lightPrimary : AppColors.darkPrimary,
      ),
      dividerTheme: DividerThemeData(
        color: isDark ? AppColors.darkDividerColor : AppColors.lightDividerColor,
      ),
      // fontFamily: 'Inter',
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.textSelectionColor,
        selectionHandleColor: AppColors.accent,
        cursorColor: AppColors.accent,
      ),
      iconTheme: IconThemeData(
        color: isDark ? AppColors.darkText : AppColors.lightText,
      ),
      tooltipTheme: TooltipThemeData(
        verticalOffset: 30,
        textStyle: GoogleFonts.inter(color: Colors.black),
        decoration: BoxDecoration(
          color: AppColors.lightTertiary,
          borderRadius: BorderRadius.circular(borderRadiusTiny),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 1.5)],
        ),
      ),
      primaryIconTheme: IconThemeData(color: isDark ? AppColors.lightTextFaded : AppColors.darkTextFaded),
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }
}
