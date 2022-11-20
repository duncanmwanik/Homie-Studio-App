import 'package:flutter/material.dart';

import '../../../methods/globals.dart';

class HomieGallery extends StatefulWidget {
  const HomieGallery({super.key});

  @override
  HomieGalleryState createState() => HomieGalleryState();
}

class HomieGalleryState extends State<HomieGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0x00121212),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.3),
            child: Image.asset(
              "images/icon.png",
              fit: BoxFit.fitWidth,
              // height: h * 0.,
            ),
          ),
        ],
      ),
    );
  }
}
