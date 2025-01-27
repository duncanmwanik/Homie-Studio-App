import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '__routing/routes.dart';
import '_helpers/error_handler.dart';
import '_helpers/shortcuts.dart';
import '_providers/_providers.dart';
import '_providers/theme.dart';
import '_services/hive/load.dart';
import '_services/notifications/init_notifications.dart';
import '_theme/helpers.dart';
import '_theme/theme.dart';
import '_theme/variables.dart';
import '_widgets/others/others/scroll.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeHive();
    await initializeNotifications();
    usePathUrlStrategy();

    runApp(const MyApp());
  }, (error, stackTrace) => handleUnhandledExceptions(error, stackTrace));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        state.setContext(context);
        bool isDark = isDarkTheme(themeProvider.themeType);
        styler.initialize(isDark);

        return ResponsiveSizer(
          builder: (c, o, s) {
            return Shortcuts(
              shortcuts: shortcuts,
              child: MaterialApp.router(
                routerConfig: router,
                scrollBehavior: AppScrollBehavior(),
                builder: BotToastInit(),
                title: 'Sayari',
                theme: AppTheme.themeData(isDark),
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        );
      }),
    );
  }
}
