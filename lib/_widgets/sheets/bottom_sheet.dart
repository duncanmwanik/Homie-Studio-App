import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_helpers/navigation.dart';
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
  bool isShort = false,
  bool isFloater = false,
  bool isFull = false,
  bool showTopDivider = true,
  bool showBottomDivider = true,
  bool showBlur = false,
  Color? color,
  bool noContentHorizontalPadding = false,
  FutureOr<void> Function()? whenComplete,
  FutureOr<dynamic> Function(dynamic)? then,
}) async {
  // we record that the bottom sheet is open
  state.global.updateIsBottomSheetOpen(true);
  changeStatusAndNavigationBarColor(getThemeType(), isSecondary: true);
  if (title != null) setWindowTitle(title);

  await showModalBottomSheet(
      context: navigatorState.currentContext!,
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 10,
      barrierColor: null,
      backgroundColor: transparent,
      constraints: BoxConstraints(
        maxHeight: isShort ? 70.h : double.infinity,
        maxWidth: isFull ? double.maxFinite : webMaxWidth / (isFloater ? 1.5 : 1),
      ),
      //
      builder: (context) {
        return Blur(
          blur: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //
              if (!isFull && showFloatingSheet())
                GestureDetector(onTap: () => popWhatsOnTop(), child: Container(height: 50, color: transparent)),
              //
              Flexible(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Blur(
                    borderRadius: isFull
                        ? BorderRadius.zero
                        : isShort
                            ? BorderRadius.only(topLeft: Radius.circular(borderRadiusSmall), topRight: Radius.circular(borderRadiusSmall))
                            : showFloatingSheet()
                                ? BorderRadius.circular(borderRadiusTinySmall)
                                : BorderRadius.zero,
                    child: Card(
                      elevation: 0,
                      color: color ?? (isImage() || isBlack() || showBlur ? white.withOpacity(0.1) : styler.primaryColor()),
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: isFull
                            ? BorderRadius.zero
                            : isShort
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(borderRadiusSmall), topRight: Radius.circular(borderRadiusSmall))
                                : showFloatingSheet()
                                    ? BorderRadius.circular(borderRadiusTinySmall)
                                    : BorderRadius.zero,
                      ),
                      //
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Header ----------
                          if (header != null) Padding(padding: EdgeInsets.only(top: 6, left: 6, right: 6), child: header),
                          if (header != null) ph(6),
                          if (header != null && showTopDivider) AppDivider(),
                          // Content ----------
                          isFloater
                              ? Flexible(
                                  child: Padding(
                                  padding: noContentHorizontalPadding ? noPadding : EdgeInsets.symmetric(horizontal: isPhone() ? 10 : 20),
                                  child: content,
                                ))
                              : Expanded(
                                  child: Padding(
                                  padding:
                                      noContentHorizontalPadding ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: isPhone() ? 10 : 20),
                                  child: content,
                                )),
                          // Footer ----------
                          if (footer != null)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (showBottomDivider) AppDivider(),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6), child: footer),
                              ],
                            )
                          //
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //
              if (!isFull && showFloatingSheet())
                GestureDetector(onTap: () => popWhatsOnTop(), child: Container(height: 50, color: transparent)),
              //
            ],
          ),
        );
      }).whenComplete(whenComplete ?? () {}).then(then ?? (_) {});

  state.global.updateIsBottomSheetOpen(false);
  changeStatusAndNavigationBarColor(getThemeType());
  if (title != null) resetWindowTitle();
}
