// Pattern widget
import 'package:flutter/material.dart';
import '../../../models/music.dart';
import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../other_widgets.dart';

Widget musicCard({required MusicObject music}) {
  return Stack(
    children: [
      ElevatedButton(
        onPressed: () {
          sendDataToDevice(music.code);
          global.updateSelected(music.code);
        },
        onLongPress: () {
          global.addToFavorite("music", music.code);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: themeColors[global.themeNo],
            padding: EdgeInsets.zero,
            minimumSize: const Size(double.infinity, double.infinity),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: Text(
          music.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      selectedOptionDot(music.code),
    ],
  );
}
