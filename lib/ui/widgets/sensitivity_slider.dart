import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:provider/provider.dart';

Widget sensitivitySlider() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: deco,
    child: Consumer<GlobalModel>(builder: (context, global, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Flexible(
            flex: 1,
            child: Icon(
              Icons.fire_extinguisher,
              size: 20,
              color: Colors.white,
            ),
          ),
          Flexible(
            flex: 9,
            child: Slider(
              activeColor: Colors.amber,
              inactiveColor: Colors.white10,
              label: "${global.sensitivity ~/ 2.55}%",
              divisions: 100,
              value: global.sensitivity.toDouble(),
              onChanged: (value) {
                global.updateSensitivity(value.toInt());
              },
              onChangeEnd: (value) {},
              min: 0,
              max: 255,
            ),
          ),
        ],
      );
    }),
  );
}
