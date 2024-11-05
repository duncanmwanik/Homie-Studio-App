import 'package:flutter/material.dart';

import '../../../_helpers/extentions/strings.dart';
import '../../../_providers/_providers.dart';
import '../../../_theme/breakpoints.dart';
import '../../../_theme/helpers.dart';
import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/button.dart';
import '../../../_widgets/others/icons.dart';
import '../../../_widgets/others/text.dart';
import '../_helpers/go_to_view.dart';

Widget navItem(dynamic icon, String type, {double? size, Function()? onPressed}) {
  bool isSelected = state.views.view == type;
  bool faded = !isSelected && !isDark();
  bool extraFaded = !isSelected && isDark();

  return AppButton(
    onPressed: onPressed ?? () => goToView(type),
    tooltipDirection: isSmallPC() ? AxisDirection.right : AxisDirection.up,
    noStyling: !isSelected,
    radius: borderRadiusCrazy,
    color: styler.appColor(isDark() ? 1 : 2),
    padding: pad(c: 'l12,r12,t8,b8'),
    leading: AppIcon(icon, size: size ?? 15, faded: faded, extraFaded: extraFaded),
    content: AppText(text: type.cap(), size: small, weight: FontWeight.w500, faded: faded, extraFaded: extraFaded),
  );
}
