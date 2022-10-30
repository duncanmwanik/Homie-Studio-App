import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:homie_ble/models/objects/patterns.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';

Widget patternDialogList(BuildContext context) {
  return SizedBox(
    width: w * 0.8,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: titleText("Select a pattern..."),
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
              children: List.generate(patternList.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, patternList[index].code);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: themeColor,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  child: Text(
                    patternList[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                );
              })),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
