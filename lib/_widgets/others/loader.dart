import 'package:flutter/material.dart';

import '../../_theme/variables.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.size = 18, this.stroke = 2.5, this.color});

  final double size;
  final double stroke;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              color: color ?? styler.appColor(2),
              strokeWidth: stroke,
            )),
      ],
    );
  }
}
