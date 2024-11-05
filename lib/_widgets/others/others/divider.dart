import 'package:flutter/material.dart';

import '../../../_theme/variables.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.thickness, this.color, this.height});

  final double? thickness;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? styler.borderColor(),
      thickness: thickness ?? 1,
      height: height ?? 0,
    );
  }
}
