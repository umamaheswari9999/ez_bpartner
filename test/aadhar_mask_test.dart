import 'package:flutter_test/flutter_test.dart';

void main() {
  test('aadhar mask test', () {
    String aadhar = '123456789012';

    print(aadhar.indexOf("[0-9]"));

    print(aadhar.substring(0, aadhar.length - 4).replaceAll(RegExp("[0-9]"), "x"));
    print(aadhar.substring(aadhar.length - 4));

  });
}