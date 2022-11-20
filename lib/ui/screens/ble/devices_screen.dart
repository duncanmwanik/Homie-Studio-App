import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../../widgets/back_button.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/toast/toast.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  DevicesScreenState createState() => DevicesScreenState();
}

class DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: backButton(context),
        title: const Text(
          'Select a lamp',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: SizedBox(
                      height: h * 0.1,
                      child: ElevatedButton(
                          onPressed: () async {
                            bool success = await connectDevice(s.device);

                            if (!mounted) return;
                            if (success) {
                              Navigator.pop(context);
                            } else {
                              toast(0, "Failed to connect!");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: themeColors[global.themeNo],
                              minimumSize: Size(w * 0.6, 60),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  right: 10,
                                ),
                                child: Icon(
                                  Icons.lightbulb,
                                  size: 40,
                                  color: Colors.black38,
                                ),
                              ),
                              Expanded(
                                  child: Text(s.device.name,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)))
                            ],
                          )),
                    ),
                  );
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
              child: const Icon(Icons.stop),
            );
          } else {
            return FloatingActionButton(
                backgroundColor: themeColors[global.themeNo],
                child: const Icon(Icons.search),
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
