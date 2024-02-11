import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common_variables/globals.dart';
import '../../widgets/back_button.dart';
import '../../widgets/other_widgets.dart';
import '../../widgets/toast/toast.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  AboutAppScreenState createState() => AboutAppScreenState();
}

class AboutAppScreenState extends State<AboutAppScreen> with TickerProviderStateMixin {
  late AnimationController animationController1;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    // for the Homie Studio logo animation
    animationController1 = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    animation1 = Tween<double>(begin: 0, end: pi * 2).animate(animationController1);
  }

  @override
  void dispose() {
    super.dispose();
    animationController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff121212),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: backButton(context),
              ),
              ruler(8, h * 0.05, 10),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.2, vertical: 10),
            child: GestureDetector(
              onTap: (() => animationController1.forward(from: 0)),
              child: AnimatedBuilder(
                animation: animation1,
                child: const Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: animation1.value,
                    child: Container(
                      child: child,
                    ),
                  );
                },
              ),
            ),
          ),
          const Text(
            "[ Homie Studio Kenya ]",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white30,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  const url = 'https://homiestudiokenya.web.app';
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url, mode: LaunchMode.externalApplication);
                  } else {
                    showToast(2, "Oops! Maybe next time...");
                    // throw 'Could not launch $url';
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: const Text(
                  'Visit Website',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ruler(8, h * 0.1, 10),
          const Text(
            "Some more text about app.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white30,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
        ],
      ),
    );
  }
}
