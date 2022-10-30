import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:provider/provider.dart';

Widget speedSelector() {
  return Consumer<GlobalModel>(builder: (context, global, child) {
    Widget optionButton(int value, String label) {
      return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ElevatedButton(
            onPressed: () {
              global.updateSpeed(value);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: global.speed == value ? Colors.amber : Colors.black26,
                foregroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, color: global.speed == value ? Colors.black : Colors.white),
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
      decoration: deco,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          optionButton(0, "Slow"),
          optionButton(1, "Normal"),
          optionButton(2, "Fast"),
        ],
      ),
    );
  });
}
