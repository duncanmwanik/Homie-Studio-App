import 'package:flutter/material.dart';

import 'styler.dart';

AppStyles styler = AppStyles();

Map<String, String> themeImages = {
  'light': 'light',
  'dark': 'dark',
};

// sizes
const double webMaxWidth = 768.0;
const double webMaxDialogWidth = 400.0;

// text sizes
const double largeTitle = 24.0;
const double title = 22.0;
const double large = 20.0;
const double extra = 18.0;
const double normal = 16.0;
const double mediumNormal = 14.0;
const double medium = 14.0;
const double mediumSmall = 13.0;
const double small = 12.0;
const double tinySmall = 11.0;
const double tiny = 10.0;
const double superTiny = 9.0;

// border radius sizes
const double borderRadiusSuperTiny = 3.0;
const double borderRadiusTiny = 5.0;
const double borderRadiusTinySmall = 7.0;
const double borderRadiusSmall = 10.0;
const double borderRadiusMediumSmall = 15.0;
const double borderRadiusMedium = 20.0;
const double borderRadiusLarge = 30.0;
const double borderRadiusCrazy = 200.0;

// image sizes
const double imageSizeSmall = 80.0;

// global colors
const Color transparent = Colors.transparent;
const Color black = Colors.black;
const Color white = Colors.white;
const Color red = Colors.red;

const List<IconData> toastIcons = [Icons.info, Icons.check_circle, Icons.info, Icons.info];
const List<Color> toastColors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];

// icons
const IconData pinIcon = Icons.push_pin_rounded;
const IconData unpinIcon = Icons.push_pin_outlined;
const IconData archiveIcon = Icons.archive_outlined;
const IconData unarchiveIcon = Icons.unarchive_outlined;
const IconData labelIcon = Icons.label_outlined;
const IconData reminderIcon = Icons.notification_add_outlined;
const IconData colorIcon = Icons.palette_outlined;
const IconData moreIcon = Icons.more_horiz_rounded;
const IconData closeIcon = Icons.close_rounded;

const IconData deleteIcon = Icons.delete_outlined;
const IconData deleteForeverIcon = Icons.delete_forever_rounded;
const IconData restoreIcon = Icons.arrow_upward_rounded;

const EdgeInsets noPadding = EdgeInsets.zero;
const BorderRadius noRadius = BorderRadius.zero;

// fonts
const FontWeight ft1 = FontWeight.w100;
const FontWeight ft2 = FontWeight.w200;
const FontWeight ft3 = FontWeight.w300;
const FontWeight ft4 = FontWeight.w400;
const FontWeight ft5 = FontWeight.w500;
const FontWeight ft6 = FontWeight.w600;
const FontWeight ft7 = FontWeight.w700;
const FontWeight ft8 = FontWeight.w800;
const FontWeight ft9 = FontWeight.w900;
