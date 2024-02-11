import 'package:flutter/material.dart';

import '../../../common_variables/globals.dart';
import '../../../common_variables/state_providers.dart';
import '../../../theme/theme.dart';

// ignore: must_be_immutable
class DrawerClass extends StatefulWidget {
  const DrawerClass({
    super.key,
  });

  @override
  DrawerClassState createState() => DrawerClassState();
}

class DrawerClassState extends State<DrawerClass> {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: secondaryColor, statusBarColor: primaryColor));
  // }
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  Widget jobTile({required String title, required IconData icon, required GestureTapCallback onPress}) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: themeColors[themeWatch.selectedTheme],
            foregroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(child: Text(title, style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w800))),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: h * 0.05, bottom: 20),
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                height: h * 0.2,
              ),
            ),

            // ---------- Master Play
            jobTile(title: "Master Play", icon: Icons.device_hub, onPress: () {}),

            // ---------- About Homie Studio Kenya
            jobTile(title: "App Guide", icon: Icons.help, onPress: () {}),
          ],
        ),
      ),
    );
  }
}
