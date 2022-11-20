import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(int okay, String message) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      backgroundColor: okay == 0
          ? Colors.red
          : okay == 1
              ? Colors.green
              : Colors.white,
      textColor: Colors.black);
}
