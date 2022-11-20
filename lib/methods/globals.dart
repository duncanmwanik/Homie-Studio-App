import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/ble.dart';
import '../state/globals.dart';
import '../ui/widgets/color_circle/color_circle_lib.dart';

// --------------------------------- -------------------------- ---------------------------------
// --------------------------------- Global Variables & Methods ---------------------------------

// --------------------------------- Provider Pointers ---------------------------------
late dynamic global;
late dynamic bt;

void createProviderReferences({BuildContext? context}) {
  global = context?.watch<GlobalModel>();
  bt = context?.watch<BleModel>();
}

// --------------------------------- Device Screen Sizes ---------------------------------
// screen sizes
double h = 0;
double w = 0;

void getDeviceSize(BuildContext context) {
  // get device screen size and save them globally
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
}

// --------------------------------- Debug Print ---------------------------------
// just a way I use to easily find where an exception from a try-catch is shown on the terminal
void errorPrint(String where, var e) {
  print("!!! ERROR :: $where >> [[  $e  ]]");
}

// --------------------------------- Color Circle ---------------------------------
final colorCircleController = CircleColorPickerController(
  initialColor: Colors.white,
);

// some long texts

// ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
String baDescription = "The lamp can either be in color, pattern or music mode. "
    "You can change what the buttons 1-9 will show for each mode.";
