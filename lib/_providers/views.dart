import 'package:flutter/material.dart';

import '../_services/hive/local_storage_service.dart';
import '../_variables/features.dart';

class ViewsProvider with ChangeNotifier {
  // home view
  String view = globalBox.get('view', defaultValue: feature.colors);

  void setView(String type) {
    view = type;
    globalBox.put('view', type);
    notifyListeners();
  }

  // calendar view
  int calendarView = globalBox.get('calendarView', defaultValue: 2);
  void setSessionsView(int index) {
    calendarView = index;
    globalBox.put('calendarView', index);
    notifyListeners();
  }
}
