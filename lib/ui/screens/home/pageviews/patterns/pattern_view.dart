import 'package:flutter/material.dart';

import '../../../../../models/patterns.dart';
import '../../../../../methods/globals.dart';
import '../../../../theme/theme.dart';
import 'card_pattern.dart';
import '../../../../widgets/other_widgets.dart';
import 'speed_options.dart';

Widget patternOptions(BuildContext context) {
  return Column(
    children: [
      title("PATTERNS", null),
      speedSelector(),
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
            children: List.generate(patternList.length, (index) {
              return patternCard(pattern: patternList[index]);
            })),
      ),
      SizedBox(
        height: h * 0.1,
      ),
    ],
  );
}
