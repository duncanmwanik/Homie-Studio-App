import 'package:flutter/material.dart';

extension StringExtentions on String {
  String cap() => length > 1 ? '${this[0].toUpperCase()}${substring(1)}' : toUpperCase();
  Color color() => Color(int.tryParse('0xff${substring(2)}') ?? 0xffffffff);
  bool isValid() => trim().isNotEmpty;
}
