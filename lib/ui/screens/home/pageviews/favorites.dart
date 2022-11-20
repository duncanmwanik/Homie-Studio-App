import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/music.dart';
import '../../../../models/patterns.dart';
import '../../../../state/globals.dart';
import '../../../../methods/ble.dart';
import '../../../../methods/globals.dart';
import '../../../theme/theme.dart';
import '../../../widgets/other_widgets.dart';

// ignore: must_be_immutable
Widget favoritesPage() {
  return Consumer<GlobalModel>(builder: (context, global, child) {
    return Container(
      constraints: BoxConstraints(
        minHeight: h * 0.7,
      ),
      child: Column(
        children: [
          // ----------- COLORS
          title("COLORS"),

          global.favColors.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: deco,
                  child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 6.0,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(global.favColors.length, (index) {
                        return Stack(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                sendDataToDevice(global.favColors[index]);
                                global.updateSelected(global.favColors[index]);
                              },
                              onLongPress: () {
                                global.removeFromFavorite("color", global.favColors[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(int.parse(global.favColors[index].replaceAll("0x", "0xff"))),
                                  foregroundColor: themeColors[global.themeNo],
                                  minimumSize: const Size(double.infinity, double.infinity),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                              child: null,
                            ),
                            selectedOptionDot(global.favColors[index])
                          ],
                        );
                      })),
                )
              : emptyFavList("colors"),

          // // ----------- PATTERNS
          title("PATTERNS"),
          global.favPatterns.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: deco,
                  child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 6.0,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(global.favPatterns.length, (index) {
                        return Stack(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                sendDataToDevice(global.favPatterns[index]);
                                global.updateSelected(global.favPatterns[index]);
                              },
                              onLongPress: () {
                                global.removeFromFavorite("pattern", global.favPatterns[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: themeColors[global.themeNo],
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(double.infinity, double.infinity),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                              child: Text(
                                patternsMap[global.favPatterns[index]]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            selectedOptionDot(global.favPatterns[index])
                          ],
                        );
                      })),
                )
              : emptyFavList("patterns"),

          // // ----------- VU
          title("MUSIC"),

          global.favMusic.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: deco,
                  child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 6.0,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: List.generate(global.favMusic.length, (index) {
                        return Stack(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                sendDataToDevice(global.favMusic[index]);
                                global.updateSelected(global.favMusic[index]);
                              },
                              onLongPress: () {
                                global.removeFromFavorite("music", global.favMusic[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: themeColors[global.themeNo],
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(double.infinity, double.infinity),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                              child: Text(
                                musicMap[global.favMusic[index]]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            selectedOptionDot(global.favMusic[index])
                          ],
                        );
                      })),
                )
              : emptyFavList("music vu"),

          SizedBox(
            height: h * 0.1,
          ),
        ],
      ),
    );
  });
}
