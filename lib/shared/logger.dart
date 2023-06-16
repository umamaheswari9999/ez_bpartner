import 'dart:developer' as dev;

void logError(Object exception, StackTrace stackTrace,
    [String? secondaryMessage]) {
  dev.log(
    exception.toString(),
    stackTrace: stackTrace,
    error: exception,
  );
}

void devLog(String message) {
  dev.log(message);
}
