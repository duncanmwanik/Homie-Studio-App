import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_models/menu.dart';
import '../../_providers/_providers.dart';
import '../../_variables/navigation.dart';
import 'custom_menu.dart';

void showAppMenu(Offset offset, Menu? menu) async {
  if (menu != null) {
    double left = offset.dx;
    double top = offset.dy;

    RelativeRect position = menu.keepMenuPosition
        ? state.global.menuPosition
        : RelativeRect.fromLTRB(left, top + 25, 100.w - offset.dx - 30, 100.h - offset.dy);

    state.global.updateMenuPosition(position);

    await showCustomMenu(
      context: navigatorState.currentState!.context,
      position: position,
      constraints: BoxConstraints(minWidth: menu.width ?? 200, maxWidth: 300, maxHeight: 400),
      items: [
        for (Widget item in menu.items) CustomPopupMenuItem(child: item),
      ],
    );
  }
}
