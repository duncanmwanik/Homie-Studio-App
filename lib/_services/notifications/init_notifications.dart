import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'listen_for_notification.dart';

Future<void> initializeNotifications() async {
  await AwesomeNotifications().initialize(
    'resource://drawable/sayari-cut',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Space Updates',
        defaultColor: Colors.lightBlueAccent,
        importance: NotificationImportance.High,
        channelDescription: 'Space Updates',
        channelShowBadge: true,
        playSound: true,
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Space Sessions',
        defaultColor: Colors.lightBlueAccent,
        importance: NotificationImportance.High,
        channelDescription: 'Scheduled Space Sessions',
        channelShowBadge: true,
        playSound: true,
      ),
    ],
  );

  AwesomeNotifications().setListeners(onActionReceivedMethod: onActionReceivedMethod);
}
