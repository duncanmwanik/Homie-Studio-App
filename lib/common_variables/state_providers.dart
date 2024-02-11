import 'package:homie_ble/state/ble_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../state/commands_state.dart';
import '../state/global_state.dart';
import '../state/theme_state.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (context) => GlobalModel()),
  ChangeNotifierProvider(create: (context) => BleProvider()),
  ChangeNotifierProvider(create: (context) => ThemeModel()),
  ChangeNotifierProvider(create: (context) => CommandModel()),
];

// Provider state refs
late dynamic globalWatch;
late dynamic themeWatch;
late dynamic commandWatch;
