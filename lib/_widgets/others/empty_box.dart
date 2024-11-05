import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_theme/spacing.dart';
import '../buttons/button.dart';
import 'icons.dart';
import 'text.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({
    super.key,
    this.label = 'Nothing here...',
    this.centered = true,
    this.icon,
    this.onPressed,
    this.size,
  });

  final String label;
  final bool centered;
  final IconData? icon;
  final double? size;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //
        if (icon != null) AppIcon(icon, size: size ?? 15.h, faded: true),
        if (icon != null) sph(),
        //
        AppButton(
          onPressed: onPressed,
          noStyling: onPressed == null,
          child: AppText(text: label, faded: true),
        ),
        //
      ],
    );
    return centered ? Center(child: column) : column;
  }
}
