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
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  // error
  errorPageBuilder: (context, state) => const MaterialPage(child: ErrorScreen()),
);
