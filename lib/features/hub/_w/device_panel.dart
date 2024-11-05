import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/button.dart';
import '../../../_widgets/others/icons.dart';
import '../../../_widgets/others/text.dart';
import '../../ble/state/ble.dart';
import 'dialog_connect.dart';

class DevicePanel extends StatelessWidget {
  const DevicePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BleProvider>(builder: (context, ble, child) {
      bool isConnected = ble.isConnected;

      return AppButton(
        onPressed: () => showConnectDeviceDialog(),
        color: styler.appColor(0.8),
        radius: borderRadiusTinySmall,
        showBorder: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: AppText(
                text: isConnected ? ble.connectedDevice?.platformName ?? 'Device' : 'Connect a device',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            spw(),
            if (!isConnected) AppIcon(Icons.arrow_forward, size: normal, faded: true),
            if (isConnected) AppIcon(Icons.check, size: normal, color: styler.accentColor()),
            //
          ],
        ),
      );
    });
  }
}
