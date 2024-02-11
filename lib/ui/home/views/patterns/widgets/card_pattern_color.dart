// Color widget
import 'package:flutter/material.dart';

import '../../../../../ble/ble_service.dart';
import '../../../../../common_variables/state_providers.dart';
import '../../../../../models/colors.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widgets/other_widgets.dart';

Widget patternColorCard(BuildContext context, {required ColorObject color}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          bleService.sendMessageToDevice("c${color.hex}");
          // commandWatch.updateSelected("c${color.hex}");
        },
        // onLongPress: () {
        //   commandWatch.addToFavorite("color", color.hex);
        // },
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
