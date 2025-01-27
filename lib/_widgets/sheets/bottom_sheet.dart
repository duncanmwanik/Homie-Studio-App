import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_helpers/ui.dart';
import '../../_providers/_providers.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/helpers.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_variables/navigation.dart';
import '../others/blur.dart';
import '../others/others/divider.dart';

Future<void> showAppBottomSheet({
  String? title,
  Widget? header,
  required Widget content,
  Widget? footer,
  bool flexible = false,
  bool isShort = false,
  bool isFull = false,
  bool showTopDivider = true,
  bool showBottomDivider = true,
  bool showBlur = false,
  Color? color,
  EdgeInsets? headerPadding,
  EdgeInsets? contentPadding,
  EdgeInsets? footerPadding,
  FutureOr<void> Function()? whenComplete,
  FutureOr<dynamic> Function(dynamic)? then,
}) async {
  // we record that the bottom sheet is open
  state.global.updateIsBottomSheetOpen(true);
  if (title != null) setWindowTitle(title);

  await showModalBottomSheet(
      context: navigatorState.currentContext!,
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 10,
      barrierColor: null,
      backgroundColor: transparent,
      showDragHandle: flexible,
      constraints: flexible
          ? null
          : isShort
              ? BoxConstraints(maxHeight: 70.h)
              : BoxConstraints.expand(),
      //
      builder: (context) {
        return Blur(
          child: Card(
            elevation: 0,
            color: color ?? (isImage() || isBlack() || showBlur ? white.withOpacity(0.01) : styler.primaryColor()),
            margin: noPadding,
            shape: RoundedRectangleBorder(
              borderRadius: isShort
                  ? const BorderRadius.only(topLeft: Radius.circular(borderRadiusSmall), topRight: Radius.circular(borderRadiusSmall))
                  : BorderRadius.zero,
            ),
            //
            child: Column(
              mainAxisSize: flexible ? MainAxisSize.min : MainAxisSize.max,
              children: [
                // Header ----------
                if (header != null)
                  Padding(
                    padding: headerPadding ?? EdgeInsets.only(top: 6, left: 6, right: 6),
                    child: header,
                  ),
                if (header != null) ph(6),
                if (header != null && showTopDivider) AppDivider(),
                // Content ----------
                Flexible(
                    fit: flexible ? FlexFit.loose : FlexFit.tight,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: webMaxWidth),
                      child: Padding(
                        padding: contentPadding ?? EdgeInsets.symmetric(horizontal: isPhone() ? 10 : 20),
                        child: content,
                      ),
                    )),
                // Footer ----------
                if (footer != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showBottomDivider) AppDivider(),
                      Padding(
                        padding: footerPadding ?? padS(),
                        child: footer,
                      ),
                    ],
                  )
                //
              ],
            ),
          ),
        );
      }).whenComplete(whenComplete ?? () {}).then(then ?? (_) {});

  state.global.updateIsBottomSheetOpen(false);
  changeStatusAndNavigationBarColor(getThemeType());
  if (title != null) resetWindowTitle();
}
