import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homie_ble/color_picker/flutter_circle_color_picker.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------------------------------- Global Provider ---------------------------------

class GlobalModel with ChangeNotifier {
  // ---------- bottom nav bar
  int selectedPage = lastPage;

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
  int brightness = 255; // selected brightness
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
          notifyUser(1, "Added to favorites!");
        } else {
          notifyUser(2, "Already in favorites!");
        }
      }
      if (type == "pattern") {
        if (!favPatterns.contains(stuff)) {
          favPatterns.add(stuff);
          prefs.setStringList("favPatterns", favPatterns);
          notifyUser(1, "Added to favorites!");
        } else {
          notifyUser(2, "Already in favorites!");
        }
      }
      if (type == "music") {
        if (!favMusic.contains(stuff)) {
          favMusic.add(stuff);
          prefs.setStringList("favMusic", favMusic);
          notifyUser(1, "Added to favorites!");
        } else {
          notifyUser(2, "Already in favorites!");
        }
      }
    } catch (e) {
      errorPrint("add-fav", e);
      notifyUser(0, "Not added to favorites!");
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
          notifyUser(2, "Hmmm...");
        }
      }
      if (type == "pattern") {
        if (favPatterns.contains(stuff)) {
          favPatterns.remove(stuff);
          prefs.setStringList("favPatterns", favPatterns);
        } else {
          notifyUser(2, "Hmmm...");
        }
      }
      if (type == "music") {
        if (favMusic.contains(stuff)) {
          favMusic.remove(stuff);
          prefs.setStringList("favMusic", favMusic);
        } else {
          notifyUser(2, "Hmmm...");
        }
      }
    } catch (e) {
      errorPrint("remove-fav", e);
      notifyUser(0, "Failed to remove!");
    }
    notifyListeners();
  }
}

// --------------------------------- -------------------------- ---------------------------------
// --------------------------------- Global Variables & Methods ---------------------------------

// --------------------------------- Provider Pointers ---------------------------------
late dynamic globalWatch;
late dynamic bleWatch;

void createProviderReferences({BuildContext? context}) {
  globalWatch = context?.watch<GlobalModel>();
  bleWatch = context?.watch<BleModel>();
}

// --------------------------------- Screen Size ---------------------------------

// screen sizes
double h = 0;
double w = 0;

void getDeviceSize(BuildContext context) {
  // get device screen size and save them globally
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
}

// --------------------------------- Notification toast ---------------------------------
void notifyUser(int okay, String message) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      backgroundColor: okay == 0
          ? Colors.red
          : okay == 1
              ? Colors.green
              : Colors.white,
      textColor: Colors.black);
}

// --------------------------------- Debug Print ---------------------------------
void errorPrint(String where, var e) {
  print("!!! ERROR :: $where >> [[  $e  ]]");
}

// --------------------------------- Shared Preferences ---------------------------------
late SharedPreferences prefs;

// Shared prefs stuff

void getStoredData() {}

// --------------------------------- Bottom navbar & Pageview control ---------------------------------
// Bottom Navbar stuff
int lastPage = 0; // Saves the last navbar index
PageController pageController = PageController(initialPage: lastPage);

// Method to change pageview on horizontal swipes
void changePageView(details) {
  if (details.primaryVelocity < 0) {
    // drag from right to left
    if (pageController.page!.toInt() >= 0 && pageController.page!.toInt() < 3) {
      prefs.setInt("lastPage", pageController.page!.toInt() + 1);
      globalWatch.updateSelectedPage(pageController.page!.toInt() + 1);
      pageController.jumpToPage(pageController.page!.toInt() + 1);
    }
  } else {
    // drag from left to right
    if (pageController.page!.toInt() > 0 && pageController.page!.toInt() <= 3) {
      prefs.setInt("lastPage", pageController.page!.toInt() - 1);
      globalWatch.updateSelectedPage(pageController.page!.toInt() - 1);
      pageController.jumpToPage(pageController.page!.toInt() - 1);
    }
  }
}

// --------------------------------- Color Circle ---------------------------------
final colorCircleController = CircleColorPickerController(
  initialColor: Colors.white,
);
