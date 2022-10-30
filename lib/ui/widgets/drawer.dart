import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';

// ignore: must_be_immutable
class DrawerClass extends StatefulWidget {
  const DrawerClass({
    super.key,
  });

  @override
  DrawerClassState createState() => DrawerClassState();
}

class DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        // shape: const RoundedRectangleBorder(),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff151515),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: h * 0.05),

              // ---------- Back button
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 30,
                    color: Colors.white,
                  )),

              SizedBox(height: h * 0.06),

              // ---------- Bonga Lamp
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(w / 3, 50),
                      backgroundColor: Colors.amber, // background (button) color
                      foregroundColor: Colors.white, // foreground (text) color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "App Guide",
                    style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                ),
              ),

              // ---------- About Homie Studio Kenya
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(w / 3, 50),
                      backgroundColor: Colors.amber, // background (button) color
                      foregroundColor: Colors.white, // foreground (text) color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, '/homie');
                  },
                  child: const Text(
                    "Homie Studio",
                    style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
