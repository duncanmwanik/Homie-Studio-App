import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_theme/spacing.dart';
import '../../ble/ble_service.dart';
import '../state/hub.dart';
import 'slider.dart';

class SpeedSlider extends StatelessWidget {
  const SpeedSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HubProvider>(builder: (context, hub, child) {
      return AppSlider(
        icon: Icons.bolt,
        value: hub.speed.toDouble(),
        secondaryValue: 0,
        onChanged: (value) {
          hub.setSpeed(value.toInt());
          bleService.sendData('d${value.toInt()}');
        },
        min: 0,
        max: 4,
        labels: ['-3x', '-2x', 'Normal', '2x', '3x'],
        margin: padM('t'),
      );
    });
  }
}
