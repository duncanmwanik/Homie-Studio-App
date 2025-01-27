import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/planet.dart';
import '../../_widgets/others/icons.dart';
import '../../_widgets/others/loader.dart';
import '../../_widgets/others/text.dart';
import '../ble/ble_service.dart';

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
    bool isCurrentDevice = bleService.isConnected(widget.device);

    return Planet(
      onPressed: () async {
        setState(() => isConnecting = true);
        await bleService.connectDevice(widget.device);
        setState(() => isConnecting = false);
      },
      srp: true,
      padding: padC('l9,t2,b2'),
      minHeight: 40,
      child: Row(
        children: [
          // type icon
          AppIcon(Icons.lightbulb_outline, tiny: true, faded: true),
          mspw(),
          // name
          Expanded(child: AppText(widget.device.name)),
          // others
          isConnecting
              ? Padding(
                  padding: padM('r'),
                  child: AppLoader(color: styler.accent),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // connected
                    if (isCurrentDevice)
                      AppIcon(
                        Icons.check_circle,
                        size: normal,
                        color: styler.accentColor(),
                      ),
                    // not connected
                    if (!isCurrentDevice) AppText('Connect', size: small, faded: true),
                    if (!isCurrentDevice) AppIcon(Icons.arrow_forward, size: medium, faded: true, padding: padC('l6,r8')),
                    // disconnect
                    if (isCurrentDevice)
                      Planet(
                        onPressed: () => bleService.disconnectDevice(widget.device),
                        noStyling: true,
                        isRound: true,
                        margin: padS('lr'),
                        child: AppIcon(Icons.close_rounded),
                      ),
                    //
                  ],
                ),
          //
        ],
      ),
    );
  }
}
