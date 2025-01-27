import 'package:flutter/material.dart';

class Menu {
  Menu({
    this.offset,
    this.width,
    this.keepMenuPosition = false,
    this.pop = false,
    required this.items,
  });

  Offset? offset;
  double? width;
  bool keepMenuPosition;
  bool pop;
  List<Widget> items;

  bool isValid() => items.isNotEmpty;
}
