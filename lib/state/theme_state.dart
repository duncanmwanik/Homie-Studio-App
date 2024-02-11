import 'package:flutter/material.dart';

import '../data/shared_prefs.dart';

class ThemeModel with ChangeNotifier {
  int selectedTheme = sharedPrefs.getInt("selectedTheme") ?? 0;

  void updateThemeColor(int val) {
    selectedTheme = val;
    sharedPrefs.setInt("selectedTheme", val);
    notifyListeners();
  }
}
