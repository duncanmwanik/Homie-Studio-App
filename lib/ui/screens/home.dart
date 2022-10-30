import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/ui/pageviews/button_assignment.dart';
import 'package:homie_ble/ui/pageviews/favorites.dart';
import 'package:homie_ble/ui/widgets/appbar.dart';
import 'package:homie_ble/ui/widgets/info_banner.dart';
import 'package:homie_ble/ui/widgets/bottom_navbar.dart';
import 'package:homie_ble/ui/widgets/brightness_slider.dart';
import 'package:homie_ble/ui/pageviews/color_options.dart';
import 'package:homie_ble/ui/screens/device_picker.dart';
import 'package:homie_ble/ui/widgets/drawer.dart';
import 'package:homie_ble/ui/pageviews/effects_options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Get current state of Bluetooth and listen for state changes
    FlutterBlue.instance.state.listen((event) {
      if (event == BluetoothState.on) {
        bleWatch.updateBtState(true);
      }
      if (event == BluetoothState.off) {
        bleWatch.updateBtState(false);
        notifyUser(0, "Bluetooth is off");
      }
    });

    checkForConnectedDevices();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get device dimensions only once and set them globally
    getDeviceSize(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff101010),
      appBar: const MyAppBar(),
      drawer: const DrawerClass(),
      bottomNavigationBar: bottomNavigationBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
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
                  effectOptions(),

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
    );
  }
}
