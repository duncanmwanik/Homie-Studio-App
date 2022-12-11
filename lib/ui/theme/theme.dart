import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF121212);
const Color secondaryColor = Color(0xFF222222);

List<Color> themeColors = [Colors.red, Colors.greenAccent, Colors.amber, Colors.blueAccent, Colors.purpleAccent];

Decoration deco = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: secondaryColor,
    boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]);
