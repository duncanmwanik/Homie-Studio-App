import 'package:flutter/material.dart';

import '../../_models/menu.dart';
import '../../_providers/_providers.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/planet.dart';
import '../../_widgets/menu/menu_item.dart';
import '../../_widgets/others/icons.dart';
import '../ble/ble_service.dart';

class DeviceOptions extends StatelessWidget {
  const DeviceOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Planet(
      menu: Menu(items: [
        MenuItem(
          leading: Icons.edit,
          label: 'Edit Details',
          onTap: () {},
        ),
        MenuItem(
          leading: Icons.close,
          label: 'Disconnect',
          onTap: () => bleService.disconnectDevice(state.ble.connectedDevice!),
        ),
      ]),
      margin: padS('l'),
      noStyling: true,
      isRound: true,
      srp: true,
      child: AppIcon(moreIcon, faded: true),
    );
  }
}
