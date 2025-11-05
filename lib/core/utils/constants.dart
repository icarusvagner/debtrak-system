enum Status { active, pastDue, overDue }

Map<Status, String> statusNames = {
  Status.active: 'Active',
  Status.pastDue: 'Past due',
  Status.overDue: 'Over due',
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
