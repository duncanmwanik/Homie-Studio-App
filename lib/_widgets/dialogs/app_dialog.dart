import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/helpers.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_variables/navigation.dart';
import '../buttons/planet.dart';
import '../others/blur.dart';
import '../others/icons.dart';
import '../others/others/other.dart';
import '../others/text.dart';

Future<dynamic> showAppDialog({
  dynamic title,
  Widget? content,
  List<Widget>? actions,
  EdgeInsets? titlePadding,
  EdgeInsets? contentPadding,
  bool showTitleColor = true,
  bool showClose = true,
  double? maxWidth,
}) {
  hideKeyboard();

  return showGeneralDialog<dynamic>(
    context: navigatorState.currentContext!,
    transitionDuration: const Duration(milliseconds: 300),
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: styler.isDark ? Colors.black54 : Colors.black26,
    pageBuilder: (context, animation1, animation2) => const NoWidget(),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            backgroundColor: transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            titlePadding: noPadding,
            actionsPadding: noPadding,
            contentPadding: noPadding,
            //
            content: Blur(
              radius: 8.5,
              child: Container(
                width: double.maxFinite,
                constraints: BoxConstraints(
                  maxWidth: maxWidth ?? (isPhone() ? double.infinity : webMaxDialogWidth),
                  maxHeight: 70.h,
                ),
                color: styler.secondaryColor().withOpacity(isImage() ? 0.4 : 0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    if (title != null)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          color: showTitleColor ? styler.appColor(isDark() ? 0.5 : 1) : null,
                          padding: titlePadding ?? padC(showClose ? 'l8,r4,t4,b4' : 'l8,r8,t4,b4'),
                          width: double.infinity,
                          child: Row(
                            children: [
                              // title
                              Expanded(
                                child: title.runtimeType == String
                                    ? AppText(title, color: styler.textColor(), size: mediumNormal, weight: ft5)
                                    : title,
                              ),
                              //close
                              if (showClose)
                                Planet(
                                  onPressed: () => popWhatsOnTop(),
                                  margin: padS('l'),
                                  padding: padMS(),
                                  isRound: true,
                                  noStyling: true,
                                  color: styler.appColor(0.5),
                                  child: AppIcon(closeIcon, size: 16, faded: true),
                                ),
                              //
                            ],
                          ),
                        ),
                      ),
                    // content
                    if (content != null)
                      Flexible(
                        child: Padding(
                          padding: contentPadding ?? padC('l6,r6,t6'),
                          child: content,
                        ),
                      ),
                    // actions
                    if (actions != null)
                      Padding(
                        padding: padM(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: actions,
                        ),
                      ),
                    //
                  ],
                ),
              ),
            ),
            //
          ),
        ),
      );
    },
  );
}
