import 'package:flutter/material.dart';

import '../../../../common_variables/state_providers.dart';
import '../../../../widgets/other_widgets.dart';
import '../../../../logic/commands_logic.dart';
import '../../../../models/patterns.dart';
import '../../../../theme/theme.dart';

Widget favoritePatterns() {
  return commandWatch.favoritePatternList.isNotEmpty
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
              children: List.generate(commandWatch.favoritePatternList.length, (index) {
                return Stack(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        sendCommandToDevice(commandWatch.favoritePatternList[index]);
                      },
                      onLongPress: () {
                        commandWatch.removeFromFavorite("pattern", commandWatch.favoritePatternList[index]);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: themeColors[themeWatch.selectedTheme],
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(double.infinity, double.infinity),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                      child: Text(
                        patternsMap[commandWatch.favoritePatternList[index]]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    selectedOptionDot(commandWatch.favoritePatternList[index])
                  ],
                );
              })),
        )
      : emptyFavList("patterns");
}
