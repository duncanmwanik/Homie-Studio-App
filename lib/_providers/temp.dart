import 'package:flutter/material.dart';

class TempProvider with ChangeNotifier {
  // a string
  String temp = '';

  void set(String value, {bool notify = true}) {
    temp = value;
    if (notify) notifyListeners();
  }

  // a list
  List tempList = [];

  void updateList(String item) {
    tempList.contains(item) ? tempList.remove(item) : tempList.add(item);
    notifyListeners();
  }

  void reset() {
    temp = '';
    tempList.clear();
    notifyListeners();
  }
}
