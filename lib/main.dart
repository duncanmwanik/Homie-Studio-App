import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:homie_ble/_providers/_provider_variables.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common_variables/state_providers.dart';
import 'data/shared_prefs.dart';
import 'logic/state_logic.dart';
import 'theme/theme.dart';
// import 'ui/error/error_screen.dart';
import 'ui/home/home_screen.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();

  //set shared prefs instance globally
  sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: providerList,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    createProviderWatchReferences(context: context);

    setGlobalProviderX(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customAppTheme,
      title: 'Homie Studio',
      home: HomeScreen(),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
