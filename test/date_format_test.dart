import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  String formatFromYYYYMMDDDate(String? datetime) {
    if (datetime == null || datetime.trim().isEmpty) return "";
    var originalDateFormat = DateFormat("yyyy-MM-dd");
    var uiDateFormat = DateFormat("dd-MM-yyyy");
    try {
      return uiDateFormat.format(originalDateFormat.parse(datetime));
    } catch (e, st) {}
    return datetime;
  }

  test('date format test', () {
    String strDate = '2022-07-09 01:14:23 PM';

    var res = formatFromYYYYMMDDDate(strDate);
  });
}