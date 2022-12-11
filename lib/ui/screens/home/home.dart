import 'dart:async';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../../methods/ble.dart';
import '../../../methods/navigation.dart';
import '../../../methods/globals.dart';
import 'brightness_slider.dart';
import 'pageviews/button_set/button_view.dart';
import 'pageviews/colors/color_view.dart';
import 'pageviews/music/music_view.dart';
import 'pageviews/patterns/pattern_view.dart';
import 'pageviews/favorites/favorites_view.dart';
import '../../theme/theme.dart';
import 'appbar.dart';
import 'bottom_navbar.dart';
import 'drawer.dart';
import 'info_banner.dart';
import '../../widgets/toast/toast.dart';
import '../devices/device_control.dart';
import 'pageviews/patterns/pattern_color_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // Get current state of Bluetooth and listen for state changes
    FlutterBlue.instance.state.listen((event) {
      if (event == BluetoothState.on) {
        bt.updateBtState(true);
      }
      if (event == BluetoothState.off) {
        bt.updateBtState(false);
        toast(0, "Bluetooth is off");
      }
    });

    checkForConnectedDevices();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (bt.btState && !bt.connected) {
        checkForConnectedDevices();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get device dimensions only once and set them globally
    getDeviceSize(context);

    return Scaffold(
        extendBody: true,
        backgroundColor: primaryColor,
        appBar: const MyAppBar(),
        drawer: const DrawerClass(),
        bottomNavigationBar: bottomNavigationBar(),
        body: ListView(
          // shrinkWrap: true,
          children: [
            // bluetooth-off banner
            notConnectedBanner(),

            // device picker
            const DeviceControl(),

            // brighness slider
            brightnessSlider(),

            GestureDetector(
              onHorizontalDragEnd: (details) => changePageViewOnSwipe(details),
              child: ExpandablePageView(
                  controller: pageController,
                  pageSnapping: false,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    // patterns
                    patternOptions(context),

                    // music
                    musicOptions(context),

                    // colors
                    colorOptions(context),

                    // favorites
                    favoritesPage(context),

                    // button assignment
                    buttonAssignment()
                  ]),
            ),
          ],
        ),
        floatingActionButton: patternColorFab());
  }
}
