// --------------------------------- Bottom navbar & Pageview control ---------------------------------
// Bottom Navbar stuff
import 'package:flutter/material.dart';

import '../common_variables/state_providers.dart';
import '../data/shared_prefs.dart';

// Method to change pageview on horizontal swipes
void changePageViewOnSwipe(DragEndDetails drag) {
  if (drag.primaryVelocity == null) return;
  if (drag.primaryVelocity! < -300) {
    print(drag.primaryVelocity);
    // drag from right to left
    if (globalWatch.selectedView >= 0 && globalWatch.selectedView < 4) {
      globalWatch.updateSelectedView(globalWatch.selectedView + 1);
    }
  }
  if (drag.primaryVelocity! > 300) {
    print(drag.primaryVelocity);
    // drag from left to right
    if (globalWatch.selectedView > 0 && globalWatch.selectedView <= 4) {
      sharedPrefs.setInt("lastView", globalWatch.selectedView - 1);
      globalWatch.updateSelectedView(globalWatch.selectedView - 1);
    }
  }
}

Future<void> changeCurrentPageView(int pageIndex) async {
  await sharedPrefs.setInt("lastView", pageIndex);
  globalWatch.updateSelectedView(pageIndex);
}
