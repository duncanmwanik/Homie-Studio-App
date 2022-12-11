// Color widget
import 'package:flutter/material.dart';

import '../../../../../models/colors.dart';
import '../../../../../methods/ble.dart';
import '../../../../../methods/globals.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/other_widgets.dart';

Widget patternColorCard(BuildContext context,{required ColorObject color}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          sendDataToDevice("c${color.hex}");
          global.updateSelected("c${color.hex}");
          Navigator.pop(context);
        },
        onLongPress: () {
          global.addToFavorite("color", color.hex);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color.color,
            foregroundColor: themeColors[global.themeNo],
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
