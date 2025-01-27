import 'package:hive_flutter/hive_flutter.dart';

Box local(String type, {String? space}) {
  return Hive.box(type.isEmpty ? '' : '_$type');
}
