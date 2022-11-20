import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BleModel with ChangeNotifier {
  BluetoothDevice? device;
  Stream<List<int>>? stream;
  BluetoothCharacteristic? c;
  bool connected = false;
  bool btState = false;

  void setDevice(BluetoothDevice? dev) {
    device = dev;
    notifyListeners();
  }

  void updateConnectionState(bool state) {
    connected = state;
    notifyListeners();
  }

  void updateBtState(bool state) {
    btState = state;
    notifyListeners();
  }
}
