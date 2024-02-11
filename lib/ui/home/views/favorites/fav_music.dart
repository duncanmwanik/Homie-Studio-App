import 'package:flutter/material.dart';

import '../../../../common_variables/globals.dart';
import '../../../../common_variables/state_providers.dart';
import '../../../../widgets/other_widgets.dart';
import '../../../../models/music.dart';
import '../../../../logic/commands_logic.dart';
import '../../../../theme/theme.dart';

Widget favoriteMusic() {
  return commandWatch.favoriteMusicList.isNotEmpty
      ? Container(
          margin: EdgeInsets.only(
            top: 10,
            bottom: h * 0.1,
          ),
          padding: const EdgeInsets.all(10),
          decoration: deco,
          child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: List.generate(commandWatch.favoriteMusicList.length, (index) {
                return Stack(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        sendCommandToDevice(commandWatch.favoriteMusicList[index]);
                      },
                      onLongPress: () {
                        commandWatch.removeFromFavorite("music", commandWatch.favoriteMusicList[index]);
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
                        musicMap[commandWatch.favoriteMusicList[index]]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    selectedOptionDot(commandWatch.favoriteMusicList[index])
                  ],
                );
              })),
        )
      : emptyFavList("music vu");
}
