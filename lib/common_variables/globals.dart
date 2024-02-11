import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/home/views/colors/widgets/color_circle_lib.dart';

// screen sizes
double h = 0;
double w = 0;

// global data storage instance with shared_preferences
late SharedPreferences sharedsharedPrefs;

final colorCircleController = CircleColorPickerController(
  initialColor: Colors.white,
);

final GlobalKey<ScaffoldState> homeX = GlobalKey();
