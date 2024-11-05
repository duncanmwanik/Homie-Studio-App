import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../_providers/theme.dart';
import '../../../_providers/views.dart';
import '../../../_services/hive/local_storage_service.dart';
import '../../../_theme/variables.dart';
import '../../../_variables/features.dart';
import 'nav_item.dart';

class HorizontalNavigationBox extends StatelessWidget {
  const HorizontalNavigationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingBox.listenable(),
        builder: (context, box, widget) {
          return Consumer2<ViewsProvider, ThemeProvider>(builder: (context, views, theme, child) {
            return Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: styler.navColor()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //
                  navItem(colorsIcon, feature.colors),
                  navItem(patternsIcon, feature.patterns),
                  navItem(musicIcon, feature.music),
                  navItem(mixerIcon, feature.mixer),
                  navItem(favoritesIcon, feature.favorites),
                  //
                ],
              ),
            );
          });
        });
  }
}
