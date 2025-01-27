import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../_helpers/navigation.dart';
import '../../../_services/hive/boxes.dart';
import '../../../_theme/spacing.dart';
import '../navbars/navbar_vertical.dart';

class Panel extends StatelessWidget {
  const Panel({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: globalBox.listenable(keys: ['showPanelOptions']),
        builder: (c, box, w) {
          return Container(
            width: showPanelOptions() ? 200 : null,
            height: double.maxFinite,
            margin: padM('rtb'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                lph(),
                VeticalNavigationBox(),
                //
              ],
            ),
          );
        });
  }
}
