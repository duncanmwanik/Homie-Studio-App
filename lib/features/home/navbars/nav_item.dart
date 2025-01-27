import 'package:flutter/material.dart';

import '../../../_helpers/extentions/dynamic.dart';
import '../../../_helpers/extentions/strings.dart';
import '../../../_helpers/navigation.dart';
import '../../../_models/menu.dart';
import '../../../_providers/_providers.dart';
import '../../../_theme/breakpoints.dart';
import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_variables/features.dart';
import '../../../_widgets/buttons/planet.dart';
import '../../../_widgets/others/icons.dart';
import '../../../_widgets/others/text.dart';
import '../_helpers/go_to_view.dart';

class NavItem extends StatelessWidget {
  const NavItem(
    this.type, {
    super.key,
    this.icon,
    this.menu,
    this.onPressed,
  });

  final String type;
  final IconData? icon;
  final Menu? menu;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    bool isSelected = state.views.view == type;

    return Planet(
      menu: menu,
      onPressed: menu.isNotNull() ? null : onPressed ?? () => goToView(type),
      tooltipDirection: isSmallPC() ? AxisDirection.right : AxisDirection.up,
      tooltip: showPanelOptions() ? null : type.cap(),
      noStyling: !isSelected,
      color: isSmallPC() ? styler.accentColor(2) : transparent,
      margin: isSmallPC() ? padS('b') : null,
      padding: isSmallPC() ? padC('l15,r6,t6,b6') : padMS('t'),
      radius: isSmallPC() ? borderRadiusLarge : null,
      height: isSmallPC() ? null : 48,
      borderRadius: isSmallPC()
          ? BorderRadius.only(
              topRight: Radius.circular(borderRadiusLarge),
              bottomRight: Radius.circular(borderRadiusLarge),
            )
          : null,
      child: Center(
        child: isSmallPC()
            ? Row(
                children: [
                  AppIcon(
                    icon ?? type.icon(),
                    size: 19,
                    faded: !isSelected,
                  ),
                  //
                  if (showPanelOptions())
                    Expanded(
                      child: AppText(
                        type.cap(),
                        padding: padMN('l'),
                      ),
                    ),
                  //
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // icon
                  AppIcon(
                    icon ?? type.icon(),
                    size: 19,
                    color: isSelected && !isSmallPC() ? styler.accentColor() : null,
                    faded: !isSelected,
                  ),
                  //
                  if (showPanelOptions())
                    Expanded(
                      child: AppText(
                        type.cap(),
                        size: isSmallPC() ? null : small,
                        color: isSelected && !isSmallPC() ? styler.accentColor() : null,
                        padding: padT('t'),
                      ),
                    ),
                  //
                ],
              ),
      ),
    );
  }
}
