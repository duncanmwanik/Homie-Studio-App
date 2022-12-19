import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';

import '../../../state/ble.dart';
import '../../../methods/ble.dart';
import '../../../methods/globals.dart';
import '../../theme/theme.dart';
import '../../widgets/toast/toast.dart';
import 'device_info.dart';
import 'device_picker.dart';

class DeviceControl extends StatefulWidget {
  const DeviceControl({super.key});

  @override
  DeviceControlState createState() => DeviceControlState();
}

class DeviceControlState extends State<DeviceControl> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BleModel>(builder: (context, b, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: b.connected,
              child: IconButton(
                  onPressed: () {
                    FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DevicePicker()),
                    );
                  },
                  splashRadius: 20,
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.white,
                  )),
            ),
            Expanded(
              // flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: ElevatedButton(
                  onPressed: () {
                    if (!b.btState) {
                      toast(0, "Bluetooth is off!");
                    } else if (b.connected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DevicesInfoScreen(
                                  device: b.device!,
                                )),
                      );
                    } else {
                      FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DevicePicker()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      foregroundColor: themeColors[global.themeNo],
                      elevation: 1,
                      minimumSize: Size(w * 0.3, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  child: Text(
                    b.connected ? b.device!.name : "Connect a lamp",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: b.connected,
              child: IconButton(
                  onPressed: (() => disconnectFromSelectedDevice(b.device!)),
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
