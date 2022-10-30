import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/models/style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
Widget bottomNavigationBar() {
  return Consumer<GlobalModel>(builder: (context, global, child) {
    return CurvedNavigationBar(
      index: global.selectedPage,
      color: themeColor,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: themeColor,
      height: 50,
      items: const <Widget>[
        Icon(Icons.whatshot_rounded, size: 30),
        Icon(Icons.palette_rounded, size: 30),
        Icon(Icons.favorite_rounded, size: 30),
        Icon(Icons.settings_remote_rounded, size: 30),
      ],
      onTap: (index) async {
        await prefs.setInt("lastPage", index);
        pageController.jumpToPage(index);
      },
    );
  });
}
