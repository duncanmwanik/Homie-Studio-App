import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_models/menu.dart';
import '../../_theme/spacing.dart';
import '../buttons/action.dart';
import '../buttons/planet.dart';
import '../others/text.dart';
import 'menu_item.dart';

Menu confirmationMenu({
  String? title,
  String? content,
  String? yeslabel,
  required Function() onAccept,
}) {
  return Menu(items: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        Flexible(
            child: Planet(
          noStyling: true,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: double.infinity,
          child: AppText(title ?? 'Delete item?'),
        )),
        menuDivider(),
        //
        if (content != null)
          Flexible(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: AppText(content, faded: true),
          )),
        //
        mph(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ActionButton(isCancel: true),
            ActionButton(
                label: yeslabel ?? 'Delete',
                onPressed: () {
                  popWhatsOnTop();
                  onAccept();
                }),
          ],
        ),
      ],
    ),
  ]);
}
