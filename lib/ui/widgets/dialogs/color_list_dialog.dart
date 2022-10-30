import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:homie_ble/models/objects/colors.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';

Widget colorDialogList(BuildContext context) {
  return SizedBox(
    width: w * 0.8,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: titleText("Select a color..."),
            ),
            IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            )
          ],
        ),
        Expanded(
          child: GridView.count(
              crossAxisCount: 5,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: List.generate(colorList.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, colorList[index].hex);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorList[index].color, // background (button) color
                      foregroundColor: themeColor, // foreground (text) color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  child: null,
                );
              })),
        ),
      ],
    ),
  );
}
