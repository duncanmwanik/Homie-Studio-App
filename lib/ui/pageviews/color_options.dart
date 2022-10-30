import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/objects/colors.dart';
import 'package:homie_ble/ui/widgets/cards/card_color.dart';
import 'package:homie_ble/ui/widgets/color_circle.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';

Widget colorOptions() {
  return Column(
    children: [
      // ************************** COLOR CIRCLE ************************************
      // colorCircle(),
      const ColorCircle(),

      // ************************** MAIN COLORS *************************************
      titleText("MAIN COLORS"),

      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white10,
            boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
        child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: List.generate(colorList.length, (index) {
              return colorCard(color: colorList[index]);
            })),
      ),

      SizedBox(
        height: h * 0.025,
      ),
    ],
  );
}
