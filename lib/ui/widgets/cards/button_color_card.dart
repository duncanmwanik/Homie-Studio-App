import 'package:flutter/material.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:homie_ble/models/objects/colors.dart';
import 'package:homie_ble/ui/widgets/dialogs/color_list_dialog.dart';

Widget buttonColorCard(BuildContext context, int index) {
  return ElevatedButton(
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          backgroundColor: const Color(0xff202020),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return colorDialogList(context);
          },
        ).then((value) async {
          if (value != null) {
            try {
              sendDataToDevice(value);
              notifyUser(1, "Success! Key updated.");
            } catch (e) {
              print(e);
              notifyUser(0, "Failed to set Key value!");
            }
          }
        });
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white, // background (button) color
          foregroundColor: themeColor, // foreground (text) color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "${index + 1}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
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
