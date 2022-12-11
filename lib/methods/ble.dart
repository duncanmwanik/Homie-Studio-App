// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homie_ble/data/shared_prefs.dart';
import '../ui/widgets/toast/toast.dart';
import 'globals.dart';

String serviceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
String characteristicUuid = "beb54800-36e1-4688-b7f5-ea07361b26a8";

// ---------- Sending commands to the ble device
sendDataToDevice(String dataString) async {
  if (bt.connected) {
    //Encoding the string
    List<int> data = utf8.encode(dataString);
    try {
      await bt.c!.write(data);
      print("::::::::: Success! data sent : $dataString");
    } catch (e) {
      errorPrint("send-data", e);
    }
  }
}

disconnectFromSelectedDevice(BluetoothDevice device) async {
  try {
    await device.disconnect();
    bt.setDevice(null);
    bt.updateConnectionState(false);
  } catch (e) {
    errorPrint("disconnect-device", e);
  }
}

disconnectFromOtherDevice(BluetoothDevice device) async {
  try {
    await device.disconnect();
  } catch (e) {
    errorPrint("disconnect-other-device", e);
  }
}

discoverServices(BluetoothDevice d) async {
  List<BluetoothService> services = await d.discoverServices();
  for (var service in services) {
    if (service.uuid.toString() == serviceUuid) {
      for (var characteristic in service.characteristics) {
        if (characteristic.uuid.toString() == characteristicUuid) {
          await characteristic.setNotifyValue(!characteristic.isNotifying);
          bt.stream = characteristic.value;
          bt.c = characteristic;
        }
      }
    }
  }
}

// ---------- Connecting to a device
void connectDevice(
  BuildContext context,
  BluetoothDevice device,
) async {
  try {
    global.showLoadingWidget(true);
    await device.connect();
    await discoverServices(device);
    await bt.setDevice(device);
    await bt.updateConnectionState(true);
    await prefs.setString("last", device.name);

    device.state.listen((event) async {
      if (event == BluetoothDeviceState.disconnected) {
        await bt.setDevice(null);
        await bt.updateConnectionState(false);
        toast(0, "Lost connection to lamp!");
      }
    });

    global.showLoadingWidget(false);

    Navigator.pop(context);
  } catch (e) {
    errorPrint("connect-device", e);
    toast(0, "Failed to connect!");
    global.showLoadingWidget(false);
  }
}

void selectDevice(BuildContext context, BluetoothDevice device) async {
  try {
    global.showLoadingWidget(true);
    await discoverServices(device);
    await bt.setDevice(device);
    await bt.updateConnectionState(true);
    await prefs.setString("last", device.name);

    device.state.listen((event) async {
      if (event == BluetoothDeviceState.disconnected) {
        await bt.setDevice(null);
        await bt.updateConnectionState(false);
        toast(0, "Lost connection to lamp!");
      }
    });

    global.showLoadingWidget(false);

    Navigator.pop(context);
  } catch (e) {
    errorPrint("select-device", e);
    toast(0, "Failed to connect!");
    global.showLoadingWidget(false);
  }
}

// ---------- Get devices connected automatically. They were never disconnected well
Future<void> checkForConnectedDevices() async {
  print("....... trying to auto-connect");

  FlutterBlue.instance.connectedDevices.then((devices) async {
    if (devices.isNotEmpty) {
      String name = prefs.getString("last") ?? "MoodLamp";
      for (BluetoothDevice device in devices) {
        if (device.name == name) {
          try {
            await discoverServices(devices[0]);
            await bt.setDevice(devices[0]);
            await bt.updateConnectionState(true);
            toast(2, "Connected to ${devices[0].name}");
          } catch (e) {
            errorPrint("autoconnect", e);
          }
        }
      }
    }
  });
}
