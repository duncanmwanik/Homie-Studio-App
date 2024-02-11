// Color widget
import 'package:flutter/material.dart';

import '../../../../../common_variables/state_providers.dart';
import '../../../../../logic/commands_logic.dart';
import '../../../../../models/colors.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widgets/other_widgets.dart';

Widget colorCard({required ColorObject color}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          sendCommandToDevice(color.hex);
        },
        onLongPress: () {
          addToFavorite("color", color.hex);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color.color,
            foregroundColor: themeColors[themeWatch.selectedTheme],
            minimumSize: const Size(double.infinity, double.infinity),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: null,
      ),
      selectedOptionDot(color.hex),
    ],
  );
}
