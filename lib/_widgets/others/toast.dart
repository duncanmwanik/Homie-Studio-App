import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_theme/breakpoints.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/planet.dart';
import 'icons.dart';
import 'text.dart';

void showToast(int type, String message, {int duration = 3500, Color? color, bool smallTopMargin = false}) {
  late CancelFunc cancel;

  void closeToast() => cancel();

  cancel = BotToast.showAttachedWidget(
    allowClick: true,
    target: const Offset(0, 0),
    duration: Duration(milliseconds: duration),
    attachedBuilder: (_) => Align(
      alignment: !isSmallPC() ? Alignment.topCenter : Alignment.topRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 380),
        margin: EdgeInsets.symmetric(
          horizontal: !isSmallPC() ? 5.w : 15,
          vertical: !isSmallPC() ? 10 : 15,
        ),
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: styler.tertiaryColor(),
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //
            Planet(
              isRound: true,
              padding: padS(),
              margin: padMS('r'),
              color: styler.appColor(0.5),
              child: AppIcon(toastIcons[type], color: color ?? toastColors[type]),
            ),
            // text
            Expanded(
              child: AppText(message, padding: padS('t')),
            ),
            // close
            Planet(
              onPressed: () => closeToast(),
              isRound: true,
              noStyling: true,
              margin: padS('l'),
              padding: padS(),
              child: const AppIcon(Icons.close, size: 18, faded: true),
            ),
            //
          ],
        ),
      ),
    ),
  );
}
