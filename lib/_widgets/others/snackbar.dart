import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/variables.dart';
import '../../_variables/navigation.dart';
import '../buttons/planet.dart';
import 'icons.dart';
import 'text.dart';
import 'toast.dart';

void showSnackBar(String message) {
  try {
    // we show the snackbar only for mobile size
    if (isPhone()) {
      ScaffoldMessenger.of(navigatorState.currentContext!).clearSnackBars();
      ScaffoldMessenger.of(navigatorState.currentContext!).showSnackBar(
        // TODOs: check for color
        SnackBar(
          padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
          content: Row(
            children: [
              // message
              Expanded(child: AppText(message)),
              // close
              Planet(
                onPressed: () => closeAllSnackBars(),
                noStyling: true,
                child: AppIcon(closeIcon, color: styler.invertedTextColor()),
              )
              //
            ],
          ),
        ),
      );
    } else {
      showToast(2, message);
    }
  } catch (_) {}
}
