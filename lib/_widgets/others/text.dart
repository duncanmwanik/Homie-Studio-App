import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

import '../../_theme/helpers.dart';
import '../../_theme/variables.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    this.size,
    required this.text,
    this.weight,
    this.overflow,
    this.color,
    this.textAlign,
    this.decoration,
    this.maxlines,
    this.faded = false,
    this.bold = false,
    this.extraFaded = false,
    this.bgColor,
    this.isCrossed = false,
  });

  final double? size;
  final String text;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  final TextDecoration? decoration;
  final int? maxlines;
  final bool bold;
  final bool faded;
  final bool extraFaded;
  final String? bgColor;
  final bool isCrossed;

  @override
  Widget build(BuildContext context) {
    return StyledText(
      text: text,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxlines,
      style: GoogleFonts.inter(
        fontSize: size ?? 13,
        fontWeight: weight ?? (bold ? FontWeight.bold : (isDark() ? FontWeight.w400 : FontWeight.w500)),
        color: color ?? styler.textColor(faded: faded, extraFaded: extraFaded, bgColor: bgColor),
        decoration: decoration ?? (isCrossed ? TextDecoration.lineThrough : null),
        decorationColor: styler.textColor(faded: faded, extraFaded: extraFaded, bgColor: bgColor),
      ),
      tags: {
        'b': StyledTextTag(
          style: GoogleFonts.inter(
            fontSize: size ?? 13,
            fontWeight: FontWeight.bold,
            color: color ?? styler.textColor(faded: faded, extraFaded: extraFaded, bgColor: bgColor),
            decoration: decoration ?? (isCrossed ? TextDecoration.lineThrough : null),
            decorationColor: styler.textColor(faded: faded, extraFaded: extraFaded, bgColor: bgColor),
          ),
        ),
      },
    );
  }
}
