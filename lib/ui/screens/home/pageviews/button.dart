import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/colors.dart';
import '../../../../models/music.dart';
import '../../../../models/patterns.dart';
import '../../../../state/ble.dart';
import '../../../../methods/globals.dart';
import '../../../theme/theme.dart';
import '../../../widgets/cards/button_color_card.dart';
import '../../../widgets/cards/button_music_card.dart';
import '../../../widgets/cards/button_pattern_card.dart';
import '../../../widgets/other_widgets.dart';

Widget buttonAssignment() {
  return Consumer<BleModel>(builder: (context, ble, child) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: ble.connected
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20, right: 20, left: 20),
                  child: Text(
                    baDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white38,
                    ),
                  ),
                ),

                //------------------------ COLORS
                title("COLORS"),

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: deco,
                  child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 15.0,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(buttonColors.length, (index) {
                        return buttonColorCard(context, index);
                      })),
                ),

                //------------------------ PATTERNS
                title("PATTERNS"),

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: deco,
                  child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 15.0,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(buttonPatterns.length, (index) {
                        return buttonPatternCard(context, index);
                      })),
                ),

                //------------------------ VU
                title("MUSIC"),

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: deco,
                  child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 15.0,
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
