import 'dart:math';

import 'package:flutter/material.dart';
import 'package:homie_ble/ui/settings/about_app_screen.dart';
import 'package:provider/provider.dart';

import '../../common_variables/globals.dart';
import '../../state/theme_state.dart';
import '../../theme/theme.dart';
import 'widgets/theme_option.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, theme, child) => Scaffold(
              extendBody: true,
              backgroundColor: const Color(0xff121212),
              appBar: AppBar(
                backgroundColor: Color(0xff121212),
                title: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "App Theme",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Container(
                    // width: w,
                    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor,
                        boxShadow: const [BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)]),
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
                  ListTile(
                      dense: true,
                      visualDensity: VisualDensity(vertical: 3),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AboutAppScreen()),
                        );
                      },
                      tileColor: themeColors[theme.selectedTheme],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      leading: Icon(
                        Icons.device_hub,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: Text("About App", style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w700)),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                ],
              ),
            ));
  }
}
