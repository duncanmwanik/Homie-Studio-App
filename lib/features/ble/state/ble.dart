import 'package:flutter/material.dart';
import 'package:universal_ble/universal_ble.dart';

class BleProvider with ChangeNotifier {
  //--------------------------

  bool isConnected = false;

  BleDevice? connectedDevice;
  Stream<List<int>>? stream;
  BleCharacteristic? characteristic;

  void updateConnectedDevice(BleDevice? device) {
    connectedDevice = device;
    isConnected = device != null;
    notifyListeners();
  }

  // ------------------------

  void updateConnectedDeviceXtics(Stream<List<int>>? s, BleCharacteristic? c) {
    stream = s;
    characteristic = c;
    notifyListeners();
  }

//
}
