import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/ble/state/ble.dart';
import '../features/hub/state/hub.dart';
import 'focus.dart';
import 'global.dart';
import 'temp.dart';
import 'theme.dart';
import 'views.dart';

//
// all app providers
//

List<SingleChildWidget> allProviders = [
  //
  ChangeNotifierProvider(create: (context) => GlobalProvider()),
  ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ChangeNotifierProvider(create: (context) => ViewsProvider()),
  ChangeNotifierProvider(create: (context) => BleProvider()),
  ChangeNotifierProvider(create: (context) => HubProvider()),
  // misc
  ChangeNotifierProvider(create: (context) => FocusProvider()),
  ChangeNotifierProvider(create: (context) => TempProvider()),
];

//
// custom state shortcuts... i love shortcuts ;)
//

class AppState {
  late ThemeProvider theme;
  late GlobalProvider global;
  late ViewsProvider views;
  late FocusProvider focus;
  late TempProvider temp;
  late BleProvider ble;
  late HubProvider hub;

  void setContext(BuildContext appContext) {
    theme = appContext.read<ThemeProvider>();
    global = appContext.read<GlobalProvider>();
    views = appContext.read<ViewsProvider>();
    focus = appContext.read<FocusProvider>();
    temp = appContext.read<TempProvider>();
    ble = appContext.read<BleProvider>();
    hub = appContext.read<HubProvider>();
  }
}

AppState state = AppState();
