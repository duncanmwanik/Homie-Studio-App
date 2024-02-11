import 'package:flutter/material.dart';

Future<void> showLoadingCircle(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: const [
          CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 5,
          )
        ],
      );
    },
  );
}
