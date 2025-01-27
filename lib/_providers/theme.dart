import 'package:flutter/material.dart';

import '../_services/hive/boxes.dart';
import '../_theme/helpers.dart';
import '../_variables/constants.dart';

class ThemeProvider with ChangeNotifier {
  String themeImage = globalBox.get('themeImage', defaultValue: defaultTheme);
  String themeType = globalBox.get('themeType', defaultValue: defaultTheme);
  String themeAccent = globalBox.get('themeAccent', defaultValue: '0');

  void setThemeImage(String themeImage_, String themeType_, String themeAccent_) {
    themeImage = themeImage_;
    themeType = themeType_;
    themeAccent = themeAccent_;
    globalBox.put('themeImage', themeImage_);
    globalBox.put('themeType', themeType_);
    globalBox.put('themeAccent', themeAccent_);
    changeStatusAndNavigationBarColor(themeType_);
    notifyListeners();
  }

  void enableThemeType() {
    changeStatusAndNavigationBarColor(themeType);
    notifyListeners();
  }
}
