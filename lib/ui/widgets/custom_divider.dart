import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDivider extends StatefulWidget {
  CustomDivider(
    this.title, {
    super.key,
  });
  String title;

  @override
  CustomDividerState createState() => CustomDividerState();
}

class CustomDividerState extends State<CustomDivider> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: const Divider(
              color: Colors.white,
              height: 36,
            )),
      ),
      Text(
        widget.title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: const Divider(
              color: Colors.white,
              height: 36,
            )),
      ),
    ]);
  }
}
