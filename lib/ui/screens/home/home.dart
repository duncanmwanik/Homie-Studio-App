import 'dart:async';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../../methods/ble.dart';
import '../../../methods/navigation.dart';
import '../../../methods/globals.dart';
import 'pageviews/button.dart';
import 'pageviews/color.dart';
import 'pageviews/music.dart';
import 'pageviews/pattern.dart';
import 'pageviews/favorites.dart';
import '../../theme/theme.dart';
import 'appbar.dart';
import 'bottom_navbar.dart';
import '../../widgets/brightness_slider.dart';
import 'drawer.dart';
import '../../widgets/info_banner.dart';
import '../../widgets/toast/toast.dart';
import '../ble/device_picker.dart';

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
          const DevicePicker(),

          // brighness slider
          brightnessSlider(),

          GestureDetector(
            onHorizontalDragEnd: (details) => changePageView(details),
            child: ExpandablePageView(
                controller: pageController,
                pageSnapping: false,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  // patterns
                  patternOptions(),

                  // music
                  musicOptions(),

                  // colors
                  colorOptions(),

                  // favorites
                  favoritesPage(),

                  // button assignment
                  buttonAssignment()
                ]),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   print(pageController.page);
      // }),
    );
  }
}
