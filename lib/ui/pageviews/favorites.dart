import 'package:flutter/material.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/objects/music.dart';
import 'package:homie_ble/models/objects/patterns.dart';
import 'package:homie_ble/models/style.dart';
import 'package:homie_ble/ui/widgets/other_widgets.dart';
import 'package:provider/provider.dart';

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
          titleText("COLORS"),

          global.favColors.isNotEmpty
              ? Container(
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
                      children: List.generate(global.favColors.length, (index) {
                        return Stack(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                sendDataToDevice(global.favColors[index]);
                                globalWatch.updateSelected(global.favColors[index]);
                              },
                              onLongPress: () {
                                global.removeFromFavorite("color", global.favColors[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(int.parse(global.favColors[index].replaceAll("0x", "0xff"))),
                                  foregroundColor: themeColor,
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
          titleText("PATTERNS"),
          global.favPatterns.isNotEmpty
              ? Container(
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
                      children: List.generate(global.favPatterns.length, (index) {
                        return Stack(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                sendDataToDevice(global.favPatterns[index]);
                                globalWatch.updateSelected(global.favPatterns[index]);
                              },
                              onLongPress: () {
                                globalWatch.removeFromFavorite("pattern", global.favPatterns[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: themeColor,
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
          titleText("MUSIC"),

          global.favMusic.isNotEmpty
              ? Container(
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
                      children: List.generate(global.favMusic.length, (index) {
                        return Stack(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                sendDataToDevice(global.favMusic[index]);
                                globalWatch.updateSelected(global.favMusic[index]);
                              },
                              onLongPress: () {
                                global.removeFromFavorite("music", global.favMusic[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: themeColor,
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
        ],
      ),
    );
  });
}
