import 'package:flutter/material.dart';

import '../../../../common_variables/globals.dart';
import '../../../../models/music.dart';
import '../../../../theme/theme.dart';
import 'widgets/card_music.dart';
import '../../../../widgets/other_widgets.dart';
import 'widgets/sensitivity_options.dart';

class MusicOptions extends StatelessWidget {
  const MusicOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title("MUSIC", null),
        sensitivitySlider(),
        Container(
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
              children: List.generate(musicList.length, (index) {
                return musicCard(music: musicList[index]);
              })),
        ),
      ],
    );
  }
}
