import '../_services/hive/boxes.dart';

Future delay(int milliseconds) async => await Future.delayed(Duration(milliseconds: milliseconds));
void showSyncingLoader(bool show) => globalBox.put('showUpdateLoader', show);
