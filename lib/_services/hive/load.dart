import 'package:hive_flutter/hive_flutter.dart';

import 'boxes.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  await loadAllBoxes();
}

Future<void> loadAllBoxes() async {
  globalBox = await Hive.openBox('global');
}
