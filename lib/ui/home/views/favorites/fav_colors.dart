import 'package:flutter/material.dart';

import '../../../../common_variables/state_providers.dart';
import '../../../../widgets/other_widgets.dart';
import '../../../../logic/commands_logic.dart';
import '../../../../theme/theme.dart';

Widget favoriteColors() {
  return commandWatch.favoriteColorList.isNotEmpty
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
              children: List.generate(commandWatch.favoriteColorList.length, (index) {
                return Stack(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        sendCommandToDevice(commandWatch.favoriteColorList[index]);
                      },
                      onLongPress: () {
                        commandWatch.removeFromFavorite("color", commandWatch.favoriteColorList[index]);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(int.parse(commandWatch.favoriteColorList[index].replaceAll("0x", "0xff"))),
                          foregroundColor: themeColors[themeWatch.selectedTheme],
                          minimumSize: const Size(double.infinity, double.infinity),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                      child: null,
                    ),
                    selectedOptionDot(commandWatch.favoriteColorList[index])
                  ],
                );
              })),
        )
      : emptyFavList("colors");
}
