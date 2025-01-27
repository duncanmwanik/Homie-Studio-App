import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_theme/spacing.dart';
import '../../ble/ble_service.dart';
import '../state/hub.dart';
import 'slider.dart';

class SensitivitySlider extends StatelessWidget {
  const SensitivitySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HubProvider>(builder: (context, hub, child) {
      return AppSlider(
        icon: Icons.hearing,
        value: hub.sensitivity.toDouble(),
        secondaryValue: 0,
        onChanged: (value) {
          hub.setSensitivity(value.toInt());
          bleService.sendData('z${value.toInt()}');
        },
        min: 0,
        max: 4,
        labels: ['-3x', '-2x', 'Normal', '2x', '3x'],
        margin: padM('t'),
      );
    });
  }
}
