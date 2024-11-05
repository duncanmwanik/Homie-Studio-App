import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_providers/_providers.dart';
import '../../_variables/navigation.dart';
import 'custom_menu.dart';

void showAppMenu(Offset offset, List<Widget> items, {double? width, bool keepMenuPosition = false}) async {
  double left = offset.dx;
  double top = offset.dy;

  RelativeRect position =
      keepMenuPosition ? state.global.menuPosition : RelativeRect.fromLTRB(left, top + 25, 100.w - offset.dx - 30, 100.h - offset.dy);

  state.global.updateMenuPosition(position);

  await showCustomMenu(
    context: navigatorState.currentState!.context,
    position: position,
    constraints: BoxConstraints(minWidth: width ?? 200, maxWidth: 300, maxHeight: 400),
    items: [
      for (Widget item in items) CustomPopupMenuItem(child: item),
    ],
  );
}
