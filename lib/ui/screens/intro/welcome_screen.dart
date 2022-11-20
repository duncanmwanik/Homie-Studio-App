import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff101010),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: h * 0.1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.3),
            child: Image.asset(
              "images/icon.png",
              fit: BoxFit.fitWidth,
              // height: h * 0.,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.3, vertical: 10),
            child: Image.asset(
              "images/homie.png",
              fit: BoxFit.fitWidth,
              // height: h * 0.,
            ),
          ),
          SizedBox(
            height: h * 0.32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(w * 0.8, h * 0.07),
                    backgroundColor: Colors.amber, // background (button) color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                onPressed: () => Navigator.pushNamed(context, '/help'),
                child: const Text(
                  "Quick Tutorial",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(w * 0.6, h * 0.07),
                    backgroundColor: Colors.amber, // background (button) color
                    foregroundColor: Colors.white, // foreground (text) color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, "/home", (Route<dynamic> route) => false);
                },
                child: Row(
                  children: const [
                    Text(
                      "Skip",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
