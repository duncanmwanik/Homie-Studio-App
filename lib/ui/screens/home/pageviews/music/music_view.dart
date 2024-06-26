import 'package:flutter/material.dart';

import '../../../../../models/music.dart';
import '../../../../../methods/globals.dart';
import '../../../../theme/theme.dart';
import 'card_music.dart';
import '../../../../widgets/other_widgets.dart';
import 'sensitivity_options.dart';

Widget musicOptions(BuildContext context) {
  return Column(
    children: [
      title("MUSIC", null),
      sensitivitySlider(),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: deco,
        child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
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
