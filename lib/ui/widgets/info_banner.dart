import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/ble.dart';

Widget notConnectedBanner() {
  return Consumer<BleModel>(builder: (context, ble, child) {
    return Visibility(
      visible: !ble.btState,
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
        color: Colors.red,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Icon(
            Icons.warning_rounded,
            color: Colors.white,
            size: 22,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              "Bluetooth is Off",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  });
}
