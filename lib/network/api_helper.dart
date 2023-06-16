import 'dart:convert';
import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/loans/data/model/attachment_dto.dart';
import 'package:ez_flutter/features/loans/domain/entity/attachment.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

import '../shared/failure.dart';
import 'network_utils.dart';

typedef Parser<T> = T Function(Map<String, dynamic> json);
typedef Headers = Map<String, String> Function();

@lazySingleton
class ApiHelper {
  final Dio client;

  ApiHelper(this.client);

  Future<Either<Failure, List<dynamic>>> get(String url, String defErrMsg,
      [Headers? headers]) async {
    final result = await _safeApiCall(
      () async => await _makeGet(url, headers),
      defErrMsg,
    );
    return result.fold(
      (l) => left(l),
      (r) => right(r as List<dynamic>),
    );
  }

  _makeGet(String url, Headers? headers) async {
    final response = await client.get(
      url,
      options: Options(
        headers: headers != null
            ? headers()
            : {HttpHeaders.authorizationHeader: _getAuthToken()},
      ),
    );
    return response;
  }

  _makePost(String url, Headers? headers, String body) async {
    final response = await client.post(
      url,
      data: body,
      options: Options(
        headers: headers != null
            ? headers()
            : {HttpHeaders.authorizationHeader: _getAuthToken()},
      ),
    );
    return response;
  }

  Future<Either<Failure, List<dynamic>>> getPreference(
    String url,
    String defErrMsg,
    String username,
    String password,
  ) async {
    final result = await _safeApiCall(
      () async =>
          await _makeGet(url, () => _constructAuthHeader(username, password)),
      defErrMsg,
    );
    return result.fold(
      (l) => left(l),
      (r) => right(r as List<dynamic>),
    );
  }

  Future<Either<Failure, List<dynamic>>> post(
      String url, String body, String defErrMsg,
      [Headers? headers]) async {
    final result = await _safeApiCall(
      () async => await _makePost(
        url,
        headers,
        body,
      ),
      defErrMsg,
    );
    return result.fold(
      (l) => left(l),
      (r) => right(r as List<dynamic>),
    );
  }

  Future<Either<Failure, dynamic>> loanApiPost(
    String url,
    String body,
    String defErrMsg, {
    Headers? headers,
    bool needFullResponse = false,
    bool? isCustomLoanApi = true,
  }) async {
    final result = await _safeApiCall(
      () async => await _makePost(url, headers, body),
      defErrMsg,
      isCustomLoanApi: isCustomLoanApi ?? true,
      needFullResponse: needFullResponse,
    );
    return result;
  }

  Future<Either<Failure, Attachment>> addAttachment(
      String entityName,
      String id,
      String doctype,
      PlatformFile attachment,
      String filepath) async {
    try {
      const String defErrMsg = "Could not upload file";
      final data = await _safeApiCall(
        () async {
          final user = getLoggedInUser();
          final fileName = '$doctype${extension(filepath)}';

          final formData = FormData.fromMap({
            'record_id': id,
            'entity_name': entityName,
            'client_id': user.clientId,
            'org_id': user.organizationId,
            'file':
                MultipartFile.fromBytes(attachment.bytes!, filename: fileName),
          });

          const url =
              "${Constants.baseCustomApiUrl}/${CustomWebServices.attachmentWs}";
          final response = await client.post(
            url,
            data: formData,
            options: Options(
              headers: {HttpHeaders.authorizationHeader: _getAuthToken()},
            ),
          );

          return response;
        },
        defErrMsg,
      );

      return data.fold(
        (l) => left(l),
        (r) => right(
          AttachmentDto.fromJson(r[0] as Map<String, dynamic>).toDomain(),
        ),
      );
    } catch (e, st) {
      return left(Failure.unknownFailure());
    }
  }

  ///
  /// Safe network call with exception handling and internet check
  /// Note: Network response should be in the following format
  /// {
  ///  response: {
  ///         status: <status code>,
  ///         data: [<list of business objects>],
  ///         error: {
  ///             message: <error message>
  ///         },
  ///         message: <error message>,
  ///     }
  ///  }
  ///
  ///
  Future<Either<Failure, dynamic>> _safeApiCall(
    Future<Response<dynamic>> Function() call,
    String defErrMsg, {
    bool isCustomLoanApi = false,
    bool needFullResponse = false,
  }) async {
    try {
      if (await hasInternet() == false) {
        return left(Failure.noInternet());
      }

      final response = await call();

      final statusCode = response.statusCode ?? 500;
      final resBody = response.data;
      if (kDebugMode) {
        // dev.log(resBody.toString());
        // dev.log(response.realUri.toString());
        // dev.log(response.data.toString());
        // dev.log(statusCode.toString());
        // dev.log(resBody.toString());
      }

      if (statusCode >= 200 && statusCode < 300) {
        if (resBody == null) return left(Failure.unknownFailure());
        final jsonRes = resBody as Map<String, dynamic>;

        if (isCustomLoanApi) {
          final status = jsonRes['status'];
          if (status == 200) {
            if (needFullResponse) {
              return right(jsonRes);
            }
            final data = jsonRes['data'];
            return right(data);
          } else if (status == 500 && jsonRes.containsKey("message")) {
            return left(Failure.invalidFieldValue(jsonRes['message']));
          } else if (status == 'SUCCESS') {
            return right(jsonRes);
          } else if (jsonRes.containsKey('errorCode')) {
            return left(jsonRes['status']);
          } else if (jsonRes.containsKey('severity')) {
              return right(jsonRes);
          } else {
            final res1 = await call();
            final obReponse = res1.data;
            final requestBody = res1.requestOptions.data;
            await _recordErrorInFb(requestBody, obReponse);
            return left(Failure.unknownApiFailure());
          }
        } else {
          final obResponse = _getResponseJson(resBody);

          if (obResponse['status'] == 0) {
            final dataArr = obResponse['data'] as List<dynamic>;
            return right(dataArr);
          } else {
            if (resBody.isEmpty) {
              return left(
                Failure.serverFailure(Constants.emptyServerResponse, defErrMsg),
              );
            }
            final message = getErrorMsgFromResponse(obResponse, defErrMsg);
            return left(Failure.serverFailure(statusCode, message));
          }
        }
      } else if (statusCode == 401) {
        return left(Failure.unAuthorized());
      } else if (statusCode == 500) {
        return left(Failure.serverFailure(500, "Internal Server Error"));
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return left(Failure.unAuthorized());
      } else if (e.response?.statusCode == 500) {
        return left(Failure.serverFailure(500, "Internal Server Error"));
      }
    } on SocketException {
      return left(Failure.serverFailure(500, "Internal Server Error"));
    } catch (ex, st) {
      final res1 = await call();
      final obReponse = res1.data;
      final requestBody = res1.requestOptions.data;
      await _recordErrorInFb(requestBody.toString(), obReponse.toString());
      dev.log('Api Exception', error: ex, stackTrace: st);
    }

    return left(Failure.unknownApiFailure());
  }

  Future<void> _recordErrorInFb(String requestbody, String response) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('api_tracker');
      final querySnapshot = await collectionRef.get();
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      final ids = allData.map((e) => int.parse(e['doc_id'])).toList();
      ids.sort();
      final docid = (ids.isEmpty ? 1 : (ids.reversed.first + 1)).toString();
      await collectionRef.doc(docid).set({
        'app_error': 'Unknown Api Error',
        'doc_id': docid,
        'creation_date': DateTime.now().toString(),
        'ob_response': response,
        'request_body': requestbody,
        'username': getLoggedInUser().name,
      });
    } catch (e, st) {
      dev.log("Cant able to store error", error: e, stackTrace: st);
    }
  }

  Map<String, dynamic> _getResponseJson(dynamic resBody) {
    final jsonRes = resBody as Map<String, dynamic>;
    if (jsonRes.containsKey('response')) {
      return jsonRes['response'] as Map<String, dynamic>;
    } else {
      return jsonRes;
    }
  }

  /// Fetches OB Error message from network response
  String getErrorMsgFromResponse(
      Map<String, dynamic> obResponse, String defMsg) {
    try {
      return obResponse['error'] != null
          ? obResponse['error']['message'] ?? defMsg
          : obResponse['message'] ?? obResponse['errors'] != null
              ? (obResponse['errors'] as Map<String, dynamic>).values.toString()
              : obResponse['error'] ?? defMsg;
    } catch (error, st) {
      return defMsg;
    }
  }

  /// Constructs the Base64 header for the Authorization
  String constructAuthHeaderValue(String username, String password) =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  String _getAuthToken() {
    final user = locator.get<User>();
    return constructAuthHeaderValue(user.username, user.password);
  }

  Map<String, String> _constructAuthHeader(String username, String password) {
    return {
      'Authorization': constructAuthHeaderValue(username, password),
    };
  }

  User getLoggedInUser() => locator.get<User>();
}
