import 'package:flutter/material.dart';
import 'package:homie_ble/methods/ble.dart';
import 'package:provider/provider.dart';

import '../../state/globals.dart';
import '../theme/theme.dart';

Widget speedSelector() {
  return Consumer<GlobalModel>(builder: (context, g, child) {
    Widget optionButton(int value, String label) {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: ElevatedButton(
          onPressed: () {
            g.updateSpeed(value);
            sendDataToDevice("s$value");
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: g.speed == value ? themeColors[g.themeNo] : Colors.black26,
              foregroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: g.speed == value ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ));
    }

    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      decoration: deco,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 5),
            child: Icon(
              Icons.directions_run_rounded,
              color: Colors.white,
            ),
          ),
          optionButton(0, "1"),
          optionButton(1, "2"),
          optionButton(2, "X"),
          optionButton(3, "3"),
          optionButton(4, "4"),
        ],
      ),
    );
  });
}
