import 'package:flutter/material.dart';

import '../../../../common_variables/globals.dart';
import '../../../../models/patterns.dart';
import '../../../../theme/theme.dart';
import 'widgets/card_pattern.dart';
import 'widgets/speed_options.dart';

class PatternOptions extends StatelessWidget {
  const PatternOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title("SEGMENTS", null),
        // Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 10),
        //   padding: const EdgeInsets.all(10),
        //   decoration: deco,
        //   child: GridView.count(
        //       crossAxisCount: 5,
        //       crossAxisSpacing: 6.0,
        //       mainAxisSpacing: 6.0,
        //       shrinkWrap: true,
        //       physics: const ScrollPhysics(),
        //       children: List.generate(segmentsMap.length, (index) {
        //         return segmentCard(context: context, segments: segmentsMap.keys.toList()[index]);
        //       })),
        // ),
        // title("PATTERNS", null),
        SizedBox(height: 8),
        SpeedSelector(),
        Container(
          margin: EdgeInsets.only(bottom: h * 0.1),
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
      ],
    );
  }
}
