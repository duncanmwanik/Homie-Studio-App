import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleProvider with ChangeNotifier {
  // List<BluetoothDevice> BluetoothDevices = [];
  // List<String> BluetoothDevicesNames = [];

  // void updateDiscoveredBoards(BluetoothDevice device) {
  //   if (device.name.startsWith('YMC') && !BluetoothDevicesNames.contains(device.name)) {
  //     BluetoothDevices.add(device);
  //     BluetoothDevicesNames.add(device.name);
  //     notifyListeners();
  //   }
  // }

  //--------------------------

  BluetoothDevice? connectedDevice;

  void updateConnectedDevice(BluetoothDevice? newDevice) {
    connectedDevice = newDevice;
    notifyListeners();
  }

  // ------------------------

  Stream<List<int>>? stream;
  BluetoothCharacteristic? characteristic;

  void updateConnectedDeviceXtics(Stream<List<int>>? s, BluetoothCharacteristic? c) {
    stream = s;
    characteristic = c;
    notifyListeners();
  }
}
