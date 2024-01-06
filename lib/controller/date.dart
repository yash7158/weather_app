String convertTimestampToString(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
  return "${_dayName(dateTime.weekday)}, ${dateTime.day.toString().padLeft(2, '0')} ${_monthName(dateTime.month)}";
}

String _dayName(int weekday) {
  const dayNames = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  return dayNames[weekday - 1];
}

String _monthName(int month) {
  const monthNames = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];
  return monthNames[month - 1];
}


String formatDate(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
  int day = dateTime.day;

  String suffix;
  if (day >= 11 && day <= 13) {
    suffix = 'th';
  } else if (day % 10 == 1) {
    suffix = 'st';
  } else if (day % 10 == 2) {
    suffix = 'nd';
  } else if (day % 10 == 3) {
    suffix = 'rd';
  } else {
    suffix = 'th';
  }

  return "$day$suffix";
}

