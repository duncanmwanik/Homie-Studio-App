import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state/ble_state.dart';

// List<SingleChildWidget> providers = [
//   ChangeNotifierProvider(create: (context) => GlobalProvider()),
//   ChangeNotifierProvider(create: (context) => ThemeProvider()),
//   ChangeNotifierProvider(create: (context) => BleProvider()),
//   ChangeNotifierProvider(create: (context) => ProjectProvider()),
// ]

// class GlobalProviders {}

late BuildContext globalProviderContext;

// late ThemeProvider themeProviderX;
// late GlobalProvider globalProviderX;
late BleProvider bleProviderX;

void setGlobalProviderX(BuildContext context) {
  globalProviderContext = context;
  // themeProviderX = globalProviderContext.read<ThemeProvider>();
  // globalProviderX = globalProviderContext.read<GlobalProvider>();
  bleProviderX = globalProviderContext.read<BleProvider>();
}
