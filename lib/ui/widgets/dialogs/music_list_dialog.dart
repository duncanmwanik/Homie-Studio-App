import 'package:flutter/material.dart';
import '../../../models/music.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../back_button.dart';

Widget musicDialogList(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        backButton(context),
        Expanded(
          child: GridView.count(
              crossAxisCount: 5,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: List.generate(musicList.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, musicList[index].code);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: themeColors[global.themeNo],
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  child: Text(
                    musicList[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                );
              })),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
