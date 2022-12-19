import 'package:flutter/material.dart';
import 'package:homie_ble/methods/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/shared_prefs.dart';
import 'state/ble.dart';
import 'state/globals.dart';
import 'ui/screens/error/error_screen.dart';
import 'ui/screens/home/home.dart';
import 'methods/globals.dart';
import 'ui/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get shared prefs instance globally
  prefs = await SharedPreferences.getInstance();

  // get last selected screen
  lastPage = prefs.getInt("lastPage") ?? 2;

  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return ErrorScreen(errorDetails: errorDetails);
  };

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlobalModel()),
        ChangeNotifierProvider(create: (context) => BleModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // create syntax-shortening variables that point to their respective provider classes
    // just to make code shorter when watching the classes
    // not yet sure if it's a good practice
    createProviderReferences(context: context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Homie Studio',
      home: HomeScreen(),
    );
  }
}
