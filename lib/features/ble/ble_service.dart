import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../_helpers/debug.dart';
import '../../_providers/_providers.dart';
import '../../_services/hive/local_storage_service.dart';
import '../../_widgets/others/toast.dart';
import 'permissions.dart';

BleService bleService = BleService();
// String serviceUuid = '4faf';
String characteristicUuid = '0000';

class BleService {
  var ble = FlutterBluePlus;

  Future<void> connectToBoard(BluetoothDevice device) async {
    try {
      // connect to board
      await device.connect();
      // discover services
      List<BluetoothService> services = await device.discoverServices();
      for (var service in services) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == characteristicUuid) {
            state.ble.updateConnectedDeviceXtics(characteristic.lastValueStream, characteristic);
          }
        }
      }
      //
      state.ble.updateConnectedDevice(device);
      await globalBox.put('lastBleDevice', device.remoteId.str);
      //
      device.connectionState.listen((event) async {
        if (event == BluetoothConnectionState.disconnected) {
          showToast(0, 'Disconnected from ${device.platformName}.');
          state.ble.updateConnectedDevice(null);
        }
      });
      //
      //
    } catch (e) {
      logError('connect-device', e);
      showToast(0, 'Could not connect to ${device.platformName}.');
    }
  }

  Future<void> disconnectDevice(BluetoothDevice device) async {
    try {
      await device.disconnect();
      state.ble.updateConnectedDevice(null);
    } catch (e) {
      state.ble.updateConnectedDevice(null);
      logError('disconnect-device', e);
    }
  }

  Future<void> turnOnBT() async {
    try {
      if (FlutterBluePlus.adapterStateNow != BluetoothAdapterState.on) {
        await FlutterBluePlus.turnOn();
      }
    } catch (e) {
      logError('turn-on-bt', e);
    }
  }

  Future<void> scanForDevices() async {
    try {
      await checkBlePermissions();
      await turnOnBT();
      await FlutterBluePlus.startScan();
    } catch (e) {
      logError('scan-for-devices', e);
    }
  }

  bool isConnectedDevice(BluetoothDevice device) {
    if (state.ble.connectedDevice != null) {
      return state.ble.connectedDevice!.remoteId == device.remoteId;
    } else {
      return false;
    }
  }

  void sendMessageToDevice(String message) async {
    try {
      if (state.ble.connectedDevice != null) {
        List<int> data = utf8.encode(message);
        await state.ble.characteristic!.write(data);
      }
    } catch (e) {
      logError('send-data-device', e);
    }
  }
}
