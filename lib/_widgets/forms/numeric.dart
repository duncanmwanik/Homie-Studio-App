import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';

class NumericFormInput extends StatelessWidget {
  const NumericFormInput(
      {super.key,
      required this.onChanged,
      this.initialValue,
      this.hintText,
      this.maxLength,
      this.focusNode,
      this.bgColor,
      this.textColor,
      this.fontSize,
      this.borderRadius,
      this.padding});

  final Function(String)? onChanged;
  final String? initialValue;
  final String? hintText;
  final int? maxLength;
  final FocusNode? focusNode;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: padding ?? padM('lr'),
      decoration: BoxDecoration(
        color: bgColor ?? styler.appColor(1),
        borderRadius: BorderRadius.circular(borderRadius ?? borderRadiusTiny),
      ),
      alignment: Alignment.center,
      child: IntrinsicWidth(
        child: TextFormField(
          onChanged: onChanged,
          focusNode: focusNode,
          initialValue: initialValue,
          maxLength: maxLength,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: fontSize ?? medium, color: textColor ?? styler.textColor(), fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hintText ?? 'No',
            hintStyle: GoogleFonts.inter(fontSize: fontSize ?? medium, color: styler.textColor(faded: true), fontWeight: FontWeight.w400),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(borderRadiusLarge)),
            counterStyle: GoogleFonts.inter(height: double.minPositive),
            counterText: '',
          ),
        ),
      ),
    );
  }
}
