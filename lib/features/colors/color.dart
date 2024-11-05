import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_models/effect.dart';
import '../../_providers/_providers.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/others/icons.dart';
import '../ble/ble_service.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.effect});
  final Effect effect;

  @override
  Widget build(BuildContext context) {
    bool isSelected = effect.code == state.hub.selectedEffect;

    return AppButton(
      onPressed: () {
        state.hub.setEffect(effect.code);
        bleService.sendMessageToDevice(effect.code);
      },
      height: 50,
      width: isPhone() ? 30.w : 100,
      color: effect.color,
      child: AppIcon(Icons.circle, color: isSelected ? white : transparent, size: small),
    );
  }
}
