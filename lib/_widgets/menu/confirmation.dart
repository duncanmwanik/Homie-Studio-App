import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/spacing.dart';
import '../buttons/action.dart';
import '../buttons/button.dart';
import '../others/text.dart';
import 'menu_item.dart';

List<Widget> confirmationMenu({
  String? title,
  String? content,
  String? yeslabel,
  required Function() onConfirm,
}) {
  return [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        Flexible(
            child: AppButton(
          noStyling: true,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: double.infinity,
          child: AppText(text: title ?? 'Delete item?'),
        )),
        menuDivider(),
        //
        if (content != null)
          Flexible(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: AppText(text: content, faded: true),
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
                  onConfirm();
                }),
          ],
        ),
      ],
    ),
  ];
}
