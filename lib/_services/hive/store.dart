import 'package:hive_flutter/hive_flutter.dart';

Box storage(String type) {
  return Hive.box(type);
}
