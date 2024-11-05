import 'package:flutter/material.dart';

import '../../_providers/_providers.dart';
import '../../_theme/helpers.dart';
import '../../_theme/variables.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isImage() ? transparent : (isBlack() ? black : styler.primaryColor()),
        image: isImage()
            ? DecorationImage(
                image: AssetImage(getThemeImage(state.theme.themeImage)),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child,
    );
  }
}
