// --------------------------------- BLE ---------------------------------
// all ble variables, methods and providers

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homie_ble/models/globals.dart';

class BleModel with ChangeNotifier {
// ---------- ble non-constant variables
  BluetoothDevice? device;
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

// --------------------------------- -------------------------- ---------------------------------
// --------------------------------- BLE Variables & Methods ---------------------------------

String serviceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
String characteristicUuid = "beb54800-36e1-4688-b7f5-ea07361b26a8";
BluetoothCharacteristic? c;
Stream<List<int>>? stream;

// ---------- Sending commands to the ble device
sendDataToDevice(String dataString) async {
  if (bleWatch.connected) {
    //Encoding the string
    List<int> data = utf8.encode(dataString);
    try {
      await c!.write(data);
      print("::::::::: Success! data sent : $dataString");
    } catch (e) {
      errorPrint("send-data", e);
    }
  }
}

disconnectFromDevice(BluetoothDevice? device) async {
  try {
    await bleWatch.device.disconnect();
    bleWatch.setDevice(null);
    bleWatch.updateConnectionState(false);
  } catch (e) {
    errorPrint("disconnect-device", e);
  }
}

discoverServices(BluetoothDevice d) async {
  List<BluetoothService> services = await d.discoverServices();
  for (var service in services) {
    if (service.uuid.toString() == serviceUuid) {
      for (var characteristic in service.characteristics) {
        if (characteristic.uuid.toString() == characteristicUuid) {
          await characteristic.setNotifyValue(!characteristic.isNotifying);
          stream = characteristic.value;
          c = characteristic;
        }
      }
    }
  }
}

// ---------- Connecting to a device
Future<bool> connectDevice(BluetoothDevice device) async {
  try {
    globalWatch.showLoadingWidget(true);
    await disconnectFromDevice(device);
    await device.connect();
    await discoverServices(device);
    await bleWatch.setDevice(device);
    await bleWatch.updateConnectionState(true);

    device.state.listen((event) async {
      if (event != BluetoothDeviceState.connected) {
        await bleWatch.setDevice(null);
        await bleWatch.updateConnectionState(false);
      }
    });

    globalWatch.showLoadingWidget(false);

    return true;
  } catch (e) {
    errorPrint("connect-device", e);
    globalWatch.showLoadingWidget(false);
    return false;
  }
}

// ---------- Get devices connected automatically. They were never disconnected well
Future<void> checkForConnectedDevices() async {
  print("....... trying to auto-connect");

  FlutterBlue.instance.connectedDevices.then((devices) async {
    if (devices.isNotEmpty) {
      try {
        await discoverServices(devices[0]);
        await bleWatch.setDevice(devices[0]);
        await bleWatch.updateConnectionState(true);
        notifyUser(2, "Connected to ${devices[0].name}");
      } catch (e) {
        errorPrint("autoconnect", e);
      }
    }
  });
}
