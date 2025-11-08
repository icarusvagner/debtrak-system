import 'package:flutter/material.dart';

enum Status { active, pastDue, overDue, paid, late }

enum SortOptions { nameAZ, highestDebt, nearestDueDate, latestAdded }

enum BalanceOptions { updateBalance, resetBalance }

Map<Status, String> statusNames = {
  Status.active: 'Active',
  Status.pastDue: 'Past due',
  Status.overDue: 'Over due',
  Status.paid: 'Paid',
  Status.late: 'Late Payment',
};

Map<Status, Color> statusColor = {
  Status.active: Colors.green,
  Status.pastDue: Colors.orangeAccent,
  Status.overDue: Colors.redAccent,
  Status.paid: Colors.blue,
  Status.late: Colors.deepOrange,
};

class Constant {
  final List<String> _months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  final List<String> _weekdays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  String getMonth(int month) {
    return _months[month - 1];
  }

  String getWeekDay(int day) {
    return _weekdays[day - 1];
  }
}
