import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/shared_prefs.dart';
import '../../../methods/globals.dart';
import '../../../methods/navigation.dart';
import '../../../state/globals.dart';
import '../../theme/theme.dart';

// ignore: must_be_immutable
Widget bottomNavigationBar() {
  return Consumer<GlobalModel>(builder: (context, g, child) {
    return CurvedNavigationBar(
      index: g.selectedPage,
      color: themeColors[global.themeNo],
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: themeColors[global.themeNo],
      height: 50,
      items: const <Widget>[
        Icon(Icons.whatshot_rounded, size: 30),
        Icon(Icons.music_note, size: 30),
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
