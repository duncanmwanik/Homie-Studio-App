import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';

import '../../../_theme/spacing.dart';
import '../../../_widgets/buttons/button.dart';
import '../../../_widgets/dialogs/app_dialog.dart';
import '../../../_widgets/others/empty_box.dart';
import '../../../_widgets/others/loader.dart';
import '../../ble/ble_service.dart';
import '../../ble/device.dart';
import '../../ble/filter_devices.dart';
import '../../ble/state/ble.dart';

Future<void> showConnectDeviceDialog() async {
  bleService.scanForDevices();

  await showAppDialog(
    title: 'Devices',
    showClose: true,
    content: Consumer<BleProvider>(builder: (context, ble, child) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBluePlus.scanResults,
              initialData: const [],
              builder: (ctx, snapshot) {
                List<BluetoothDevice> devices = getFilteredDevices(snapshot.data ?? []);

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return AppLoader();
                }
                //
                else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                  //
                  if (snapshot.hasError) {
                    return EmptyBox(label: 'Failed to scan for devices.', icon: Icons.info_outline);
                  }
                  //
                  else if (devices.isNotEmpty) {
                    return Column(
                      children: List.generate(devices.length, (index) => ScannedDevice(device: devices[index])),
                    );
                  }
                  //
                  else {
                    return EmptyBox(label: 'No devices found.', icon: Icons.bluetooth);
                  }
                  //
                }
                //
                else {
                  return AppLoader();
                }
              },
            ),
            //
            lph(),
            //
          ],
        ),
      );
    }),
    //
    actions: [
      // TODOs: Add rotation for refresh
      AppButton(onPressed: () => bleService.scanForDevices(), noStyling: true, isSquare: true, leading: Icons.refresh),
    ],
    //
  );
}
