import 'package:flutter/material.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';
import '../../../methods/globals.dart';
import '../../../models/colors.dart';
import '../../../methods/ble.dart';
import '../../theme/theme.dart';
import '../dialogs/color_list_dialog.dart';
import '../toast/toast.dart';

Widget buttonColorCard(BuildContext context, int index) {
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
            return colorDialogList(context);
          },
        ).then((value) async {
          if (value != null) {
            try {
              sendDataToDevice("kc$index$value");
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
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent, // background (button) color
          foregroundColor: themeColors[global.themeNo], // foreground (text) color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      child: Column(
        children: [
          numberedCircle(index+1),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(int.parse(buttonColors[index].replaceAll("0x", "0xff"))),
                ),
              ),
            ),
          ),
        ],
      ));
}
