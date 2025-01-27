import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  // internet connection status
  bool isConnectedToInternet = false;
  void updateInternetConnectionStatus(bool status) {
    isConnectedToInternet = status;
  }

  // keeps track of whether the bottom sheet is open
  bool isBottomSheetOpen = false;
  void updateIsBottomSheetOpen(bool value) {
    isBottomSheetOpen = value;
    notifyListeners();
  }

  // keeps track of whether the bottom sheet is open
  bool isKeyboardOpen = false;
  void updateIsKeyboardOpen(bool value) {
    isKeyboardOpen = value;
    notifyListeners();
  }

  // keeps track of last menu position
  RelativeRect menuPosition = RelativeRect.fromLTRB(0, 0, 0, 0);
  void updateMenuPosition(RelativeRect newPosition) {
    menuPosition = newPosition;
  }
}
