import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_models/effect.dart';
import '../../_providers/_providers.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/others/text.dart';
import '../ble/ble_service.dart';
import '../hub/state/hub.dart';

class MusicItem extends StatelessWidget {
  const MusicItem({super.key, required this.effect});

  final Effect effect;

  @override
  Widget build(BuildContext context) {
    return Consumer<HubProvider>(builder: (context, hub, widget) {
      bool isSelected = effect.code == hub.selectedEffect;

      return AppButton(
        onPressed: () {
          state.hub.setEffect(effect.code);
          bleService.sendData(effect.code);
        },
        blur: true,
        width: 100,
        padding: EdgeInsets.all(10),
        color: isSelected ? styler.accentColor(8) : null,
        child: AppText(text: effect.title, textAlign: TextAlign.center),
      );
    });
  }
}
