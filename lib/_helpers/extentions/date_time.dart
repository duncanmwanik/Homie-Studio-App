import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtentions on TimeOfDay {
  String to24Hrs() {
    final hour = this.hour.toString().padLeft(2, '0');
    final min = minute.toString().padLeft(2, '0');
    return '$hour:$min:00';
  }
}

extension DateTimeExtentions on DateTime {
  String format() => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  String datePart() => DateFormat('yyyy-MM-dd').format(this);
  String timePart() => DateFormat('HH:mm:ss').format(this);
  String timePart12() => DateFormat('hh:mm a').format(this);
  String hourText() => DateFormat('h a').format(this).toLowerCase();

  int weekNo() {
    int dayOfYear = int.tryParse(DateFormat('D').format(this)) ?? 0;
    int woy = ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(year - 1);
    } else if (woy > numOfWeeks(year)) {
      woy = 1;
    }
    return woy;
  }
}

int numOfWeeks(int year) {
  DateTime dec28 = DateTime(year, 12, 28);
  int dayOfDec28 = int.tryParse(DateFormat('D').format(dec28)) ?? 0;
  return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
}
