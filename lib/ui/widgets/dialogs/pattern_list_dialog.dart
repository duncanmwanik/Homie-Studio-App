import 'package:flutter/material.dart';
import '../../../models/patterns.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../back_button.dart';

Widget patternDialogList(BuildContext context) {
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
              children: List.generate(patternList.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, patternList[index].code);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: themeColors[global.themeNo],
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  child: Text(
                    patternList[index].title,
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
