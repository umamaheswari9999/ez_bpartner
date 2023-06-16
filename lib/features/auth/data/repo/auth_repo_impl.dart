import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:ez_flutter/features/auth/data/model/user_dto.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/auth/domain/repo/auth_repo.dart';
import 'package:ez_flutter/local/db/hive_helper.dart';
import 'package:ez_flutter/network/api_helper.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final ApiHelper api;
  final FlutterSecureStorage storage;

  AuthRepoImpl(this.api, this.storage);

  @override
  Future<Either<Failure, User>> getLoggedInUser() async {
    try {
      var s = (await storage.read(key: LocalStorageKeys.user));
      if (s == null) left(Failure.serverFailure(Constants.repoException, ''));
      final userData = jsonDecode(s!) as Map<String, dynamic>;
      final user = UserDto.fromJson(userData).toDomain();
      return right(user);
    } catch (e, st) {
      logError(e, st, '[repo] could not get persisted user');
      return left(Failure.serverFailure(Constants.repoException, ''));
    }
  }

  Future<Map<String, String>> getApiAuthHelper() async {
    final s = (await storage.read(key: LocalStorageKeys.apiuser));
    if (s == null) left(Failure.serverFailure(Constants.repoException, ''));
    final basicAuth = await storage.read(key: LocalStorageKeys.apiuser);
    return <String, String>{'authorization': basicAuth!};
  }

  @override
  Future<Either<Failure, bool>> isUserLoggedIn() async {
    try {
      return right(await storage.read(key: LocalStorageKeys.user) != null);
    } catch (e, st) {
      logError(e, st, '[repo] could not check for persisted user');
      return left(Failure.serverFailure(Constants.repoException, ''));
    }
  }

  @override
  Future<Either<Failure, User>> signIn(String username, String password) async {
    const defErrMsg = 'Sign in failed. Please try again later';
    try {
      const url = '${Constants.baseCustomApiUrl}/${CustomWebServices.signIn}';
      final requestBody = json.encode({
        'data': {
          'username': username,
        }
      });

      final result = await api.post(
          url,
          requestBody,
          defErrMsg,
          () => { 'Authorization': api.constructAuthHeaderValue(username, password)}
        );
      return await result.fold(
        (l) => left(l),
        (r) async {
          final dataObj = r[0] as Map<String, dynamic>;
          final user = dataObj['user'] as Map<String, dynamic>;
          final userDto = UserDto.fromJson(user).copyWith(password: password);
          final termsAndConditionsUrl = (dataObj['TermsAndConditionsURL'] ??
              Constants.termsAndConditionsUrl) as String;
          final faqsUrl = (dataObj['FAQsURL'] ?? Constants.bpFAQsUrl) as String;

          final appStaticData = await _fetchPreference(PreferenceKeys.appStaticData, username, password);
          if (appStaticData != null) {
            HiveHelper.storeAppStaticData(appStaticData);
          } else {
            return left(Failure.apiFailure('Could not fetch app data. Please contact support team'));
          }

          await _storeLoggedInUser(userDto);
          HiveHelper.storeTermsAndConditionsUrl(termsAndConditionsUrl);
          HiveHelper.storeFaqUrl(faqsUrl);

          return right(userDto.toDomain());
        },
      );
    } on AssertionError catch (e, st) {
      dev.log(e.toString(), stackTrace: st);
      return left(Failure.invalidFieldValue(defErrMsg));
    } catch (e, st) {
      dev.log(e.toString(), stackTrace: st);
      return left(Failure.serverFailure(Constants.repoException,'Hang on..! Server is under Maintenance. Please try again after sometime.!'));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await OneSignal.shared.disablePush(true);
      await storage.delete(key: LocalStorageKeys.user);
      HiveHelper.storeAppStaticData('');
      return right(true);
    } catch (e, st) {
      logError(e, st, '[repo] could not sign out user');
      return left(Failure.unknownFailure());
    }
  }

  Future<Either<Failure, bool>> registerAuth(String encodedString) async {
    try {
      final isExists = await storage.containsKey(key: LocalStorageKeys.apiuser);
      if (isExists) {
        await storage.delete(key: LocalStorageKeys.apiuser);
      }
      await storage.write(key: LocalStorageKeys.apiuser, value: encodedString);
      return right(true);
    } catch (e, st) {
      logError(e, st, 'Could not authenticate.');
      return left(Failure.serverFailure(Constants.repoException, 'Something went wrong'));
    }
  }

  Future<Either<Failure, bool>> _storeLoggedInUser(UserDto user) async {
    try {
      await storage.write(
          key: LocalStorageKeys.user, value: jsonEncode(user.toJson()));
      return right(true);
    } catch (e, st) {
      logError(e, st, '[repo] could not store persisted user');
      return left(Failure.serverFailure(
          Constants.repoException, 'Something went wrong'));
    }
  }

  Future<String?> _fetchPreference(
      String key, String username, String password) async {
    try {
      final url =
          "${Constants.baseDefaultApiUrl}/${Entities.preference}?_where=attribute='$key'";
      final result = await api.getPreference(
          url, 'Could not get preference', username, password);
      return result.fold(
        (l) => null,
        (r) {
          if (r.isEmpty) return null;
          final r2 = r[0] as Map<String, dynamic>;
          return r2['searchKey'] as String;
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return null;
  }

  String _testOtpSender() {
    Random random = Random();
    String number = '';
    for (int i = 0; i < 6; i++) {
      number = number + random.nextInt(9).toString();
    }
    return number;
  }

  /// [sentOTP] Test Server OTP sending functionality
  @override
  Future<Either<Failure, bool>> sendOTP(String mobileNumber) async {
    const String defErrMsg = 'Could not sent OTP.';
    try {
      final auth = FirebaseFunctions.instance.httpsCallable('authHeader');
      final baseApiAuthHelper = await auth.call();
      await registerAuth(baseApiAuthHelper.data['response']);
      final authHeader = await getApiAuthHelper();
      late String otp;
      if (mobileNumber == '9182298847' ||
          mobileNumber == '9704578117' ||
          mobileNumber == '8688662378') {
        otp = '222222';
      } else {
        otp = _testOtpSender();
      }
      final reqBody = json.encode({
        'data': {
          "mobilenumber": mobileNumber,
          "templateid": "1407162762466847246",
          "variable": {
            "var1": otp,
          }
        }
      });
      const url = "${Constants.baseCustomApiUrl}/${CustomWebServices.sendSMS}";
      final result = await api.loanApiPost(
        url,
        reqBody,
        defErrMsg,
        headers: () => authHeader,
      );
      return result.fold(
        (l) => left(l),
        (r) => right(true),
      );
    } on FirebaseFunctionsException catch (e, st) {
      logError(e, st, '[firebase-error]');
      return left(Failure.apiFailure(
          'OOPS...! Something went wrong..! \n Please try again later'));
    } catch (e, st) {
      logError(e, st, defErrMsg);
      return left(Failure.apiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> valdateOTP(
      String mobileNumber, String otp) async {
    const String defErrMsg = 'Could not validate OTP.';
    try {
      final reqBody = json.encode({
        "data": {
          "mobilenumber": mobileNumber,
          "otp": otp,
        }
      });
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.verifyOTP}";
      final authHeader = await getApiAuthHelper();
      final result = await api.loanApiPost(
        url,
        reqBody,
        defErrMsg,
        headers: () => authHeader,
      );

      return result.fold(
        (l) => left(l),
        (r) => right(true),
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
      return left(Failure.apiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchUserNames(String mobileNumber) async {
    const defErrMsg = 'Could not fetch user names.';
    try {
      final url =
          "${Constants.baseDefaultApiUrl}/${Entities.user}?_where=phone='$mobileNumber' and username IS NOT NULL &_selectedProperties=username";
      final authHeader = await getApiAuthHelper();
      final response = await api.get(url, defErrMsg, () => authHeader);
      return response.fold(
        (l) => left(l),
        (r) {
          final maps = r.map((e) => e as Map<String, dynamic>).toList();
          List<String> names = [];
          maps.fold([], (p, e) => names.add(e['username']));
          return right(names);
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
      return left(Failure.apiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tuple2<String?, String?>>> checkIsUserExists(
      String username) async {
    const String defErrMsg = 'Could not validate username';
    try {
      final auth = FirebaseFunctions.instance.httpsCallable('authHeader');
      final baseApiAuthHelper = await auth.call();
      await registerAuth(baseApiAuthHelper.data['response']);
      final url =
          "${Constants.baseDefaultApiUrl}/${Entities.user}?_where=username='$username' and username IS NOT NULL &_selectedProperties=username,id,phone&_endRow = 0";
      final authHeader = await getApiAuthHelper();
      final response = await api.get(url, defErrMsg, () => authHeader);

      return response.fold(
        (l) => left(l),
        (r) {
          if (r.isEmpty) {
            return right(const Tuple2(null, null));
          }
          final maps = r.map((e) => e as Map<String, dynamic>).toList();
          return right(Tuple2(maps.first['id'], maps.first['phone']));
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
      return left(Failure.apiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePassword(
      String username, String cnfpswd) async {
    const defErrMsg = "Can bale to update passord. Please Try Again.";
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.createUser}";
      final reqBody = json.encode({
        "data": {
          "passwd": cnfpswd,
          "username": username,
          "name": username,
          "client": "D1B565840F95464DA296746768738853",
          "updatepasswd": "Y",
          "role": "1E74CB816F1A45D7BAC64B59BE132A01"
        }
      });
      final apiAuth = await getApiAuthHelper();
      final apires = await api.loanApiPost(
        url,
        reqBody,
        defErrMsg,
        headers: () => apiAuth,
      );
      return apires.fold(
        (l) => left(l),
        (r) {
          if (r.isEmpty) {
            return right(false);
          }
          return right(true);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }
}
