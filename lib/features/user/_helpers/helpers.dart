import '../../../_services/hive/load_boxes.dart';
import '../../../_services/hive/local_storage_service.dart';

Future<void> setUserData(String userId, Map info) async {
  await globalBox.put('currentUserId', userId);
  // we reload the hive boxes to initialize the user's boxes
  await loadAllBoxes();
  // save user details locally
  await settingBox.putAll(info);
}

bool isSignedIn() => liveUser() != 'none';
String liveUser() => globalBox.get('currentUserId', defaultValue: 'none');
String liveEmail() => settingBox.get('e', defaultValue: '');
String liveUserName() => settingBox.get('n', defaultValue: '');
