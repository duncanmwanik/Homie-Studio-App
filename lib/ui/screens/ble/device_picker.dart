import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';

import '../../../state/ble.dart';
import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../../widgets/toast/toast.dart';
import 'devices_screen.dart';

class DevicePicker extends StatefulWidget {
  const DevicePicker({super.key});

  @override
  DevicePickerState createState() => DevicePickerState();
}

class DevicePickerState extends State<DevicePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BleModel>(builder: (context, b, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              // flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: ElevatedButton(
                  onPressed: () {
                    if (b.connected) {
                      toast(2, "Disconnect current device first...");
                    } else if (!b.btState) {
                      toast(0, "Bluetooth is off!");
                    } else {
                      FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DevicesScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff202020),
                      foregroundColor: themeColors[global.themeNo],
                      elevation: 1,
                      minimumSize: Size(w * 0.3, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  child: Text(
                    b.connected ? b.device!.name : "Tap to connect a lamp",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            b.connected
                ? const SizedBox(
                    width: 10,
                  )
                : const Center(),
            Visibility(
              visible: b.connected,
              child: IconButton(
                  onPressed: (() => disconnectFromDevice(b.device!)),
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      );
    });
  }
}
