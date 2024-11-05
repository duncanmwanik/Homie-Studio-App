import 'package:flutter/material.dart';

import '../_models/item.dart';

class InputProvider with ChangeNotifier {
  Item item = Item.empty();
  Map previousData = {};

  void set(Item itm) {
    item = itm;
    previousData = {...item.data};
    notifyListeners();
  }

  void update(String key, var value, {String subKey = ''}) {
    if (subKey.isNotEmpty) {
      Map subData = item.data[key] ?? {};
      subData[subKey] = value;
      item.data[key] = subData;
    } else {
      item.data[key] = value;
    }
    notifyListeners();
  }

  void remove(String key, {String subKey = ''}) {
    if (subKey.isNotEmpty) {
      Map subData = item.data[key] ?? {};
      subData.remove(subKey);
      item.data[key] = subData;
    } else {
      item.data.remove(key);
    }
    notifyListeners();
  }

  void addAll(Map all) {
    item.data.addAll(all);
    notifyListeners();
  }

  void removeMatch(String match) {
    item.data.removeWhere((key, value) => key.toString().startsWith(match));
    notifyListeners();
  }

  void clear() {
    item = Item.empty();
    previousData = {};
  }

  // for finance only ---------- ----------
  String entryType = '';

  void setEntryType(String newType) {
    entryType = newType;
    notifyListeners();
  }

  String filter = 'All';

  void setEntryFilters(String filter_) {
    filter = filter_;
    notifyListeners();
  }

  // for sessions only ---------- ----------

  List selectedDates = [];

  void updateSelectedDates(String action, {String date = '', List dates = const []}) {
    if (action == 'add') selectedDates.add(date);
    if (action == 'remove') selectedDates.remove(date);
    if (action == 'clear') selectedDates.clear();
    if (action == 'set') selectedDates = dates;
    notifyListeners();
  }

  //  for date range date picker

  String dateRangeStart = '';
  String dateRangeEnd = '';

  void updateDateRangeStart(String kind, String newDate) {
    kind == 'start' ? dateRangeStart = newDate : dateRangeEnd = newDate;
    notifyListeners();
  }

  //

  List selectedWeekDays = [];

  void updateSelectedWeekDays(String action, int weekday) {
    action == 'add' ? selectedWeekDays.add(weekday) : selectedWeekDays.remove(weekday);
    notifyListeners();
  }

  // for spaces only
  List selectedGroups = [];

  void updateSelectedGroups(String group) {
    selectedGroups.contains(group) ? selectedGroups.remove(group) : selectedGroups.add(group);
    notifyListeners();
  }

  void clearSelectedGroups() {
    selectedGroups.clear();
    notifyListeners();
  }
}
