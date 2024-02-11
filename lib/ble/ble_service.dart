import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:homie_ble/common_variables/globals.dart';

import '../_providers/_provider_variables.dart';
import '../logic/global_logic.dart';
import '../logic/permissions.dart';
import '../widgets/toast/toast.dart';

BleService bleService = BleService();
String serviceUuid = '4faf';
String characteristicUuid = '0000';

class BleService {
  var ble = FlutterBluePlus;

  Future<void> connectToBoard(BluetoothDevice device) async {
    try {
      //
      // Connect to board
      //
      await device.connect();
      //
      // Discover services
      //
      List<BluetoothService> services = await device.discoverServices();
      for (var service in services) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == characteristicUuid) {
            bleProviderX.updateConnectedDeviceXtics(characteristic.lastValueStream, characteristic);
          }
        }
      }
      //
      //
      bleProviderX.updateConnectedDevice(device);
      // await globalBox.put('last', device.platformName);
      //
      //
      //
      device.connectionState.listen((event) async {
        if (event == BluetoothConnectionState.disconnected) {
          bleProviderX.updateConnectedDevice(null);
          showToast(0, 'Lost connection to board!');
        }
      });
      //
      Navigator.pop(homeX.currentContext!);
      //
    } catch (e) {
      errorPrint('connect-device', e);
      showToast(0, 'Could not connect to ${device.platformName}');
    }
  }

  Future<void> disconnectBoard(BluetoothDevice device) async {
    try {
      await device.disconnect();
      bleProviderX.updateConnectedDevice(null);
    } catch (e) {
      errorPrint('disconnect-device', e);
    }
  }

  Future<void> scanForDevices() async {
    try {
      await checkForLocationPermissions();
      await FlutterBluePlus.startScan();
    } catch (e) {
      errorPrint('scan-for-devices', e);
    }
  }

  bool isConnectedDevice(BluetoothDevice device) {
    if (bleProviderX.connectedDevice != null) {
      return bleProviderX.connectedDevice!.remoteId == device.remoteId;
    } else {
      return false;
    }
  }

  void sendMessageToDevice(String message) async {
    if (bleProviderX.connectedDevice != null) {
      List<int> data = utf8.encode(message);
      try {
        await bleProviderX.characteristic!.write(data);
        print(':: SUCCESS! data sent : $message');
      } catch (e) {
        errorPrint('send-data-device', e);
      }
    }
  }
}
