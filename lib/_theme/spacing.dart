import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../_helpers/global.dart';

// ---------- paddings
EdgeInsets padSL([String sides = 'ltrb']) => pad(s: sides, p: 32);
EdgeInsets padL([String sides = 'ltrb']) => pad(s: sides, p: 16);
EdgeInsets padN([String sides = 'ltrb']) => pad(s: sides, p: 12);
EdgeInsets padM([String sides = 'ltrb']) => pad(s: sides, p: 8);
EdgeInsets padMS([String sides = 'ltrb']) => pad(s: sides, p: 6);
EdgeInsets padS([String sides = 'ltrb']) => pad(s: sides, p: 4);
EdgeInsets padT([String sides = 'ltrb']) => pad(s: sides, p: 2);

EdgeInsets pad({String? c, String s = 'ltrb', double p = 12, double? l, double? t, double? r, double? b}) {
  List pads = splitList(c, separator: ',');

  double check(String side) {
    return double.tryParse(pads.firstWhere((pad) => pad.startsWith(side), orElse: () => '00').substring(1)) ?? 0;
  }

  return c != null
      ? EdgeInsets.only(left: check('l'), top: check('t'), right: check('r'), bottom: check('b'))
      : EdgeInsets.only(
          left: l ?? (s.contains('l') ? p : 0),
          top: t ?? (s.contains('t') ? p : 0),
          right: r ?? (s.contains('r') ? p : 0),
          bottom: b ?? (s.contains('b') ? p : 0),
        );
}

// ---------- widths
double largeWidth() => 32;
double mediumWidth() => 16;
double mediumSmallWidth() => 12;
double smallWidth() => 8;
double tinyWidth() => 4;

// ---------- heights
double largeHeightPlaceHolder() => 15.h;
double smallHeightPlaceHolder() => 10.h;
double extraLargeHeight() => 48;
double largeHeight() => 32;
double mediumHeight() => 16;
double mediumSmallHeight() => 12;
double smallHeight() => 8;
double tinySmallHeight() => 6;
double tinyHeight() => 4;

// ---------- quick sized boxes
// heights
Widget ph(double height) => SizedBox(height: height);
Widget tph() => SizedBox(height: tinyHeight());
Widget sph() => SizedBox(height: smallHeight());
Widget tsph() => SizedBox(height: tinySmallHeight());
Widget msph() => SizedBox(height: mediumSmallHeight());
Widget mph() => SizedBox(height: mediumHeight());
Widget lph() => SizedBox(height: largeHeight());
Widget elph() => SizedBox(height: extraLargeHeight());
Widget spph() => SizedBox(height: smallHeightPlaceHolder());
Widget lpph() => SizedBox(height: largeHeightPlaceHolder());
// widths
Widget pw(double width) => SizedBox(width: width);
Widget tpw() => SizedBox(width: tinyWidth());
Widget spw() => SizedBox(width: smallWidth());
Widget mspw() => SizedBox(width: mediumSmallWidth());
Widget mpw() => SizedBox(width: mediumWidth());
Widget lpw() => SizedBox(width: largeWidth());
