// Pattern widget
import 'package:flutter/material.dart';
import '../../../../../common_variables/state_providers.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widgets/other_widgets.dart';
import 'segment_bar.dart';

Widget segmentCard({required BuildContext context, required int segments}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          commandWatch.updateSelected("s$segments");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SegmentScreen(
                      segments: segments,
                    )),
          );
        },
        onLongPress: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: themeColors[themeWatch.selectedTheme],
            padding: const EdgeInsets.symmetric(horizontal: 1),
            minimumSize: const Size(double.infinity, double.infinity),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: Text(
          segments.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      selectedOptionDot("s$segments")
    ],
  );
}
