import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_providers/views.dart';
import '../../../_variables/features.dart';
import 'nav_item.dart';

class VeticalNavigationBox extends StatelessWidget {
  const VeticalNavigationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewsProvider>(builder: (context, views, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          NavItem(features.colors),
          NavItem(features.patterns),
          NavItem(features.music),
          NavItem(features.mixer),
          NavItem(features.favorites),
          //
        ],
      );
    });
  }
}
