import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtentions on TimeOfDay {
  String to24Hrs() {
    final hour = this.hour.toString().padLeft(2, '0');
    final min = minute.toString().padLeft(2, '0');
    return '$hour:$min';
  }
}

extension DateTimeExtentions on DateTime {
  String part() => toString().split(' ')[0];

  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.tryParse(DateFormat('D').format(dec28)) ?? 0;
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

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
