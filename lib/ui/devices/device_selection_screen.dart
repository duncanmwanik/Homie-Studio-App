import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../ble/ble_service.dart';
import '../../ble/device.dart';
import '../../ble/filter_devices.dart';
import '../../ble/others.dart';
import '../../theme/theme.dart';
import '../../widgets/back_button.dart';
import 'widgets/refresh_devices_fab.dart';

class DevicePicker extends StatefulWidget {
  const DevicePicker({super.key});

  @override
  DevicePickerState createState() => DevicePickerState();
}

class DevicePickerState extends State<DevicePicker> {
  @override
  void initState() {
    super.initState();
    bleService.scanForDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: backButton(context),
        title: const Text(
          'Select a lamp',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<List<ScanResult>>(
        stream: FlutterBluePlus.scanResults,
        initialData: const [],
        builder: (c, snapshot) {
          List<BluetoothDevice> scannedYMCBoards = getOnlyYMCBoards(snapshot.data ?? []);
          print(scannedYMCBoards);

          // TODO: Add Loading Indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          } else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return LoadingIndicator();
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(scannedYMCBoards.length, (index) => ScannedDevice(device: scannedYMCBoards[index])),
                ),
              );
            } else {
              return EmptyDevices();
            }
          } else {
            return LoadingIndicator();
          }
        },
      ),
      floatingActionButton: refreshBLEScanFAB(),
    );
  }
}
