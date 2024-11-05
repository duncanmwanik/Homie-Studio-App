import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_providers/global.dart';
import '../../../_providers/views.dart';
import '../../../_theme/breakpoints.dart';
import '../../../_theme/spacing.dart';
import '../navbars/navbar_vertical.dart';

class Panel extends StatelessWidget {
  const Panel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ViewsProvider, GlobalProvider>(builder: (context, views, global, child) {
      bool showPanel = showPanelOptions();

      return Container(
        width: 150,
        margin: padM(),
        child: Column(
          crossAxisAlignment: showPanel ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            //
            elph(),
            Expanded(child: VeticalNavigationBox(isCollapsed: !showPanel)),
            //
          ],
        ),
      );
    });
  }
}
