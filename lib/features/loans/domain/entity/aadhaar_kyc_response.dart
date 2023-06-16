import 'package:freezed_annotation/freezed_annotation.dart';

part 'aadhaar_kyc_response.freezed.dart';

@freezed
class AadhaarKycResponse with _$AadhaarKycResponse {
  const factory AadhaarKycResponse({
    required String clientId,
    required bool otpSent,
    required bool ifNumber,
    required bool validAadhaar,
  }) = _AadhaarKycResponse;
}