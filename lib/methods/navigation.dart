// --------------------------------- Bottom navbar & Pageview control ---------------------------------
// Bottom Navbar stuff
import 'package:flutter/material.dart';

import '../data/shared_prefs.dart';
import 'globals.dart';

int lastPage = 0; // Saves the last navbar index
PageController pageController = PageController(initialPage: lastPage);

// Method to change pageview on horizontal swipes
void changePageView(DragEndDetails drag) {
  if (drag.primaryVelocity == null) return;
  if (drag.primaryVelocity! < -300) {
    print(drag.primaryVelocity);
    // drag from right to left
    if (pageController.page!.toInt() >= 0 && pageController.page!.toInt() < 4) {
      prefs.setInt("lastPage", pageController.page!.toInt() + 1);
      global.updateSelectedPage(pageController.page!.toInt() + 1);
      pageController.jumpToPage(pageController.page!.toInt() + 1);
    }
  }
  if (drag.primaryVelocity! > 300) {
    print(drag.primaryVelocity);
    // drag from left to right
    if (pageController.page!.toInt() > 0 && pageController.page!.toInt() <= 4) {
      prefs.setInt("lastPage", pageController.page!.toInt() - 1);
      global.updateSelectedPage(pageController.page!.toInt() - 1);
      pageController.jumpToPage(pageController.page!.toInt() - 1);
    }
  }
}
