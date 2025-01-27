import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/planet.dart';
import '../../_widgets/others/icons.dart';
import '../../_widgets/others/text.dart';
import '../ble/state/ble.dart';
import 'device_menu.dart';
import 'devices_sheet.dart';

class DevicePanel extends StatelessWidget {
  const DevicePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BleProvider>(builder: (context, ble, child) {
      bool isConnected = ble.isConnected;

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          Planet(
            onPressed: () => showDevicesSheet(),
            radius: borderRadiusCrazy,
            srp: true,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // name
                Flexible(
                  child: AppText(
                    isConnected ? ble.connectedDevice?.name ?? 'Device' : 'Connect device',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // dropdown
                AppIcon(
                  Icons.arrow_drop_down,
                  size: extra,
                  faded: true,
                  padding: padM('l'),
                ),
                //
              ],
            ),
          ),
          // connected  icon
          if (isConnected)
            AppIcon(
              Icons.check_circle,
              size: medium,
              color: styler.accentColor(),
              padding: padM('l'),
            ),
          //
          if (isConnected) DeviceOptions(),
          //
        ],
      );
    });
  }
}
