import 'package:flutter/material.dart';
import 'package:homie_ble/models/ble.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:homie_ble/ui/screens/error_screen.dart';
import 'package:homie_ble/ui/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  getStoredData();

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
    // create syntax-shortcut variables that point to the respective provider funcions
    createProviderReferences(context: context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homie Studio',
      home: HomeScreen(),
    );
  }
}
