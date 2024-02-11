import 'package:flutter/material.dart';

import '../../../../common_variables/globals.dart';
import '../../../../models/colors.dart';
import '../../../../theme/theme.dart';
import 'widgets/card_color.dart';
import 'widgets/color_circle.dart';

class ColorOptions extends StatelessWidget {
  const ColorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------------------- COLOR CIRCLE
        const ColorCircle("0x"),

        // -------------------- MAIN COLORS
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.only(
            top: 10,
            bottom: h * 0.1,
          ),
          padding: const EdgeInsets.all(10),
          decoration: deco,
          child: GridView.count(
              crossAxisCount: 6,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: List.generate(colorList.length, (index) {
                return colorCard(color: colorList[index]);
              })),
        ),
      ],
    );
  }
}
