import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../_theme/variables.dart';

class AppSvg extends StatelessWidget {
  const AppSvg(
    this.path, {
    super.key,
    this.color,
    this.size,
    this.faded = false,
    this.extraFaded = false,
    this.bgColor,
  });

  final String path;
  final Color? color;
  final double? size;
  final bool faded;
  final bool extraFaded;
  final String? bgColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$path.svg',
      height: size ?? 12,
      width: size ?? 12,
      colorFilter: ColorFilter.mode(
        color ?? styler.textColor(faded: faded, extraFaded: extraFaded, bgColor: bgColor),
        BlendMode.srcIn,
      ),
    );
  }
}
