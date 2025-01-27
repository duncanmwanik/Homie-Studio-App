import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_variables/constants.dart';
import '../buttons/planet.dart';
import '../others/icons.dart';

class DataInput extends StatefulWidget {
  const DataInput({
    super.key,
    this.controller,
    this.inputKey = itemTitle,
    this.parentKey = '',
    required this.hintText,
    this.initialValue,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.minLines = 1,
    this.maxLines,
    this.autofocus = false,
    this.enabled = true,
    this.isDense = true,
    this.filled = true,
    this.showBorder = false,
    this.isNumerals = false,
    this.isPassword = false,
    this.notify = true,
    this.color,
    this.textColor,
    this.cursorColor,
    this.hoverColor,
    this.bgColor,
    this.weight = ft4,
    this.contentPadding,
    this.margin,
    this.fontSize = medium,
    this.borderRadius = borderRadiusTiny,
    this.prefix,
    this.suffix,
  });

  final TextEditingController? controller;
  final String inputKey;
  final String parentKey;
  final String hintText;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onTap;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final int minLines;
  final int? maxLines;
  final bool autofocus;
  final bool enabled;
  final bool isDense;
  final bool filled;
  final bool showBorder;
  final bool isNumerals;
  final bool isPassword;
  final bool notify;
  final Color? color;
  final Color? textColor;
  final Color? cursorColor;
  final Color? hoverColor;
  final String? bgColor;
  final FontWeight weight;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsets? margin;
  final double fontSize;
  final double borderRadius;
  final Widget? prefix;
  final Widget? suffix;

  @override
  State<DataInput> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Planet(
      margin: widget.margin ?? noPadding,
      padding: noPadding,
      noStyling: true,
      showBorder: widget.showBorder,
      borderColor: styler.appColor(1.5),
      child: TextFormField(
        mouseCursor: widget.enabled ? null : SystemMouseCursors.click,
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTapOutside: widget.onTapOutside,
        onTap: widget.onTap,
        obscureText: widget.isPassword && !showPassword,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        initialValue: widget.initialValue,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        inputFormatters: widget.isNumerals ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))] : null,
        style: GoogleFonts.inter(
            fontSize: widget.fontSize, color: widget.textColor ?? styler.textColor(bgColor: widget.bgColor), fontWeight: widget.weight),
        textAlignVertical: TextAlignVertical.center,
        cursorColor: widget.cursorColor ?? styler.accentColor(),
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: widget.contentPadding,
          hintStyle: GoogleFonts.inter(
              fontSize: widget.fontSize,
              color: widget.textColor ?? styler.textColor(faded: true, bgColor: widget.bgColor),
              fontWeight: widget.weight),
          isDense: widget.isDense,
          filled: widget.filled,
          fillColor: widget.color ?? styler.appColor(0.1),
          focusColor: widget.color ?? styler.appColor(0.1),
          hoverColor: widget.hoverColor ?? styler.appColor(0.1),
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(widget.borderRadius)),
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix ??
              (widget.isPassword
                  ? Planet(
                      onPressed: () => setState(() => showPassword = !showPassword),
                      noStyling: true,
                      isSquare: true,
                      margin: padC('r3'),
                      child: AppIcon(
                        showPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                        faded: true,
                      ),
                    )
                  : null),
          suffixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
        ),
      ),
    );
  }
}
