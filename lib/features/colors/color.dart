import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_models/effect.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/others/icons.dart';
import '../ble/ble_service.dart';
import '../hub/state/hub.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.effect});
  final Effect effect;

  @override
  Widget build(BuildContext context) {
    return Consumer<HubProvider>(builder: (context, hub, widget) {
      bool isSelected = effect.code == hub.selectedEffect;

      return AppButton(
        onPressed: () {
          hub.setEffect(effect.code);
          bleService.sendData(effect.code);
        },
        height: 40,
        width: 100,
        color: effect.color,
        child: AppIcon(Icons.check_circle,
            color: isSelected
                ? effect.title == 'White'
                    ? black
                    : white
                : transparent,
            size: normal),
      );
    });
  }
}
