import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../_providers/_providers.dart';
import '../_variables/global.dart';
import '../_variables/navigation.dart';
import '../_widgets/others/snackbar.dart';

void hideKeyboard() {
  try {
    FocusManager.instance.primaryFocus?.unfocus();
  } catch (_) {}
}

void removeFocus() {
  try {
    FocusScope.of(navigatorState.currentContext!).requestFocus(FocusNode());
  } catch (_) {}
}

void onBuildOperation(Function()? operation) {
  WidgetsBinding.instance.addPostFrameCallback((_) => operation);
}

String getNavigationItemTitle(String type) {
  return '${type.substring(0, 1).toUpperCase()}${type.substring(1)}';
}

void popWhatsOnTop({dynamic value, void Function()? todo, void Function()? todoLast}) {
  if (todo != null) todo();
  if (navigatorState.currentContext!.canPop()) navigatorState.currentContext!.pop(value);
  if (todoLast != null) todoLast();
}

void closeDialog() => popWhatsOnTop();
void closeAllSnackBars() => ScaffoldMessenger.of(navigatorState.currentContext!).clearSnackBars();

void closeBottomSheetIfOpen() {
  if (state.global.isBottomSheetOpen) {
    popWhatsOnTop();
    state.global.updateIsBottomSheetOpen(false);
  }
}

Future<void> closeDrawerIfOpened() async {
  scaffoldState.currentState?.closeDrawer();
  scaffoldState.currentState?.closeEndDrawer();
}

void openDrawer() => scaffoldState.currentState!.openDrawer();
void openEndDrawer() => scaffoldState.currentState!.openEndDrawer();
bool isDrawerOpened() => scaffoldState.currentState?.isDrawerOpen == true;

Future<bool> confirmExitApp() async {
  if (isDrawerOpened()) {
    closeDrawerIfOpened();
    return false;
  } else {
    if (exitApp) {
      return true;
    } else {
      exitApp = true;
      showSnackBar('Tap again to exit...');
      Future.delayed(const Duration(seconds: 5), () {
        exitApp = false;
      });
      return false;
    }
  }
}
