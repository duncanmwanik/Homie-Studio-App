import 'package:flutter/material.dart';

import '../../../../../models/colors.dart';
import '../../../../../methods/globals.dart';
import '../../../../../models/segments.dart';
import '../../../../theme/theme.dart';
import 'card_color.dart';
import 'card_segment.dart';
import '../../../../widgets/other_widgets.dart';
import 'color_circle/color_circle.dart';

Widget colorOptions(BuildContext context) {
  return Column(
    children: [
      // ************************** COLOR CIRCLE ************************************
      const ColorCircle("0x"),

      // ************************** MAIN COLORS *************************************
      title("MAIN COLORS", null),

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
      title("SEGMENTS", null),
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
            children: List.generate(segmentsMap.length, (index) {
              return segmentCard(context: context, segments: segmentsMap.keys.toList()[index]);
            })),
      ),

      SizedBox(
        height: h * 0.1,
      ),
    ],
  );
}
