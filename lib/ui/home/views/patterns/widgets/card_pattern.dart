// Pattern widget
import 'package:flutter/material.dart';
import '../../../../../common_variables/state_providers.dart';
import '../../../../../logic/commands_logic.dart';
import '../../../../../models/patterns.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widgets/other_widgets.dart';

Widget patternCard({required PatternObject pattern}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          sendCommandToDevice(pattern.code);
        },
        onLongPress: () {
          addToFavorite("pattern", pattern.code);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: themeColors[themeWatch.selectedTheme],
            padding: const EdgeInsets.symmetric(horizontal: 1),
            minimumSize: const Size(double.infinity, double.infinity),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: Text(
          pattern.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      selectedOptionDot(pattern.code)
    ],
  );
}
