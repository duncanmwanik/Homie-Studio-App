import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ble/ble_service.dart';
import '../../../common_variables/state_providers.dart';
import '../../../state/commands_state.dart';
import '../../../theme/theme.dart';

class DeviceBrightnessSlider extends StatelessWidget {
  const DeviceBrightnessSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommandModel>(builder: (context, command, child) {
      return Visibility(
        visible: globalWatch.selectedView != 4,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: deco,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  command.updateBrightness(0);
                  bleService.sendMessageToDevice("b0");
                },
                child: Icon(Icons.brightness_5_rounded, size: 20, color: Colors.white),
              ),
              Expanded(
                child: Slider(
                  activeColor: themeColors[themeWatch.selectedTheme],
                  inactiveColor: Colors.white10,
                  label: "${command.brightness}%",
                  value: command.brightness.toDouble(),
                  onChanged: (value) {
                    command.updateBrightness(value.toInt());
                    bleService.sendMessageToDevice("b$value");
                  },
                  min: 0,
                  max: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  command.updateBrightness(100);
                  bleService.sendMessageToDevice("b100");
                },
                child: Icon(Icons.brightness_7_rounded, size: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    });
  }
}
