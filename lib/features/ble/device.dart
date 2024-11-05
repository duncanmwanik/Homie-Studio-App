import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/others/icons.dart';
import '../../_widgets/others/loader.dart';
import '../../_widgets/others/text.dart';
import 'ble_service.dart';

class ScannedDevice extends StatefulWidget {
  const ScannedDevice({super.key, required this.device});

  final BluetoothDevice device;

  @override
  State<ScannedDevice> createState() => _ScannedDeviceState();
}

class _ScannedDeviceState extends State<ScannedDevice> {
  bool isConnecting = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothConnectionState>(
        stream: widget.device.connectionState,
        initialData: BluetoothConnectionState.disconnected,
        builder: (c, snapshot) {
          bool isConnectedDevice = snapshot.data == BluetoothConnectionState.connected;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: AppButton(
              onPressed: () async {
                setState(() => isConnecting = true);
                await bleService.connectToBoard(widget.device);
                setState(() => isConnecting = false);
              },
              radius: borderRadiusSmall,
              srp: true,
              height: 40,
              child: Row(
                children: [
                  //
                  AppIcon(Icons.lightbulb_outline, tiny: true, faded: true),
                  spw(),
                  Expanded(child: AppText(size: normal, text: widget.device.platformName)),
                  //

                  //
                  isConnecting
                      ? AppLoader(color: styler.accent)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //
                            if (!isConnectedDevice)
                              AppButton(
                                noStyling: true,
                                child: AppText(text: 'Connect', size: small, faded: true),
                              ),
                            // if (!isConnectedDevice) tpw(),
                            // if (!isConnectedDevice) AppIcon(Icons.arrow_forward, size: medium, faded: true),
                            //
                            if (isConnectedDevice) AppIcon(Icons.done_rounded, color: Colors.green),
                            if (isConnectedDevice) spw(),
                            if (isConnectedDevice)
                              AppButton(
                                onPressed: () => bleService.disconnectDevice(widget.device),
                                noStyling: true,
                                child: AppIcon(Icons.close_rounded),
                              ),
                            //
                          ],
                        ),
                  //
                ],
              ),
            ),
          );
        });
  }
}
