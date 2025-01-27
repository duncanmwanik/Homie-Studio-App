import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../_helpers/navigation.dart';
import '../../_services/hive/boxes.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_variables/constants.dart';
import '../others/loader.dart';
import '../others/text.dart';
import 'planet.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, this.label, this.onPressed, this.isCancel = false, this.enabled = true, this.radius});

  final String? label;
  final Function()? onPressed;
  final bool isCancel;
  final bool enabled;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: globalBox.listenable(keys: [appBusy]),
      builder: (context, box, child) {
        bool isBusy = box.get(appBusy, defaultValue: false);

        return Planet(
          enabled: !isBusy,
          onPressed: enabled ? onPressed ?? () => popWhatsOnTop() : null,
          margin: padS('l'),
          svp: true,
          radius: radius ?? borderRadiusLarge,
          color: isCancel ? styler.appColor(enabled ? 1 : 0.4) : styler.accentColor(enabled ? 8 : 2),
          child: isBusy && !isCancel
              ? AppLoader(color: white)
              : AppText(
                  label ?? (isCancel ? 'Cancel' : 'Done'),
                  size: small,
                  extraFaded: !enabled,
                ),
        );
      },
    );
  }
}
