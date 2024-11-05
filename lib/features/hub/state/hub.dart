import 'package:flutter/material.dart';

class HubProvider with ChangeNotifier {
  //

  String selectedEffect = '';
  void setEffect(String effect) {
    selectedEffect = effect;
    notifyListeners();
  }

  //

  int brightness = 9;
  void setBrightness(int value) {
    brightness = value;
    notifyListeners();
  }

  //

  int speed = 0;
  void setSpeed(int value) {
    speed = value;
    notifyListeners();
  }

  //

  int sensitivity = 0;
  void setSensitivity(int value) {
    sensitivity = value;
    notifyListeners();
  }

  //
}
