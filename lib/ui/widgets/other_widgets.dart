import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:provider/provider.dart';

// ---------- most of the titles eey

Widget titleText(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
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
          color: Colors.blue,
          size: w * 0.2,
        ),
      ),
      const Text(
        "Connect a lamp first ...",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );
}

// ---------- In favorites, when a fav list is empty
Widget emptyFavList(String text) {
  return Container(
    // margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white10,
        boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.sentiment_dissatisfied,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            "No favorite $text yet !",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

// ---------- In favorites, when a fav list is empty
Widget selectedOptionDot(String value) {
  return Consumer<GlobalModel>(builder: (context, global, child) {
    return Visibility(
      visible: global.selected == value,
      child: Padding(
        padding: const EdgeInsets.only(right: 3, top: 3),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.brightness_1,
              color: themeColor,
              size: 20,
            )),
      ),
    );
  });
}
