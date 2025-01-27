import '../_services/hive/boxes.dart';
import '../_variables/constants.dart';
import 'navigation.dart';

DateTime now() => DateTime.now();

String getUniqueId({bool subId = false}) => '${subId ? itemSubItem : ''}${now().millisecondsSinceEpoch}';

// list helpers
List<String> splitList(String? string, {String separator = ',', bool clearEmpties = true}) {
  if (string != null) {
    if (clearEmpties) {
      return string.split(separator).where((e) => e.isNotEmpty).toList();
    } else {
      return string.split(separator);
    }
  } else {
    return [];
  }
}

String joinList(List list) => list.isNotEmpty ? list.join(',') : '';

// demo
void setDemo(bool value) {
  globalBox.put(appDemo, value);
  if (!value) goHome();
}

bool isDemo() => globalBox.get(appDemo, defaultValue: false);

// loading
void isBusy(bool value) => globalBox.put(appBusy, value);

//
void resetApp() => globalBox.put(appReset, getUniqueId());
