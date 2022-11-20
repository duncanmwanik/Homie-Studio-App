import 'package:flutter/material.dart';
import 'package:homie_ble/ui/theme/theme.dart';

import '../data/shared_prefs.dart';
import '../ui/widgets/toast/toast.dart';
import '../methods/globals.dart';

// --------------------------------- Global Provider ---------------------------------

class GlobalModel with ChangeNotifier {
  // ---------- bottom nav bar
  int selectedPage = prefs.getInt("lastPage") ?? 2;

  void updateSelectedPage(int selected) {
    selectedPage = selected;
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

  // ---------- selected options
  String selected = ""; // selected color
  int brightness = 10; // selected brightness
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
  List<String> favColors = prefs.getStringList('favColors') ?? [];
  List<String> favPatterns = prefs.getStringList('favPatterns') ?? [];
  List<String> favMusic = prefs.getStringList('favMusic') ?? [];

  void addToFavorite(String type, String stuff) {
    try {
      if (type == "color") {
        if (!favColors.contains(stuff)) {
          favColors.add(stuff);
          prefs.setStringList("favColors", favColors);
          toast(1, "Added to favorites!");
        } else {
          toast(2, "Already in favorites!");
        }
      }
      if (type == "pattern") {
        if (!favPatterns.contains(stuff)) {
          favPatterns.add(stuff);
          prefs.setStringList("favPatterns", favPatterns);
          toast(1, "Added to favorites!");
        } else {
          toast(2, "Already in favorites!");
        }
      }
      if (type == "music") {
        if (!favMusic.contains(stuff)) {
          favMusic.add(stuff);
          prefs.setStringList("favMusic", favMusic);
          toast(1, "Added to favorites!");
        } else {
          toast(2, "Already in favorites!");
        }
      }
    } catch (e) {
      errorPrint("add-fav", e);
      toast(0, "Not added to favorites!");
    }
    notifyListeners();
  }

  void removeFromFavorite(String type, String stuff) {
    try {
      if (type == "color") {
        if (favColors.contains(stuff)) {
          favColors.remove(stuff);
          prefs.setStringList("favColors", favColors);
        } else {
          toast(2, "Hmmm...");
        }
      }
      if (type == "pattern") {
        if (favPatterns.contains(stuff)) {
          favPatterns.remove(stuff);
          prefs.setStringList("favPatterns", favPatterns);
        } else {
          toast(2, "Hmmm...");
        }
      }
      if (type == "music") {
        if (favMusic.contains(stuff)) {
          favMusic.remove(stuff);
          prefs.setStringList("favMusic", favMusic);
        } else {
          toast(2, "Hmmm...");
        }
      }
    } catch (e) {
      errorPrint("remove-fav", e);
      toast(0, "Failed to remove!");
    }
    notifyListeners();
  }

  // ---------- theme

  int themeNo = prefs.getInt("themeNo") ?? 0;

  void updateThemeColor(int val) {
    themeNo = val;
    prefs.setInt("themeNo", val);
    notifyListeners();
  }
}
