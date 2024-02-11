import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_variables/state_providers.dart';
import '../state/commands_state.dart';
import '../state/global_state.dart';
import '../state/theme_state.dart';

void createProviderWatchReferences({BuildContext? context}) {
  globalWatch = context?.watch<GlobalModel>();
  // bleWatch = context?.watch<BleModel>();
  themeWatch = context?.watch<ThemeModel>();
  commandWatch = context?.watch<CommandModel>();
}
