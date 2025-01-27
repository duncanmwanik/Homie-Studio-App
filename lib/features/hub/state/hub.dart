import 'package:flutter/material.dart';

class HubProvider with ChangeNotifier {
  String selectedEffect = '';
  int brightness = 9;
  int speed = 2;
  int sensitivity = 2;

  void setEffect(String effect) {
    selectedEffect = effect;
    notifyListeners();
  }

  void setBrightness(int value) {
    brightness = value;
    notifyListeners();
  }

  void setSpeed(int value) {
    speed = value;
    notifyListeners();
  }

  void setSensitivity(int value) {
    sensitivity = value;
    notifyListeners();
  }
}
