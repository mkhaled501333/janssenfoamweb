// ignore: non_constant_identifier_names
// ignore_for_file: avoid_print, argument_type_not_assignable_to_error_handler

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names

pickDateTimeRange(BuildContext context) {
  DateTimeRange(start: DateTime.now(), end: DateTime.now());
// ignore: unused_local_variable
  Future<DateTimeRange?> newDateRange = showDateRangePicker(
      context: context, firstDate: DateTime(200), lastDate: DateTime.now());
}

List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(DateTime(
        startDate.year,
        startDate.month,
        // In Dart you can set more than. 30 days, DateTime will do the trick
        startDate.day + i));
  }
  return days;
}
