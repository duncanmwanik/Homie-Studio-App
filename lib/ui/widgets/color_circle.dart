import 'package:flutter/material.dart';
import 'package:homie_ble/color_picker/flutter_circle_color_picker.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';

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
      child: Stack(
        children: [
          // Button to favorite a custom hex input color or hex from color picker
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: IconButton(
                  onPressed: () async {
                    if (globalWatch.selected.startsWith("0x")) {
                      globalWatch.addToFavorite("color", globalWatch.selected);
                    } else {
                      notifyUser(2, "Select a color from the circle!");
                    }
                  },
                  icon: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          ),

          CircleColorPicker(
            controller: colorCircleController,
            onChanged: (color) {
              setState(() {
                colorCircleController.color = color;
              });
            },
            onEnded: (color) {
              // print(color);
              globalWatch.updateSelected("0x${color.value.toRadixString(16).substring(2)}");
              sendDataToDevice("0x${color.value.toRadixString(16).substring(2)}");
            },
            size: const Size(230, 230),
            strokeWidth: 6,
            thumbSize: 30,
            initialColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}
