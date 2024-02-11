import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common_variables/globals.dart';

class ErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const ErrorScreen({
    super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.2),
              child: Image.asset('assets/images/logo.png'),
            ),
            const Text(
              'Oops! Something went wrong!',
              textAlign: TextAlign.center,
              style: TextStyle(color: kDebugMode ? Colors.red : Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
            ),
            const SizedBox(height: 12),
            Text(
              errorDetails.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: kDebugMode ? Colors.red : Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
