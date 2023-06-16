class StringUtils {
  static String getMaskedAadhaar(String aadhaar) {
    try {
      var toBeVisible = aadhaar.substring(aadhaar.length - 4);
      return '${aadhaar.substring(0, aadhaar.length - 4).replaceAll(RegExp("[0-9]"), "X")}$toBeVisible';
    } catch (e, st) {
      return aadhaar;
    }
  }

  static String getMaskedMobileNumber(String? number) {
    try {
      var toBeVisible = number?.substring(number.length - 4);
      return '${number?.substring(0, number.length - 4).replaceAll(RegExp("[0-9]"), "X")}$toBeVisible';
    } catch (e, st) {
      return number ?? '';
    }
  }
}