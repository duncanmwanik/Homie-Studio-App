import 'package:flutter/material.dart';

import '../../../_providers/_providers.dart';
import '../../../_theme/spacing.dart';
import '../../../_theme/theme_menu.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/button.dart';
import '../../../_widgets/others/icons.dart';
import '../../../_widgets/others/text.dart';
import 'title.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        SettingTitle('THEME'),
        sph(),
        //
        AppButton(
          menuWidth: 300, // TODO: a must for some reason
          menuItems: themeMenu(),
          leading: AppText(text: '${state.theme.themeImage.substring(0, 1).toUpperCase()}${state.theme.themeImage.substring(1)}'),
          trailing: AppIcon(Icons.keyboard_arrow_right_rounded, size: normal),
          expand: true,
          color: styler.appColor(0.7),
          height: 35,
        ),
        //
      ],
    );
  }
}
