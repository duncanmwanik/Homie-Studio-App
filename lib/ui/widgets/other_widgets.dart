import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/globals.dart';
import '../../methods/globals.dart';
import '../theme/theme.dart';

// ---------- most of the titles eey

Widget title(String title, String? imagePath) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    padding: const EdgeInsets.symmetric(vertical: 15),
    width: double.infinity,
    decoration: BoxDecoration(
      image: imagePath == null ? null : DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      color: secondaryColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget appbarText(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
  );
}

Widget infoText(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, top: 20, right: 20, left: 20),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white38,
      ),
    ),
  );
}

// ---------- In favorites, shown when a fav list is empty
Widget emptyFavList(String text) {
  return SizedBox(
    height: 50,
    child: Text(
      "No favorite $text ...",
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        color: Colors.white54,
      ),
    ),
  );
}

// ---------- In button assignment, when no lamp is connected
Widget notConnected() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 15, top: 40),
        decoration: const BoxDecoration(
          color: Color(0xff313131),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.lightbulb,
          color: Colors.white30,
          size: w * 0.2,
        ),
      ),
      const Text(
        "Maybe connect a lamp first...",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          color: Colors.white54,
        ),
      ),
    ],
  );
}

// ---------- In favorites, when a fav list is empty
Widget selectedOptionDot(String value) {
  return Consumer<GlobalModel>(builder: (context, g, child) {
    return Visibility(
      visible: g.selected == value,
      child: Padding(
        padding: const EdgeInsets.only(right: 6, top: 6),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.brightness_1,
              color: themeColors[g.themeNo],
              size: 20,
            )),
      ),
    );
  });
}

// ---------- Butoon Assignment, little numbered white circles
Widget numberedCircle(int number) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    padding: const EdgeInsets.all(2),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
  );
}

// ---------- Beautiful divider
Widget ruler(double width, double height, double top) {
  return Consumer<GlobalModel>(
      builder: (context, g, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: top),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: themeColors[g.themeNo],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: null,
              ),
            ],
          ));
}
