// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_static_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppStaticData _$$_AppStaticDataFromJson(Map<String, dynamic> json) =>
    _$_AppStaticData(
      panProofTypeId: json['panProofTypeId'] as String,
      kycOtpLength: json['kycOtpLength'] as int,
      contactUsNumber: json['contactUs'] as String,
      contactUsEmail: json['contactUsEmail'] as String,
      faqUrl: json['faqUrl'] as String,
      tandcUrl: json['tandcUrl'] as String,
      qrCodeBaseUrl: json['qr_baseurl'] as String,
      defaultLoanAccountType: json['bpDefaultLoanAccoountType'] as String,
    );

Map<String, dynamic> _$$_AppStaticDataToJson(_$_AppStaticData instance) =>
    <String, dynamic>{
      'panProofTypeId': instance.panProofTypeId,
      'kycOtpLength': instance.kycOtpLength,
      'contactUs': instance.contactUsNumber,
      'contactUsEmail': instance.contactUsEmail,
      'faqUrl': instance.faqUrl,
      'tandcUrl': instance.tandcUrl,
      'qr_baseurl': instance.qrCodeBaseUrl,
      'bpDefaultLoanAccoountType': instance.defaultLoanAccountType,
    };
