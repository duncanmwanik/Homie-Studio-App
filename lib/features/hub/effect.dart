import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_helpers/extentions/strings.dart';
import '../../_models/effect.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_variables/features.dart';
import '../../_widgets/buttons/planet.dart';
import '../../_widgets/others/icons.dart';
import '../../_widgets/others/text.dart';
import '../ble/ble_service.dart';
import 'state/hub.dart';

class EffectItem extends StatelessWidget {
  const EffectItem({
    super.key,
    required this.type,
    required this.effect,
  });

  final String type;
  final Effect effect;

  @override
  Widget build(BuildContext context) {
    return Consumer<HubProvider>(builder: (context, hub, widget) {
      bool isSelected = effect.code == hub.selectedEffect;

      return Planet(
        onPressed: () {
          hub.setEffect(effect.code);
          bleService.sendData(effect.code);
        },
        height: 45,
        width: isPhone() ? 30.w : 130,
        padding: padT(),
        color: type.isColors()
            ? effect.code.color()
            : isSelected
                ? styler.accentColor()
                : null,
        child: Stack(
          children: [
            //
            if (!type.isColors())
              Center(
                child: AppText(
                  effect.title,
                  padding: padT(),
                  textAlign: TextAlign.center,
                ),
              ),
            //
            if (type.isColors() && isSelected)
              Align(
                alignment: Alignment.topLeft,
                child: AppIcon(
                  Icons.check_circle,
                  color: isSelected
                      ? type.isColors()
                          ? black
                          : null
                      : transparent,
                  size: small,
                ),
              ),
            //
            if (isSelected)
              Align(
                alignment: Alignment.topRight,
                child: Planet(
                  onPressed: () {},
                  isRound: true,
                  noStyling: true,
                  padding: padT(),
                  child: AppIcon(
                    Icons.favorite_outline,
                    size: small,
                    color: isSelected
                        ? type.isColors()
                            ? black
                            : null
                        : transparent,
                  ),
                ),
              )
            //
          ],
        ),
      );
    });
  }
}
