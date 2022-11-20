import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../back_button.dart';

Widget colorDialogList(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        backButton(context),
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
                      foregroundColor: themeColors[global.themeNo], // foreground (text) color
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
