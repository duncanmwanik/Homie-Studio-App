import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/planet.dart';
import 'icons.dart';
import 'text.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({
    super.key,
    this.label = 'Nothing here...',
    this.centered = true,
    this.showImage = true,
    this.onPressed,
    this.padding,
    this.size,
  });

  final String label;
  final bool centered;
  final bool showImage;
  final double? size;
  final EdgeInsets? padding;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var column = Padding(
      padding: padding ?? noPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          if (showImage) AppIcon(FontAwesomeIcons.ghost, size: size ?? 10.h, faded: true).animate().shake(),
          if (showImage) mph(),
          //
          Planet(
            onPressed: onPressed,
            noStyling: true,
            radius: borderRadiusLarge,
            child: AppText(label, faded: true),
          ),
          //
        ],
      ).animate().fadeIn(),
    );
    return centered ? Center(child: column) : column;
  }
}
