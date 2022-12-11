import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../state/ble.dart';
import '../../../../../methods/globals.dart';
import '../../../../widgets/other_widgets.dart';


Widget buttonAssignment() {
  return Consumer<BleModel>(builder: (context, ble, child) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: ble.connected
          ? Column(
              children: [
                infoText(baDescription),
                SizedBox(
                  height: h * 0.1,
                ),
              ],
            )
          : notConnected(),
    );
  });
}
