import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_providers/views.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/spacing.dart';
import '../../_theme/theme_btn.dart';
import '../../_theme/variables.dart';
import '../../_widgets/others/others/sync_indicator.dart';
import '../hub/_w/device_panel.dart';
import '../settings/w/settings_btn.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewsProvider>(builder: (context, views, child) {
      return Padding(
        padding: pad(c: isTabAndBelow() ? 'l8,r8,t4,b4' : 'l8,r8,t2,b2'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            Container(
              padding: padS(),
              decoration: BoxDecoration(
                color: isSmallPC() ? null : styler.appColor(0.5),
                borderRadius: BorderRadius.circular(borderRadiusTiny),
              ),
              child: Row(
                children: [
                  //
                  DevicePanel(),
                  Spacer(),
                  Row(
                    children: [
                      spw(),
                      CloudSyncIndicator(),
                      ThemeButton(),
                      SettingsButton(),
                    ],
                  ),
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
