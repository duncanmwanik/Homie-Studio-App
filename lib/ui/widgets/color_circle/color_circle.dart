import 'package:flutter/material.dart';

import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import 'color_circle_lib.dart';

class ColorCircle extends StatefulWidget {
  const ColorCircle({super.key});

  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CircleColorPicker(
        controller: colorCircleController,
        onChanged: (color) {
          setState(() {
            colorCircleController.color = color;
          });
        },
        onEnded: (color) {
          global.updateSelected("0x${color.value.toRadixString(16).substring(2)}");
          sendDataToDevice("0x${color.value.toRadixString(16).substring(2)}");
        },
        size: const Size(230, 230),
        strokeWidth: 6,
        thumbSize: 30,
        initialColor: Colors.amber,
      ),
    );
  }
}
