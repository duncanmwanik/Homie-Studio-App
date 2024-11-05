import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/ble/state/ble.dart';
import '../features/hub/state/hub.dart';
import 'focus.dart';
import 'global.dart';
import 'input.dart';
import 'theme.dart';
import 'views.dart';

List<SingleChildWidget> allProviders = [
  ChangeNotifierProvider(create: (context) => InputProvider()),
  ChangeNotifierProvider(create: (context) => HubProvider()),
  ChangeNotifierProvider(create: (context) => BleProvider()),
  ChangeNotifierProvider(create: (context) => ViewsProvider()),
  ChangeNotifierProvider(create: (context) => GlobalProvider()),
  ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ChangeNotifierProvider(create: (context) => FocusProvider()),
];

// custom state shortcuts... i love shortcuts ;)
class AppState {
  late ThemeProvider theme;
  late GlobalProvider global;
  late InputProvider input;
  late ViewsProvider views;
  late HubProvider hub;
  late BleProvider ble;
  late FocusProvider focus;

  void setContext(BuildContext appContext) {
    theme = appContext.read<ThemeProvider>();
    global = appContext.read<GlobalProvider>();
    input = appContext.read<InputProvider>();
    views = appContext.read<ViewsProvider>();
    hub = appContext.read<HubProvider>();
    ble = appContext.read<BleProvider>();
    focus = appContext.read<FocusProvider>();
  }
}

AppState state = AppState();
