import 'package:flutter/material.dart';

import '../../../methods/globals.dart';
import '../../theme/theme.dart';

// ignore: must_be_immutable
class DrawerClass extends StatefulWidget {
  const DrawerClass({
    super.key,
  });

  @override
  DrawerClassState createState() => DrawerClassState();
}

class DrawerClassState extends State<DrawerClass> {
  Widget jobTile({required String title, required IconData icon, required GestureTapCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: themeColors[global.themeNo],
      child: ListTile(
          dense: true,
          visualDensity: VisualDensity(vertical: 3),
          onTap: onTap,
          tileColor: themeColors[global.themeNo],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(
            icon,
            size: 25,
            color: Colors.black,
          ),
          title: Text(title, style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w800)),
          trailing: Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Colors.black,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: h * 0.15),

              // ---------- Master Play
              jobTile(title: "Master Play", icon: Icons.device_hub, onTap: () {}),

              // ---------- About Homie Studio Kenya
              jobTile(title: "App Guide", icon: Icons.help, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
