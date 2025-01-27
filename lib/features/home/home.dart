import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../_helpers/background_ops.dart';
import '../../_services/hive/boxes.dart';
import '../../_variables/constants.dart';
import '../../_variables/navigation.dart';
import 'layout.dart';
import 'navbars/navbar_horizontal.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: globalBox.listenable(keys: [appReset]),
        builder: (context, box, widget) {
          return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return Scaffold(
              body: AppLayout(),
              bottomNavigationBar: HorizontalNavigationBox(),
              key: scaffoldState,
            );
          });
        });
  }
}
