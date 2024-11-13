import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_providers/_providers.dart';
import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/button.dart';
import '../../../_widgets/others/icons.dart';
import '../../../_widgets/others/text.dart';
import '../../ble/ble_service.dart';
import '../../ble/state/ble.dart';

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
          AppButton(
            onPressed: () => bleService.scanDevices(),
            srp: true,
            radius: borderRadiusCrazy,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AppText(
                    text: isConnected ? ble.connectedDevice?.name ?? 'Device' : 'Connect Device',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                mpw(),
                if (!isConnected) AppIcon(Icons.arrow_forward, size: normal, faded: true),
                if (isConnected) AppIcon(Icons.check, size: normal, color: styler.accentColor()),
                //
              ],
            ),
          ),
          //
          if (isConnected)
            AppButton(
              onPressed: () => bleService.disconnectDevice(state.ble.connectedDevice!),
              margin: padS('l'),
              noStyling: true,
              srp: true,
              child: AppIcon(Icons.close, faded: true),
            ),
          //
        ],
      );
    });
  }
}
