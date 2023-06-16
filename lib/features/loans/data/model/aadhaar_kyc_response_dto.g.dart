// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhaar_kyc_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AadhaarKycResponseDto _$$_AadhaarKycResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AadhaarKycResponseDto(
      clientId: json['client_id'] as String,
      otpSent: json['otp_sent'] as bool? ?? false,
      ifNumber: json['if_number'] as bool? ?? false,
      validAadhaar: json['valid_aadhaar'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AadhaarKycResponseDtoToJson(
        _$_AadhaarKycResponseDto instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'otp_sent': instance.otpSent,
      'if_number': instance.ifNumber,
      'valid_aadhaar': instance.validAadhaar,
    };
