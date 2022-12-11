// Pattern widget
import 'package:flutter/material.dart';
import 'package:homie_ble/ui/screens/home/pageviews/colors/segment_bar.dart';
import '../../../../../methods/globals.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/other_widgets.dart';

Widget segmentCard({required BuildContext context, required int segments}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          global.updateSelected("s$segments");
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
            foregroundColor: themeColors[global.themeNo],
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
