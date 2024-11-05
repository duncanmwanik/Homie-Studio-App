import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';

import '../../_helpers/debug.dart';
import '../../_widgets/others/toast.dart';
import 'notifications.dart';

Future<void> showNotification(
    {required String type, required String title, required String body, required Map<String, String> data}) async {
  try {
    if (isNotificationAllowed(type)) {
      if (kIsWeb) {
        showToast(3, '<b>$title</b><br>$body', duration: 5000);
      } else {
        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 0,
            channelKey: 'basic_channel',
            title: title,
            body: body,
            payload: data,
            notificationLayout: NotificationLayout.BigText,
            wakeUpScreen: true,
          ),
          actionButtons: [
            NotificationActionButton(key: 'view_details', label: 'View Details'),
          ],
        );
      }
    }
  } catch (e) {
    logError('show-notification', e);
  }
}

Future<void> createReminderNotification({
  required int id,
  required String title,
  required String body,
  required Map<String, String> data,
  required DateTime date,
}) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: 'scheduled_channel',
      title: title,
      body: body,
      payload: data,
      notificationLayout: NotificationLayout.BigText,
      category: NotificationCategory.Reminder,
      wakeUpScreen: true,
    ),
    actionButtons: [
      NotificationActionButton(key: 'view_details', label: 'Open'),
    ],
    schedule: NotificationCalendar(
      year: date.year,
      month: date.month,
      day: date.day,
      hour: date.hour,
      minute: date.minute,
      second: date.second,
    ),
  );
}

int notificationId(String id) {
  return id.length > 9 ? int.parse(id.substring(id.length - 9)) : int.parse(id);
}

Future<void> cancelScheduledNotification(String id) async {
  await AwesomeNotifications().cancel(notificationId(id));
}
