import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_models/effect.dart';
import '../../_providers/_providers.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/others/text.dart';
import '../ble/ble_service.dart';

class PatternItem extends StatelessWidget {
  const PatternItem({super.key, required this.effect});

  final Effect effect;

  @override
  Widget build(BuildContext context) {
    bool isSelected = effect.code == state.hub.selectedEffect;

    return AppButton(
      onPressed: () {
        state.hub.setEffect(effect.code);
        bleService.sendMessageToDevice(effect.code);
      },
      width: isPhone() ? 30.w : 150,
      padding: EdgeInsets.all(10),
      color: isSelected ? styler.accentColor(3) : null,
      child: AppText(text: effect.title, textAlign: TextAlign.center),
    );
  }
}
