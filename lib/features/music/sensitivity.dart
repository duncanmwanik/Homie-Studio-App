import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/others/icons.dart';
import '../ble/ble_service.dart';
import '../hub/state/hub.dart';

class SensitivitySlider extends StatelessWidget {
  const SensitivitySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HubProvider>(builder: (context, hub, child) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: webMaxWidth),
        child: Padding(
          padding: padSL('b'),
          child: Row(
            children: [
              AppIcon(Icons.speed, tiny: true, faded: true),
              Expanded(
                child: SizedBox(
                  height: 20,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2,
                      trackShape: RectangularSliderTrackShape(),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 11),
                    ),
                    child: Slider(
                      thumbColor: white,
                      activeColor: styler.accentColor(),
                      inactiveColor: styler.textColor(extraFaded: true),
                      value: hub.sensitivity.toDouble(),
                      onChanged: (value) => hub.setSensitivity(value.toInt()),
                      onChangeEnd: (value) => bleService.sendMessageToDevice('v${value.toInt()}'),
                      min: -2,
                      max: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
