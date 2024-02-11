import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'package:provider/provider.dart';

import '../state/theme_state.dart';

Widget backButton(BuildContext context) {
  return Consumer<ThemeModel>(
      builder: (context, theme, child) => IconButton(
          onPressed: () => Navigator.pop(context),
          splashRadius: 20,
          icon: Icon(
            Icons.cancel,
            color: themeColors[theme.selectedTheme],
          )));
}
