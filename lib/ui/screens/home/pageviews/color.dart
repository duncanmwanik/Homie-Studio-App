import 'package:flutter/material.dart';

import '../../../../models/colors.dart';
import '../../../../methods/globals.dart';
import '../../../theme/theme.dart';
import '../../../widgets/cards/card_color.dart';
import '../../../widgets/color_circle/color_circle.dart';
import '../../../widgets/other_widgets.dart';

Widget colorOptions() {
  return Column(
    children: [
      // ************************** COLOR CIRCLE ************************************
      const ColorCircle(),

      // ************************** MAIN COLORS *************************************
      title("MAIN COLORS"),

      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: deco,
        child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: List.generate(colorList.length, (index) {
              return colorCard(color: colorList[index]);
            })),
      ),

      SizedBox(
        height: h * 0.1,
      ),
    ],
  );
}
