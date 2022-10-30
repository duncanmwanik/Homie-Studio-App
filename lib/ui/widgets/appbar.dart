import 'package:flutter/material.dart';
import 'package:homie_ble/models/style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: const Text(
      //   "Homie Studio",
      //   style: TextStyle(fontWeight: FontWeight.bold),
      // ),
      centerTitle: true,
      title: const Image(
        image: AssetImage("assets/images/homie.png"),
        height: 25,
      ),
      actions: [
        IconButton(
            splashRadius: 20,
            splashColor: themeColor,
            onPressed: () {
              // Navigator.pushNamed(context, '/help');
            },
            icon: const Icon(Icons.help_rounded))
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
