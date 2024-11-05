import 'dart:developer';

import 'package:flutter/foundation.dart';

void logError(String where, var e) {
  if (kDebugMode) debugPrint('APP-ERROR: ($where) ^ $e ^');
}

void show(var object) {
  if (kDebugMode) log(object.toString());
}

void safeRun(Function() operation, {String where = 'app-run', Function()? onError}) {
  try {
    operation();
  } catch (e) {
    logError(where, e);
    if (onError != null) onError();
  }
}
