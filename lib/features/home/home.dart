// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../_helpers/background_ops.dart';
import '../../_helpers/navigation.dart';
import '../../_variables/navigation.dart';
import 'drawer/drawer.dart';
import 'layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) => onResumedAppState(state);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // initializeUserSync();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // disposeSpaceSync();
    // disposeUserSync();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return WillPopScope(
        onWillPop: () => confirmExitApp(),
        child: Scaffold(
          body: AppLayout(),
          drawer: AppDrawer(),
          key: scaffoldState,
        ),
      );
    });
  }
}
