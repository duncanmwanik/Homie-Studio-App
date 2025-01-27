import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../_providers/theme.dart';
import 'variables.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    this.fit,
    required this.child,
  });

  final BoxFit? fit;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // background color
        Consumer<ThemeProvider>(
          builder: (context, theme, child) {
            return Container(color: styler.primaryColor());
          },
        ),

        // content
        child
        //
      ],
    );
  }
}
