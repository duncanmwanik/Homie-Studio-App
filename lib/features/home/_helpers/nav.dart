import '../../../_services/hive/store.dart';
import '../../../_variables/constants.dart';

bool showNav(String type) {
  return local(info).get(navPrimary, defaultValue: type).toString().contains(type);
}
