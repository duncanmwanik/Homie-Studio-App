import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_providers/views.dart';
import '../../_theme/spacing.dart';
import '../../_theme/theme_btn.dart';
import '../../_widgets/others/others/sync_indicator.dart';
import '../hub/_w/device_panel.dart';
import '../settings/w/settings_btn.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewsProvider>(builder: (context, views, child) {
      return Container(
        margin: pad(c: 'l4,r4,t4'),
        padding: padS(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //
            DevicePanel(),
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
      );
    });
  }
}
