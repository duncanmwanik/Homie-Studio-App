import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:homie_ble/ble/ble_service.dart';
import 'package:provider/provider.dart';

import '../../common_variables/globals.dart';
import '../../common_variables/state_providers.dart';
import '../../state/ble_state.dart';
import '../../theme/theme.dart';
import 'device_selection_screen.dart';

class DeviceManagementPanel extends StatelessWidget {
  const DeviceManagementPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BleProvider>(builder: (context, ble, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //---------- dropdown to select another device
            // Visibility(
            //   visible: ble.connectedDevice != null,
            //   child: IconButton(
            //       onPressed: () {
            //         FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => const DevicePicker()),
            //         );
            //       },
            //       splashRadius: 20,
            //       icon: Icon(
            //         Icons.arrow_drop_down_circle,
            //         color: Colors.white,
            //       )),
            // ),
            //----------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: ElevatedButton(
                  onPressed: () {
                    // if (!ble.btState) {
                    //   showToast(0, "Bluetooth is off!");
                    // } else if (ble.connected) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => DevicesInfoScreen(
                    //               device: ble.device!,
                    //             )),
                    //   );
                    // } else {
                    //   FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => DevicePicker()),
                    //   );
                    // }
                    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DevicePicker()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      foregroundColor: themeColors[themeWatch.selectedTheme],
                      elevation: 1,
                      minimumSize: Size(w * 0.3, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  child: Text(
                    ble.connectedDevice != null ? ble.connectedDevice!.platformName : "Connect a lamp",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ),
            //---------- button to disconnect a device
            Visibility(
              visible: ble.connectedDevice != null,
              child: IconButton(
                  onPressed: (() => bleService.disconnectBoard(ble.connectedDevice!)),
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
