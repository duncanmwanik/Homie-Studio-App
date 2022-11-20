import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homie_ble/ui/theme/theme.dart';
import 'package:homie_ble/ui/widgets/toast/toast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../methods/globals.dart';
import '../../../state/globals.dart';
import '../../widgets/back_button.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  HelpScreenState createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> with TickerProviderStateMixin {
  late AnimationController animationController1;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    // for the Homie Studio logo animation
    animationController1 = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    animation1 = Tween<double>(begin: 0, end: pi * 2).animate(animationController1);
  }

  @override
  void dispose() {
    super.dispose();
    animationController1.dispose();
  }

  Widget ruler(double height) {
    return Consumer<GlobalModel>(
        builder: (context, g, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: height,
                  width: 8,
                  decoration: BoxDecoration(
                    color: themeColors[g.themeNo],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: null,
                ),
              ],
            ));
  }

  Widget themeOption(int value, Color color) {
    return Consumer<GlobalModel>(
        builder: (context, g, child) => Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: g.themeNo == value ? Colors.white : Colors.transparent),
                ),
                ElevatedButton(
                  onPressed: () {
                    g.updateThemeColor(value);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  child: null,
                ),
              ],
            ));
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
              ruler(h * 0.05),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.2),
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
                    toast(2, "Oops! Maybe next time...");
                    // throw 'Could not launch $url';
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                child: const Text(
                  'Visit Website',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ruler(h * 0.1),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              "App Theme",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Container(
            width: w,
            color: Colors.white10,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                themeOption(0, Colors.red),
                themeOption(1, Colors.greenAccent),
                themeOption(2, Colors.amber),
                themeOption(3, Colors.blueAccent),
                themeOption(4, Colors.purpleAccent),
              ],
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
