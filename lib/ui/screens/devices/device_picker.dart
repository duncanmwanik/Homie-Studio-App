import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';

import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import '../../../state/ble.dart';
import '../../theme/theme.dart';
import '../../widgets/back_button.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/toast/toast.dart';

class DevicePicker extends StatefulWidget {
  const DevicePicker({super.key});

  @override
  DevicePickerState createState() => DevicePickerState();
}

class DevicePickerState extends State<DevicePicker> {
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
      body: Column(
        children: [
          // ---------- linear progress indicator
          loadingWidget(context),

          // ---------- list of all BLE devices that are advertising

          StreamBuilder<List<ScanResult>>(
            stream: FlutterBlue.instance.scanResults,
            initialData: const [],
            builder: (c, snapshot) => Column(
              children: snapshot.data!.map((s) {
                if (s.device.type == BluetoothDeviceType.le) {
                  return StreamBuilder<BluetoothDeviceState>(
                      stream: s.device.state,
                      initialData: BluetoothDeviceState.disconnected,
                      builder: (c, snapshot) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: ListTile(
                              dense: true,
                              visualDensity: VisualDensity(vertical: 4),
                              onTap: () async {
                                if (snapshot.data == BluetoothDeviceState.connected) {
                                  selectDevice(context, s.device);
                                } else {
                                  connectDevice(context, s.device);
                                }
                              },
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              leading: Icon(
                                Icons.lightbulb,
                                size: 40,
                                color: Colors.black38,
                              ),
                              title: Text(s.device.name,
                                  style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w800)),
                              trailing: Visibility(
                                visible: snapshot.data == BluetoothDeviceState.connected,
                                child: Consumer<BleModel>(
                                  builder: (context, b, child) => IconButton(
                                      onPressed: () {
                                        if (s.device == b.device) {
                                          disconnectFromSelectedDevice(s.device);
                                        } else {
                                          disconnectFromOtherDevice(s.device);
                                        }
                                      },
                                      splashRadius: 20,
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      )),
                                ),
                              ),
                            ),
                          ));
                } else {
                  return Container();
                }
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: themeColors[global.themeNo],
              child: const Icon(
                Icons.stop,
                color: Colors.black,
              ),
            );
          } else {
            return FloatingActionButton(
                backgroundColor: themeColors[global.themeNo],
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (bt.btState) {
                    global.showLoadingWidget(true);
                    FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4));
                    global.showLoadingWidget(false);
                  } else {
                    toast(0, "Bluetooth is off");
                  }
                });
          }
        },
      ),
    );
  }
}
