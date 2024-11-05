import 'package:hive_flutter/hive_flutter.dart';

import '../../features/user/_helpers/helpers.dart';
import 'local_storage_service.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  await loadAllBoxes();
}

Future<void> loadAllBoxes() async {
  globalBox = await Hive.openBox('global');
  settingBox = await Hive.openBox(liveUser());
}
