// Pattern widget
import 'package:flutter/material.dart';
import '../../../models/patterns.dart';
import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../other_widgets.dart';

Widget patternCard({required PatternObject pattern}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          sendDataToDevice(pattern.code);
          global.updateSelected(pattern.code);
        },
        onLongPress: () {
          global.addToFavorite("pattern", pattern.code);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: themeColors[global.themeNo],
            padding: const EdgeInsets.symmetric(horizontal: 1),
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
