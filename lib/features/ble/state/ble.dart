import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleProvider with ChangeNotifier {
  //--------------------------

  bool isConnected = false;

  BluetoothDevice? connectedDevice;
  Stream<List<int>>? stream;
  BluetoothCharacteristic? characteristic;

  void updateConnectedDevice(BluetoothDevice? device) {
    connectedDevice = device;
    isConnected = device != null;
    notifyListeners();
  }

  // ------------------------

  void updateConnectedDeviceXtics(Stream<List<int>>? s, BluetoothCharacteristic? c) {
    stream = s;
    characteristic = c;
    notifyListeners();
  }

//
}
