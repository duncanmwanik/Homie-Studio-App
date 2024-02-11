import 'package:flutter/material.dart';

import '../../common_variables/globals.dart';
import '../../logic/global_logic.dart';
import '../../theme/theme.dart';
import '../devices/device_management_panel.dart';
import 'views/patterns/widgets/pattern_color_fab.dart';
import 'widgets/appbar.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/brightness_slider.dart';
import 'widgets/drawer.dart';
import 'widgets/option_views.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // Timer? timer;

  @override
  void initState() {
    super.initState();

    // Get current state of Bluetooth and listen for state changes
    // FlutterBluePlus.listen((event) {
    //   if (event == BluetoothState.on) {
    //     bleWatch.updateBtState(true);
    //   }
    //   if (event == BluetoothState.off) {
    //     bleWatch.updateBtState(false);
    //     disconnectFromSelectedDevice(bleWatch.device);
    //     showToast(0, "Bluetooth is off");
    //   }
    // });

    // checkForAlreadyConnectedDevices();

    // timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
    //   checkForAlreadyConnectedDevices();
    // });
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get device dimensions only once and set them globally
    getDeviceSize(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: primaryColor,
      appBar: const HomeAppbar(),
      drawer: const DrawerClass(),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          shrinkWrap: true,
          children: [
            // ConnectionStatusBanner(),
            SizedBox(height: 10),
            DeviceManagementPanel(),
            DeviceBrightnessSlider(),
            OptionViews(),
          ],
        ),
      ),
      floatingActionButton: changePatternColorFAB(),
      bottomNavigationBar: bottomNavigationBar(),
      key: homeX,
    );
  }
}
