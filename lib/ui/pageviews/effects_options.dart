import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/objects/patterns.dart';
import 'package:homie_ble/models/objects/music.dart';
import 'package:homie_ble/ui/widgets/cards/card_pattern.dart';
import 'package:homie_ble/ui/widgets/cards/card_music.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';
import 'package:homie_ble/ui/widgets/speed_options.dart';

Widget effectOptions() {
  return Column(
    children: [
      // ****************************** SPEED ***************************************
      speedSelector(),

      // *************************** PATTERNS ***************************************

      titleText("PATTERNS"),

      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white10,
            boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
        child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: List.generate(patternList.length, (index) {
              return patternCard(pattern: patternList[index]);
            })),
      ),

      // **************************  MUSIC VU ***************************************
      // ****************************************************************************

      titleText("MUSIC"),

      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white10,
            boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
        child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: List.generate(musicList.length, (index) {
              return musicCard(music: musicList[index]);
            })),
      ),

      SizedBox(
        height: h * 0.1,
      ),
    ],
  );
}
