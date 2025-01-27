import '../hive/store.dart';

bool isNotificationAllowed(String type) {
  try {
    return local('notifications').get(type, defaultValue: true);
  } catch (e) {
    return false;
  }
}
