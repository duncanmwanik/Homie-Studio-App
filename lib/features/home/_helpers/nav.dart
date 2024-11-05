import '../../../_services/hive/local_storage_service.dart';

bool showNavItem(String type) {
  return settingBox.get('showNavItem_$type', defaultValue: '1') == '1';
}
