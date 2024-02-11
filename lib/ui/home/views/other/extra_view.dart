import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common_variables/globals.dart';
import '../../../../state/ble_state.dart';
import '../../../../widgets/other_widgets.dart';

class ExtraOptions extends StatelessWidget {
  const ExtraOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BleProvider>(builder: (context, ble, child) {
      return Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          children: [
            infoText("----- Will get Purpose -----"),
            SizedBox(
              height: h * 0.1,
            ),
          ],
        ),
      );
    });
  }
}
