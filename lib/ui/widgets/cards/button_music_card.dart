import 'package:flutter/material.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:homie_ble/models/objects/music.dart';
import 'package:homie_ble/ui/widgets/dialogs/music_list_dialog.dart';

Widget buttonVuCard(BuildContext context, int index) {
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
            return musicDialogList(context);
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
          backgroundColor: Colors.white,
          foregroundColor: themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
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
                decoration: const BoxDecoration(
                  color: Color(0xff202020),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    musicMap[buttonMusic[index]]!,
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
