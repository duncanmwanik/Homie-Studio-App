import 'package:flutter/material.dart';

Widget build({required BuildContext context, required String message}) {
  return AlertDialog(
    backgroundColor: const Color(0xff202020),
    elevation: 4,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
    title: Text(
      message,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: const TextStyle(fontFamily: 'ub', fontWeight: FontWeight.bold, color: Colors.white),
    ),
    actions: [
      //---- Decline button
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'No',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                )),
          ),
          //------------- Accept button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                )),
          ),
        ],
      ),
    ],
  );
}
