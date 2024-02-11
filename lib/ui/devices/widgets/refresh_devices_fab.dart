import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../../common_variables/state_providers.dart';
import '../../../theme/theme.dart';

Widget refreshBLEScanFAB() {
  return FloatingActionButton(
      backgroundColor: themeColors[themeWatch.selectedTheme],
      child: const Icon(Icons.refresh_rounded, color: Colors.black),
      onPressed: () {
        FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
      });
}
