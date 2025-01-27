import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';

import '../../_theme/spacing.dart';
import '../../_widgets/buttons/close.dart';
import '../../_widgets/others/empty_box.dart';
import '../../_widgets/others/loader.dart';
import '../../_widgets/others/text.dart';
import '../../_widgets/sheets/bottom_sheet.dart';
import '../ble/ble_service.dart';
import '../ble/state/ble.dart';
import 'scanned_device.dart';

Future<void> showDevicesSheet() async {
  bleService.scanDevices();

  await showAppBottomSheet(
    title: 'Connect device',
    flexible: true,
    showTopDivider: false,
    headerPadding: padC('l9,r6,t6'),
    header: Row(
      children: [
        AppText('Connect device'),
        Spacer(),
        AppCloseButton(),
      ],
    ),
    content: Consumer<BleProvider>(builder: (context, ble, child) {
      return SingleChildScrollView(
        padding: padC('t8,b64'),
        child: StreamBuilder(
          stream: FlutterBluePlus.onScanResults,
          builder: (ctx, snapshot) {
            List<ScanResult> devices = snapshot.data ?? [];

            if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
              // error
              if (snapshot.hasError) {
                return EmptyBox(
                  label: 'Could not scan for devices',
                  padding: padL('t'),
                  onPressed: () => bleService.scanDevices(),
                );
              }
              // no devices
              else if (devices.isEmpty) {
                return EmptyBox(
                  label: 'No devices found',
                  padding: padL('t'),
                  onPressed: () => bleService.scanDevices(),
                );
              }
              // devices
              else {
                return Wrap(
                  runSpacing: smallHeight(),
                  children: List.generate(
                    devices.length,
                    (index) => ScannedDevice(device: devices[index].device),
                  ),
                );
              }
            }

            return AppLoader();
          },
        ),
      );
    }),
    //
    // actions: [
    //   // TODOs: Add rotation for refresh icon
    //   Planet(
    //     onPressed: () => bleService.scanDevices(),
    //     noStyling: true,
    //     isSquare: true,
    //     leading: Icons.refresh,
    //   ),
    // ],
    //
  );
}
