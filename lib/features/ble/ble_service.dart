import 'dart:convert';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../_helpers/debug.dart';
import '../../_helpers/navigation.dart';
import '../../_providers/_providers.dart';
import '../../_services/hive/boxes.dart';
import '../../_widgets/others/toast.dart';
import 'permissions.dart';

Ble bleService = Ble();

class Ble {
  String serviceUuid = '4fafc201-1fb5-459e-8fcc-c5c9c331914b';
  Guid serviceGuid = Guid('4fafc201-1fb5-459e-8fcc-c5c9c331914b');
  String commandCharacteristicUuid = 'beb54800-36e1-4688-b7f5-ea07361b26a8';
  String dataCharacteristicUuid = 'beb54800-36e2-4688-b7f5-ea07361b26a8';

  //
  Future<void> connectDevice(BluetoothDevice device) async {
    try {
      // connect to board
      await device.connect(timeout: Duration(seconds: 5));

      // discover services
      List<BluetoothService> services = await device.discoverServices();
      BluetoothCharacteristic? c;
      BluetoothCharacteristic? d;

      for (var service in services) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == commandCharacteristicUuid) {
            c = characteristic;
          }
          if (characteristic.uuid.toString() == dataCharacteristicUuid) {
            d = characteristic;
          }
        }
      }

      state.ble.updateConnectedDevice(device, c, d);
      // reminder
      await globalBox.put('lastConnectedDevice', device.remoteId.str);
      // get connection/disconnection updates
      device.connectionState.listen((bluetoothConnectionState) {
        if (bluetoothConnectionState == BluetoothConnectionState.disconnected && state.ble.isConnected) {
          state.ble.reset();
          showToast(0, 'Lost connection to ${device.name}');
        }
      });

      closeBottomSheetIfOpen();
    } catch (e) {
      logError('connectDevice', e);
      showToast(0, 'Failed to connect ${device.platformName}');
    }
  }

  //
  Future<void> disconnectDevice(BluetoothDevice device) async {
    try {
      state.ble.reset();
      await device.disconnect();
    } catch (e) {
      logError('disconnectDevice', e);
    }

    state.ble.reset();
  }

  // scan devices
  Future<void> scanDevices() async {
    try {
      await checkBlePermissions();
      // check if Bluetooth is on
      if (await FlutterBluePlus.adapterState.first != BluetoothAdapterState.on) {
        if (Platform.isAndroid) {
          showToast(2, 'Turning Bluetooth on ...');
          await FlutterBluePlus.turnOn();
        } else {
          showToast(2, 'Please turn Bluetooth on');
        }
        return;
      }
      if (!FlutterBluePlus.isScanningNow) {
        await FlutterBluePlus.startScan(
            // withServices: [serviceGuid],
            );
      }
    } catch (e) {
      logError('scanDevices', e);
    }
  }

  //
  List<ScanResult> sortDevices(List<ScanResult> scanResults) {
    // scanResults.forEach((scanResult) async {
    //   show(scanResult.device.platformName);
    //   List<BluetoothService> serv = await scanResult.device.discoverServices();
    //   show(serv.length);
    // });

    return scanResults;
  }

  //
  bool isConnected(BluetoothDevice device) {
    if (state.ble.connectedDevice != null) {
      return state.ble.connectedDevice!.remoteId == device.remoteId;
    } else {
      return false;
    }
  }

  //
  void sendData(String message) async {
    try {
      if (state.ble.commandCharacteristic != null) {
        await state.ble.commandCharacteristic?.write(utf8.encode(message));
      }
    } catch (e) {
      logError('sendData', e);
    }
  }
}
