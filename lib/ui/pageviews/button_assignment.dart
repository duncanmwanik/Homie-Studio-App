import 'package:flutter/material.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/objects/colors.dart';
import 'package:homie_ble/models/objects/patterns.dart';
import 'package:homie_ble/models/objects/music.dart';
import 'package:homie_ble/ui/widgets/cards/button_color_card.dart';
import 'package:homie_ble/ui/widgets/cards/button_pattern_card.dart';
import 'package:homie_ble/ui/widgets/cards/button_music_card.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';
import 'package:provider/provider.dart';

Widget buttonAssignment() {
  return Consumer<BleModel>(builder: (context, ble, child) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: ble.connected
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    "Change the colors or effects your remote keys will show!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                //------------------------ COLORS
                titleText("COLORS"),

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10,
                      boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
                  child: GridView.count(
                      crossAxisCount: 5,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(buttonColors.length, (index) {
                        return buttonColorCard(context, index);
                      })),
                ),

                //------------------------ PATTERNS
                titleText("PATTERNS"),

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10,
                      boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
                  child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(buttonPatterns.length, (index) {
                        return buttonPatternCard(context, index);
                      })),
                ),

                //------------------------ VU
                titleText("MUSIC"),

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10,
                      boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
                  child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(buttonMusic.length, (index) {
                        return buttonVuCard(context, index);
                      })),
                ),

                SizedBox(
                  height: h * 0.1,
                ),
              ],
            )
          : notConnected(),
    );
  });
}
