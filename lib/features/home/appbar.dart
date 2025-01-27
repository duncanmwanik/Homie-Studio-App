import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_providers/views.dart';
import '../../_theme/spacing.dart';
import '../../_widgets/buttons/planet.dart';
import '../hub/device_panel.dart';
import '../settings/settings_btn.dart';
import 'panel/toggle.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewsProvider>(builder: (context, views, child) {
      return Padding(
        padding: padC('l2,r2,t4,b4'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            Planet(
              padding: padS(),
              noStyling: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //
                  PanelToggle(),
                  DevicePanel(),
                  Spacer(),
                  SettingsButton(),
                  //
                ],
              ),
            ),
            //
          ],
        ),
      );
    });
  }
}
