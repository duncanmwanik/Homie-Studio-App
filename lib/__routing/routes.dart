import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../_variables/navigation.dart';
import '../features/error/error_screen.dart';
import '../features/home/home.dart';

final GoRouter router = GoRouter(
  observers: [BotToastNavigatorObserver()],
  navigatorKey: navigatorState,
  routes: [
    // home
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      // redirect: (context, state) async {
      //   if (await isFirstTimer()) {
      //     return '/welcome';
      //   }
      //   return null;
      // },
    ),
  ],
  // error
  errorPageBuilder: (context, state) => MaterialPage(child: ErrorScreen()),
);
