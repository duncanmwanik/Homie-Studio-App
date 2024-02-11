import 'package:flutter/material.dart';

class ColorObject {
  const ColorObject({required this.title, required this.color, required this.hex});
  final String title;
  final Color color;
  final String hex;
}

const List<ColorObject> colorList = <ColorObject>[
  ColorObject(title: 'Red', color: Color.fromRGBO(255, 0, 0, 1.0), hex: "0xff0000"),
  ColorObject(title: 'Green', color: Color.fromRGBO(0, 255, 0, 1.0), hex: "0x00ff00"),
  ColorObject(title: 'Blue', color: Color.fromRGBO(0, 0, 255, 1.0), hex: "0x0000ff"),
  ColorObject(title: 'White', color: Color.fromRGBO(255, 255, 255, 1.0), hex: "0xffffff"),
  ColorObject(title: 'Pink', color: Color.fromRGBO(255, 0, 86, 1.0), hex: "0xff0056"),
  ColorObject(title: 'Orange', color: Color.fromRGBO(255, 165, 0, 1.0), hex: "0xffa500"),
  ColorObject(title: 'Indigo', color: Color.fromRGBO(75, 0, 130, 1.0), hex: "0x4b0082"),
  ColorObject(title: 'Yellow', color: Color.fromRGBO(255, 255, 0, 1.0), hex: "0xffff00"),
  ColorObject(title: 'Aqua', color: Color.fromRGBO(0, 255, 255, 1.0), hex: "0x00ffff"),
  ColorObject(title: 'Kawabanga', color: Color.fromRGBO(255, 0, 17, 1.0), hex: "0xff0011"),
  ColorObject(title: 'Black', color: Colors.black, hex: "0x000000"),
  ColorObject(title: 'Brown', color: Color.fromRGBO(165, 42, 42, 1.0), hex: "0xa52a2a"),
  ColorObject(title: 'Magenta', color: Color.fromRGBO(255, 0, 255, 1.0), hex: "0xff00ff"),
  ColorObject(title: 'Flash', color: Color.fromRGBO(180, 29, 0, 1.0), hex: "0xff1d00"),
];

List<String> buttonColors = ["0xff0000", "0x00ff00", "0x0000ff", "0xffffff", "0xffff00", "0x00ffff", "0xffa500", "0xff00ff", "0x4b0082"];
