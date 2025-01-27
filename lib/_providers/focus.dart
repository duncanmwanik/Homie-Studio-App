import 'package:flutter/material.dart';

class FocusProvider with ChangeNotifier {
  // hold misc ids for updating ui

  String id = '';
  void set(String newId) {
    id = newId;
    notifyListeners();
  }

  //

  int index = 0;
  void setIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  //

  void reset() {
    id = '';
    index = 0;
    notifyListeners();
  }
}
