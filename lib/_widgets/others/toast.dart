import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_theme/breakpoints.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/button.dart';
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
      alignment: isTabAndBelow() ? Alignment.bottomCenter : Alignment.bottomLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 380),
        margin: EdgeInsets.symmetric(
          horizontal: isTabAndBelow() ? 5.w : 15,
          vertical: isTabAndBelow() ? 10 : 15,
        ),
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: styler.tertiaryColor(),
          borderRadius: BorderRadius.circular(borderRadiusTinySmall),
          // boxShadow: isDark()
          //     ? null
          //     : [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.3),
          //           spreadRadius: 1,
          //           blurRadius: 1.5,
          //           offset: const Offset(0, 0),
          //         )
          //       ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //
            AppButton(
              noStyling: true,
              isRound: true,
              padding: padS(),
              child: AppIcon(toastIcons[type], color: color ?? toastColors[type]),
            ),
            spw(),
            // text
            Expanded(child: Padding(padding: const EdgeInsets.only(top: 3), child: AppText(text: message))),
            // close
            spw(),
            AppButton(
              onPressed: () => closeToast(),
              noStyling: true,
              isSquare: true,
              padding: padS(),
              child: const AppIcon(Icons.close, size: 18),
            ),
            //
          ],
        ),
      ),
    ),
  );
}
