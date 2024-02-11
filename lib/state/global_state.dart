import 'package:flutter/material.dart';

import '../data/shared_prefs.dart';

class GlobalModel with ChangeNotifier {
  // ---------- bottom nav bar
  int selectedView = sharedPrefs.getInt("lastView") ?? 2;

  void updateSelectedView(int selected) {
    selectedView = selected;
    notifyListeners();
  }

  // ---------- loading screen
  bool showLoading = false;

  void showLoadingWidget(bool show) {
    showLoading = show;
    notifyListeners();
  }

  // ---------- bt off banner
  bool showBanner = false;

  void updateShowBanner(bool show) {
    showBanner = show;
    notifyListeners();
  }
}
