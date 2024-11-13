// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';

import '../../../_providers/_providers.dart';
import '../../../_theme/spacing.dart';
import '../../ble/ble_service.dart';
import 'color_circle_lib.dart';

CircleColorPickerController controller = CircleColorPickerController();

class ColorCircle extends StatefulWidget {
  const ColorCircle({super.key});

  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padL('tb'),
      child: CircleColorPicker(
        controller: controller,
        onChanged: (color) {
          setState(() {
            controller.color = color;
          });
          bleService.sendData("0x${color.value.toRadixString(16).substring(2)}");
        },
        onEnded: (color) {
          state.hub.setEffect("0x${color.value.toRadixString(16).substring(2)}");
        },
        size: const Size(230, 230),
        strokeWidth: 2,
        thumbSize: 30,
        initialColor: Colors.amber,
      ),
    );
  }
}
