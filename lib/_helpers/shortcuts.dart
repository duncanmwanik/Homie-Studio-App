import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Map<ShortcutActivator, Intent> shortcuts = {
  LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.keyT): MyIntent(),
};

class MyIntent extends Intent {}
