import 'package:flutter/material.dart';

import '../../../../../methods/globals.dart';
import '../../../../../models/colors.dart';
import '../colors/color_circle/color_circle.dart';
import '../../../../theme/theme.dart';
import 'card_pattern_color.dart';

void showColorDialogList(BuildContext context) {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ColorCircle("c"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GridView.count(
                  crossAxisCount: 5,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: List.generate(colorList.length, (index) {
                    return patternColorCard(context, color: colorList[index]);
                  })),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: themeColors[global.themeNo],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
              child: const Text(
                'Done',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      );
    },
  );
}
