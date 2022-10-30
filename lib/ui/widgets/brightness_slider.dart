import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:provider/provider.dart';

Widget brightnessSlider() {
  return Visibility(
    visible: true,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: deco,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Flexible(
            flex: 1,
            child: Icon(
              Icons.brightness_7_rounded,
              size: 20,
              color: Colors.white,
            ),
          ),
          Consumer<GlobalModel>(builder: (context, global, child) {
            return Flexible(
              flex: 9,
              child: Slider(
                activeColor: themeColor,
                inactiveColor: Colors.white10,
                label: "${global.brightness ~/ 2.55}%",
                divisions: 100,
                value: global.brightness.toDouble(),
                onChanged: (value) {
                  global.updateBrightness(value.toInt());
                },
                min: 0,
                max: 255,
              ),
            );
          }),
        ],
      ),
    ),
  );
}
