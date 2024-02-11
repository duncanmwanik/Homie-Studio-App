import 'package:flutter/material.dart';

import 'ble_service.dart';

class BleFab extends StatelessWidget {
  const BleFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      elevation: 0,
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () => bleService.scanForDevices(),
      child: Icon(Icons.refresh_rounded, color: Colors.white),
    );
  }
}
