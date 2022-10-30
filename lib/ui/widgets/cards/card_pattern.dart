// Pattern widget
import 'package:flutter/material.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/objects/patterns.dart';
import 'package:homie_ble/models/style.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';

Widget patternCard({required PatternObject pattern}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          sendDataToDevice(pattern.code);
          globalWatch.updateSelected(pattern.code);
        },
        onLongPress: () {
          globalWatch.addToFavorite("pattern", pattern.code);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: themeColor,
            padding: EdgeInsets.zero,
            minimumSize: const Size(double.infinity, double.infinity),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: Text(
          pattern.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      selectedOptionDot(pattern.code)
    ],
  );
}
