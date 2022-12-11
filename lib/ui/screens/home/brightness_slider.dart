import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/globals.dart';
import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';

Widget brightnessSlider() {
  return Consumer<GlobalModel>(
      builder: (context, g, child) => Visibility(
            visible: g.selectedPage != 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: deco,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.brightness_7_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Slider(
                      activeColor: themeColors[global.themeNo],
                      inactiveColor: Colors.white10,
                      label: "${g.brightness}0%",
                      value: g.brightness.toDouble(),
                      onChanged: (value) {
                        g.updateBrightness(value.toInt());
                      },
                      onChangeEnd: (value) {
                        print(value);
                        sendDataToDevice("b${value.toInt()}");
                      },
                      min: 0,
                      max: 10,
                    ),
                  ),
                ],
              ),
            ),
          ));
}
