import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure.invalidFieldValue(String? message) = InvalidFieldValue;
  factory Failure.noInternet() = NoInternetFailure;
  factory Failure.unAuthorized() = UnAuthorizedFailure;
  factory Failure.serverFailure(int code, String message) = ServerFailure;
  factory Failure.apiFailure(String message) = ApiFailure;
  factory Failure.unknownApiFailure() = UnknownApiFailure;
  factory Failure.unknownFailure() = UnknownFailure;
}