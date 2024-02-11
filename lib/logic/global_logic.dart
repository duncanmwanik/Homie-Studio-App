import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common_variables/globals.dart';

void getDeviceSize(BuildContext context) {
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
}

// --------------------------------- Debug Print
// just a way I use to easily find where an error is thrown

void removeLoadingCircle(BuildContext context) {
  Navigator.pop(context);
}

void errorPrint(String where, var e) {
  if (kDebugMode) {
    debugPrint('APP-ERROR: ($where) > $e <');
  }
}
