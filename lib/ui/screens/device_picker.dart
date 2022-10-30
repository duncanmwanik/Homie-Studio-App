import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/ui/screens/devices_screen.dart';
import 'package:provider/provider.dart';

class DevicePicker extends StatefulWidget {
  const DevicePicker({super.key});

  @override
  DevicePickerState createState() => DevicePickerState();
}

class DevicePickerState extends State<DevicePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BleModel>(builder: (context, ble, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: ElevatedButton(
                  onPressed: () {
                    if (ble.connected) {
                      notifyUser(0, "Disconnect current device first...");
                    } else if (!ble.btState) {
                      notifyUser(0, "Bluetooth is off!");
                    } else {
                      FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DevicesScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff202020), // background (button) color
                      foregroundColor: Colors.white, // foreground (text) color
                      elevation: 1,
                      minimumSize: Size(w * 0.5, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  child: Text(
                    ble.connected ? ble.device!.name : "Tap to connect a device",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ble.connected
                ? const SizedBox(
                    width: 10,
                  )
                : const Center(),
            Visibility(
              visible: ble.connected,
              child: Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: (() => disconnectFromDevice(ble.device)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // background (button) color
                      foregroundColor: Colors.white, // foreground (text) color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  child: const Text(
                    'Disconnect',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
