import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/global_state.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalModel>(
        builder: (context, g, child) => AppBar(
              leading: IconButton(
                  splashRadius: 20,
                  // onPressed: () {
                  //   Scaffold.of(context).isDrawerOpen ? null : Scaffold.of(context).openDrawer();
                  // },
                  onPressed: null,
                  icon: Icon(
                    Icons.view_agenda_rounded,
                    color: Colors.transparent,
                  )),
              centerTitle: true,
              title: Image(
                image: AssetImage("assets/images/homie.png"),
                fit: BoxFit.fitWidth,
                width: 60,
              ),
              actions: [
                // IconButton(
                //     splashRadius: 20,
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => const SettingsScreen()),
                //       );
                //     },
                //     icon: Icon(
                //       Icons.settings,
                //       color: Colors.white,
                //     ))
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
  }
}
