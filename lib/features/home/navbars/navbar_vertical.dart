import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../_providers/views.dart';
import '../../../_services/hive/local_storage_service.dart';
import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_variables/features.dart';
import 'nav_item.dart';

class VeticalNavigationBox extends StatelessWidget {
  const VeticalNavigationBox({super.key, required this.isCollapsed});

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingBox.listenable(),
        builder: (context, box, widget) {
          //
          return Consumer<ViewsProvider>(builder: (context, views, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                navItem(colorsIcon, feature.colors),
                mph(),
                navItem(patternsIcon, feature.patterns),
                mph(),
                navItem(musicIcon, feature.music),
                mph(),
                navItem(mixerIcon, feature.mixer),
                mph(),
                navItem(favoritesIcon, feature.favorites),
                Spacer(),
                //
              ],
            );
          });
        });
  }
}
