import 'package:flutter/material.dart';

class EmptyDevices extends StatelessWidget {
  const EmptyDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Icon(Icons.question_mark_rounded, size: 150),
            // Image.asset(
            //   'assets/images/icon.png',
            //   width: 150,
            //   height: 150,
            // ),
            // mediumSpacerHeight(),
            // MediumText(text: 'No boards found', faded: true),
            // mediumSpacerHeight(),
            // SmallText(
            //   text: 'Hey, try this:\n\n- Check if your board is powered on.\n...\n- If the low-battery light is on, connect to a usb with power.\n...\n- Tap the refresh button below.',
            //   textAlign: TextAlign.center,
            //   faded: true,
            // ),
          ],
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          color: Colors.red,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
