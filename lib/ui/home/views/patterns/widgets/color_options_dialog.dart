import 'package:flutter/material.dart';

import '../../../../../models/colors.dart';
import '../../../../../theme/theme.dart';
import '../../colors/widgets/color_circle.dart';
import 'card_pattern_color.dart';

void showColorDialogList(BuildContext context) {
  List<ColorObject> colorList2 = colorList.toList();
  colorList2.removeWhere((element) => element.title == 'Black');

  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              const ColorCircle("c"),
              SizedBox(height: 20),
              GridView.count(
                  crossAxisCount: 5,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: List.generate(colorList2.length, (index) {
                    return patternColorCard(context, color: colorList2[index]);
                  })),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
