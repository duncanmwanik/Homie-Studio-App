import 'package:flutter/material.dart';

import '../data/shared_prefs.dart';
import '../widgets/toast/toast.dart';
import '../logic/global_logic.dart';

// --------------------------------- Global Provider ---------------------------------

class CommandModel with ChangeNotifier {
  // ---------- selected options
  String selected = ""; // selected color
  int brightness = 100; // selected brightness
  int sensitivity = 3; // selected sensitivity
  int speed = 3;

  void updateSelected(String selection) {
    selected = selection;
    notifyListeners();
  }

  void updateBrightness(int val) {
    brightness = val;
    notifyListeners();
  }

  void updateSensitivity(int val) {
    sensitivity = val;
    notifyListeners();
  }

  void updateSpeed(int val) {
    speed = val;
    notifyListeners();
  }

  // ---------- favorites
  List<String> favoriteColorList = sharedPrefs.getStringList('favoriteColorList') ?? [];
  List<String> favoritePatternList = sharedPrefs.getStringList('favoritePatternList') ?? [];
  List<String> favoriteMusicList = sharedPrefs.getStringList('favoriteMusicList') ?? [];

  void addToFavorite(String type, String option) {
    try {
      if (type == "color") {
        favoriteColorList.add(option);
      }
      if (type == "pattern") {
        favoritePatternList.add(option);
      }
      if (type == "music") {
        favoriteMusicList.add(option);
      }
    } catch (e) {
      errorPrint("add-fav", e);
      showToast(0, "Not added to favorites!");
    }
    notifyListeners();
  }

  void removeFromFavorite(String type, String option) {
    try {
      if (type == "color") {
        favoriteColorList.remove(option);
      }
      if (type == "pattern") {
        favoritePatternList.remove(option);
      }
      if (type == "music") {
        favoriteMusicList.remove(option);
      }
    } catch (e) {
      errorPrint("remove-fav", e);
      showToast(0, "Failed to remove!");
    }
    notifyListeners();
  }
}
