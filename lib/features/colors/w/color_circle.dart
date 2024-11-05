// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';

import '../../../_providers/_providers.dart';
import '../../../_theme/spacing.dart';
import '../../ble/ble_service.dart';
import 'color_circle_lib.dart';

CircleColorPickerController controller = CircleColorPickerController();

class ColorCircle extends StatefulWidget {
  const ColorCircle(this.start, {super.key});
  final String start;

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
          bleService.sendMessageToDevice("${widget.start}${color.value.toRadixString(16).substring(2)}");
        },
        onEnded: (color) {
          if (widget.start.startsWith("0x")) {
            state.hub.setEffect("0x${color.value.toRadixString(16).substring(2)}");
          }
        },
        size: const Size(230, 230),
        strokeWidth: 15,
        thumbSize: 30,
        initialColor: Colors.amber,
      ),
    );
  }
}
