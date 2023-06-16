import 'package:intl/intl.dart';

String getFriendlyDate(String? originalDate) {
  if (originalDate == null) {
    return '';
  }
  try {
    var date;
    final today = DateTime.now();
    final parsedDate = DateTime.parse(originalDate).add(const Duration(hours: 5, minutes: 30));

    if (parsedDate.month == today.month && parsedDate.year == today.year) {
      if (parsedDate.day == today.day) {
        date = DateFormat("h:mm a").format(parsedDate);
      } else if (parsedDate.difference(today) == Duration(days: 1)) {
        var format = DateFormat("h:mm a").format(parsedDate);
        date = "Yesterday $format";
      } else {
        date = DateFormat.yMMMd().format(parsedDate);
      }
    } else {
      date = DateFormat.yMMMd().format(parsedDate);
    }
    return date;
  } catch (e) {
    String formattedDate =
    DateFormat.yMMMd().format(DateTime.parse(originalDate));
    return formattedDate;
  }
}