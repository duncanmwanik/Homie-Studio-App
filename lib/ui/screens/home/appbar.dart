import 'package:flutter/material.dart';
import 'package:homie_ble/ui/screens/about/help_screen.dart';
import 'package:provider/provider.dart';
import '../../../state/globals.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalModel>(
        builder: (context, g, child) => AppBar(
              leading: IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Scaffold.of(context).isDrawerOpen ? null : Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
              centerTitle: true,
              title: const Image(
                image: AssetImage("assets/images/homie.png"),
                height: 22,
              ),
              actions: [
                IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HelpScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
  }
}
