import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_providers/theme.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/close.dart';
import '../../_widgets/others/others/about_app.dart';
import '../../_widgets/others/others/scroll.dart';
import '../../_widgets/others/text.dart';
import '../../_widgets/sheets/bottom_sheet.dart';
import 'w/account_details.dart';
import 'w/account_support.dart';
import 'w/theme_settings.dart';

Future<void> showSettingsBottomSheet() async {
  await showAppBottomSheet(
      isFull: true,
      title: 'Settings',
      header: Consumer<ThemeProvider>(
        builder: (context, theme, child) => Row(
          children: [
            AppCloseButton(isX: false),
            spw(),
            Expanded(child: AppText(text: 'Settings', size: normal)),
            spw(),
            AppCloseButton(),
          ],
        ),
      ),
      //
      content: Consumer<ThemeProvider>(
        builder: (context, theme, child) => ConstrainedBox(
          constraints: BoxConstraints(maxWidth: webMaxWidth),
          child: NoScrollBars(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //
                  sph(),
                  AccountDetails(),
                  mph(),
                  ThemeSettings(),
                  mph(),
                  AccountSupport(),
                  AboutApp(),
                  //
                ],
              ),
            ),
          ),
        ),
      ));
}
