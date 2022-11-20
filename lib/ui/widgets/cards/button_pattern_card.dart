import 'package:flutter/material.dart';
import '../../../methods/globals.dart';
import '../../../models/patterns.dart';
import '../../../methods/ble.dart';
import '../../theme/theme.dart';
import '../dialogs/pattern_list_dialog.dart';
import '../other_widgets.dart';
import '../toast/toast.dart';

Widget buttonPatternCard(BuildContext context, int index) {
  return ElevatedButton(
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          backgroundColor: const Color(0xff202020),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          builder: (BuildContext context) {
            return patternDialogList(context);
          },
        ).then((value) async {
          if (value != null) {
            try {
              sendDataToDevice("kp$index$value");
              buttonPatterns[index] = value;
              toast(1, "Success! Key updated.");
            } catch (e) {
              print(e);
              toast(0, "Failed to set Key value!");
            }
          }
        });
      },
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent, // background (button) color
          foregroundColor: themeColors[global.themeNo], // foreground (text) color
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          )),
      child: Column(
        children: [
          numberedCircle(index + 1),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    patternsMap[buttonPatterns[index]]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}
