import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/theme_state.dart';

Widget themeOption(int value, Color color) {
  return Consumer<ThemeModel>(
      builder: (context, theme, child) => ElevatedButton(
            onPressed: (() => theme.updateThemeColor(value)),
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
            child: Visibility(visible: theme.selectedTheme == value, child: Icon(Icons.done_rounded)),
          ));
}
