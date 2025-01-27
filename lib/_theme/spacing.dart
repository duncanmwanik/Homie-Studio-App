import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../_helpers/global.dart';
import '../_variables/constants.dart';

// ---------- paddings
EdgeInsets padSL([String sides = 'ltrb']) => pad(s: sides, p: 48);
EdgeInsets padEL([String sides = 'ltrb']) => pad(s: sides, p: 32);
EdgeInsets padL([String sides = 'ltrb']) => pad(s: sides, p: 16);
EdgeInsets padN([String sides = 'ltrb']) => pad(s: sides, p: 12);
EdgeInsets padMN([String sides = 'ltrb']) => pad(s: sides, p: 10);
EdgeInsets padM([String sides = 'ltrb']) => pad(s: sides, p: 8);
EdgeInsets padMS([String sides = 'ltrb']) => pad(s: sides, p: 6);
EdgeInsets padS([String sides = 'ltrb']) => pad(s: sides, p: 4);
EdgeInsets padT([String sides = 'ltrb']) => pad(s: sides, p: 2);

EdgeInsets padC(String custom) {
  List pads = splitList(custom);
  double check(String side) {
    return double.tryParse(pads.firstWhere((pad) => pad.startsWith(side), orElse: () => '00').substring(1)) ?? 0;
  }

  return EdgeInsets.only(left: check('l'), top: check(itemTitle), right: check('r'), bottom: check('b'));
}

EdgeInsets pad({String s = 'ltrb', double p = 12, double? l, double? t, double? r, double? b}) {
  return EdgeInsets.only(
    left: l ?? (s.contains('l') ? p : 0),
    top: t ?? (s.contains(itemTitle) ? p : 0),
    right: r ?? (s.contains('r') ? p : 0),
    bottom: b ?? (s.contains('b') ? p : 0),
  );
}

// ---------- widths
double largeWidth() => 32;
double mediumWidth() => 16;
double mediumSmallWidth() => 12;
double smallWidth() => 8;
double tinySmallWidth() => 6;
double tinyWidth() => 4;

// ---------- heights
double largeHeightPlaceHolder() => 15.h;
double smallHeightPlaceHolder() => 10.h;
double extraLargeHeight() => 48;
double largeHeight() => 32;
double mediumLargeHeight() => 24;
double mediumHeight() => 16;
double mediumSmallHeight() => 12;
double smallHeight() => 8;
double tinySmallHeight() => 6;
double tinyHeight() => 4;

// ---------- quick sized boxes
// heights
Widget ph(double height) => SizedBox(height: height);
Widget tph() => ph(tinyHeight());
Widget sph() => ph(smallHeight());
Widget tsph() => ph(tinySmallHeight());
Widget msph() => ph(mediumSmallHeight());
Widget mph() => ph(mediumHeight());
Widget mlph() => ph(mediumLargeHeight());
Widget lph() => ph(largeHeight());
Widget elph() => ph(extraLargeHeight());
Widget spph() => ph(smallHeightPlaceHolder());
Widget lpph() => ph(largeHeightPlaceHolder());
// widths
Widget pw(double width) => SizedBox(width: width);
Widget tpw() => pw(tinyWidth());
Widget tspw() => pw(tinySmallWidth());
Widget spw() => pw(smallWidth());
Widget mspw() => pw(mediumSmallWidth());
Widget mpw() => pw(mediumWidth());
Widget lpw() => pw(largeWidth());
