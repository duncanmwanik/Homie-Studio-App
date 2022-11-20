import 'package:flutter/material.dart';
import 'package:homie_ble/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../state/globals.dart';

Widget backButton(BuildContext context) {
  return Consumer<GlobalModel>(
      builder: (context, g, child) => IconButton(
          onPressed: () => Navigator.pop(context),
          splashRadius: 20,
          icon: Icon(
            Icons.cancel,
            color: themeColors[g.themeNo],
          )));
}
