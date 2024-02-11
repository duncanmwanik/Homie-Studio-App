import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/navigation_logic.dart';
import '../../../state/global_state.dart';
import '../../../state/theme_state.dart';
import '../../../theme/theme.dart';

// ignore: must_be_immutable
Widget bottomNavigationBar() {
  return Consumer2<ThemeModel, GlobalModel>(builder: (context, theme, global, child) {
    return BottomNavigationBar(
      currentIndex: global.selectedView,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: secondaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(label: '', icon: Icon(Icons.whatshot_rounded, size: 30, color: global.selectedView == 0 ? themeColors[theme.selectedTheme] : Colors.white)),
        BottomNavigationBarItem(label: '', icon: Icon(Icons.palette_rounded, size: 30, color: global.selectedView == 1 ? themeColors[theme.selectedTheme] : Colors.white)),
        // BottomNavigationBarItem(label: '', icon: Icon(Icons.music_note, size: 30, color: global.selectedView == 1 ? Colors.white : themeColors[theme.selectedTheme])),
        BottomNavigationBarItem(label: '', icon: Icon(Icons.favorite_rounded, size: 30, color: global.selectedView == 2 ? themeColors[theme.selectedTheme] : Colors.white)),
        // BottomNavigationBarItem(label: '', icon: Icon(Icons.view_carousel, size: 30, color: global.selectedView == 4 ? Colors.black : themeColors[theme.selectedTheme])),
      ],
      onTap: (viewNo) async {
        changeCurrentPageView(viewNo);
      },
    );
  });
}
