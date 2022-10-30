import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff101010),
      body: ListView(
        physics: BouncingScrollPhysics(),
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
                child: Text(
                  "Quick Tutorial",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(w * 0.8, h * 0.07),
                    primary: Colors.amber, // background (button) color
                    onPrimary: Colors.white, // foreground (text) color
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    )),
                onPressed: () => Navigator.pushNamed(context, '/help'),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Row(
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(w * 0.6, h * 0.07),
                    primary: Colors.amber, // background (button) color
                    onPrimary: Colors.white, // foreground (text) color
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    )),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
