import '../hive/store.dart';

bool isNotificationAllowed(String type) {
  try {
    return storage('notifications').get(type, defaultValue: true);
  } catch (e) {
    return false;
  }
}
