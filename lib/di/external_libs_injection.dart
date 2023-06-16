import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

@module
abstract class ExternalLibs {
  @lazySingleton
  http.Client get client {
    final httpClient = HttpClient();
    httpClient.connectionTimeout = const Duration(seconds: 30);

    if (kDebugMode) {
      httpClient.badCertificateCallback = (_, __, ___) => true;
    }

    return http.Client();
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Dio get dio => Dio();
}
