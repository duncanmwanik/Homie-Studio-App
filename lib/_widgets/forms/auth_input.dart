import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_theme/helpers.dart';
import '../../_theme/variables.dart';
import '../buttons/button.dart';
import '../others/icons.dart';
import '../others/loader.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.isBusy = false,
    this.onFieldSubmitted,
    this.onPressed,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool isBusy;
  final Function(String)? onFieldSubmitted;
  final Function()? onPressed;

  @override
  State<FormInput> createState() => _EmailFormInputState();
}

class _EmailFormInputState extends State<FormInput> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    bool isPassword = widget.keyboardType == TextInputType.visiblePassword;
    bool showButton = widget.onPressed != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        // AppButton(
        //   noStyling: true,
        //   svp: true,
        //   padding: pad('l4,b4'),
        //   child: AppText(text: widget.hintText, size: tinySmall, extraFaded: true),
        // ),
        //z
        AppButton(
          color: white,
          height: 34,
          noStyling: true,
          showBorder: true,
          borderWidth: isDark() ? 0.4 : 0.8,
          hoverColor: styler.appColor(0.3),
          radius: borderRadiusTiny,
          padding: const EdgeInsets.all(3),
          child: TextFormField(
            controller: widget.controller,
            autofocus: widget.autofocus,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            onFieldSubmitted: widget.onFieldSubmitted,
            textInputAction: widget.textInputAction,
            obscureText: isPassword && hidePassword,
            style: GoogleFonts.inter(fontSize: medium),
            cursorColor: styler.accentColor(),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(fontSize: medium),
              errorStyle: GoogleFonts.inter(fontSize: small, color: Colors.red),
              contentPadding: const EdgeInsets.only(left: 7, right: 7),
              border: InputBorder.none,
              isDense: true,
              suffixIcon: showButton || isPassword
                  ? AppButton(
                      onPressed: widget.onPressed ?? () => setState(() => hidePassword = !hidePassword),
                      noStyling: isPassword || widget.isBusy,
                      isSquare: true,
                      dryWidth: true,
                      radius: borderRadiusSuperTiny,
                      child: showButton
                          ? widget.isBusy
                              ? AppLoader(color: styler.accentColor())
                              : const AppIcon(Icons.arrow_forward, tiny: true)
                          : AppIcon(hidePassword ? Icons.visibility_rounded : Icons.visibility_off_rounded, faded: true, size: 16),
                    )
                  : null,
              suffixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
            ),
          ),
        ),
      ],
    );
  }
}
