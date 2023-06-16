import 'package:ez_flutter/features/loans/domain/entity/aadhaar_kyc_response.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aadhaar_kyc_response_dto.freezed.dart';

part 'aadhaar_kyc_response_dto.g.dart';

@freezed
class AadhaarKycResponseDto
    with
        _$AadhaarKycResponseDto,
        BaseDto<AadhaarKycResponseDto, AadhaarKycResponse> {
  const AadhaarKycResponseDto._();

  const factory AadhaarKycResponseDto({
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'otp_sent', defaultValue: false) required bool otpSent,
    @JsonKey(name: 'if_number', defaultValue: false) required bool ifNumber,
    @JsonKey(name: 'valid_aadhaar', defaultValue: false)
        required bool validAadhaar,
  }) = _AadhaarKycResponseDto;

  factory AadhaarKycResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AadhaarKycResponseDtoFromJson(json);

  @override
  AadhaarKycResponseDto fromJson(Map<String, dynamic> json) =>
      AadhaarKycResponseDto.fromJson(json);

  @override
  AadhaarKycResponse toDomain() {
    return AadhaarKycResponse(
      clientId: clientId,
      otpSent: otpSent,
      ifNumber: ifNumber,
      validAadhaar: validAadhaar,
    );
  }
}
