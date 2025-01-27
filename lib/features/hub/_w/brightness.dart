import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_theme/breakpoints.dart';
import '../../../_theme/spacing.dart';
import '../../ble/ble_service.dart';
import '../state/hub.dart';
import 'slider.dart';

class BrightnessSlider extends StatelessWidget {
  const BrightnessSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HubProvider>(builder: (context, hub, child) {
      return AppSlider(
        icon: Icons.light_mode,
        value: hub.brightness.toDouble(),
        secondaryValue: 0,
        onChanged: (value) {
          hub.setBrightness(value.toInt());
          bleService.sendData('b${value.toInt()}');
        },
        min: 0,
        max: 100,
        labels: ['0%', '100%'],
        margin: isSmallPC() ? padM('t') : padT('t'),
      );
    });
  }
}
