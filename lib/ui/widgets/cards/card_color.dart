// Color widget
import 'package:flutter/material.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/objects/colors.dart';
import 'package:homie_ble/models/style.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';

Widget colorCard({required ColorObject color}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          sendDataToDevice(color.hex);
          globalWatch.updateSelected(color.hex);
        },
        onLongPress: () {
          globalWatch.addToFavorite("color", color.hex);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color.color,
            foregroundColor: themeColor,
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
