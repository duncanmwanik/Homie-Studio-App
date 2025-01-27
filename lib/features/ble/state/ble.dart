import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleProvider with ChangeNotifier {
  bool isConnected = false;
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? commandCharacteristic;
  BluetoothCharacteristic? dataCharacteristic;

  void updateConnectedDevice(BluetoothDevice device, BluetoothCharacteristic? c, BluetoothCharacteristic? d) {
    connectedDevice = device;
    commandCharacteristic = c;
    dataCharacteristic = d;
    isConnected = true;
    notifyListeners();
  }

  void reset() {
    isConnected = false;
    connectedDevice = null;
    commandCharacteristic = null;
    dataCharacteristic = null;
    notifyListeners();
  }
}
