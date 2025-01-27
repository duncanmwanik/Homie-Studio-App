import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_providers/theme.dart';
import '../../../_providers/views.dart';
import '../../../_theme/breakpoints.dart';
import '../../../_theme/variables.dart';
import '../../../_variables/features.dart';
import '../../../_widgets/buttons/planet.dart';
import 'nav_item.dart';

class HorizontalNavigationBox extends StatelessWidget {
  const HorizontalNavigationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isSmallPC(),
      child: Consumer2<ViewsProvider, ThemeProvider>(builder: (context, views, theme, child) {
        return Planet(
          blur: true,
          padding: noPadding,
          height: 48,
          color: styler.primaryColor(),
          radius: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(child: NavItem(features.colors)),
              Flexible(child: NavItem(features.patterns)),
              Flexible(child: NavItem(features.music)),
              Flexible(child: NavItem(features.mixer)),
              Flexible(child: NavItem(features.favorites)),
            ],
          ),
        );
      }),
    );
  }
}
