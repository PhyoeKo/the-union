import 'dart:io';

import 'package:intl/intl.dart';

class Extension {
  DateFormat weekDayFormat = DateFormat("EEEE");
  DateFormat dayFormat = DateFormat("d");
  DateFormat monthFormat = DateFormat("M");
  DateFormat yearFormat = DateFormat("yyyy");

  bool isDesktop = (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  int? getDayOnly(DateTime date) {
    try {
      return int.parse(dayFormat.format(date));
    } catch (e) {
      return null;
    }
  }

  int? getMonthOnly(DateTime date) {
    try {
      return int.parse(monthFormat.format(date));
    } catch (e) {
      return null;
    }
  }

  int? getYearOnly(DateTime date) {
    try {
      return int.parse(yearFormat.format(date));
    } catch (e) {
      return null;
    }
  }

  String? getWeekDayOnly(DateTime date) {
    try {
      return weekDayFormat.format(date);
    } catch (e) {
      return null;
    }
  }

  String getWeekdayName(int weekday, DateTime now) {
    final int diff = now.weekday - weekday;
    DateTime updatedDt;
    if (diff > 0) {
      updatedDt = now.subtract(Duration(days: diff));
    } else if (diff == 0) {
      updatedDt = now;
    } else {
      updatedDt = now.add(Duration(days: diff * -1));
    }
    final String weekdayName = DateFormat('EEE').format(updatedDt);
    return weekdayName;
  }
}
