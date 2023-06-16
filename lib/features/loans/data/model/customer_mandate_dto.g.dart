// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_mandate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerMandateDto _$$_CustomerMandateDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerMandateDto(
      id: json['id'] as String,
      umrn: json['lDSUmrn'] as String? ?? '',
      mandateId: json['mandateid'] as String? ?? '',
      mandateType: json['mandatetype'] as String? ?? '',
      mandateStage: json['lDSEnachStage'] as String? ?? '',
      mandateStatus: json['lDSEnachStatus'] as String? ?? '',
      url: json['lDSUrl'] as String? ?? '',
      sponserBank: json['lDSEnachSponserbank'] as String? ?? '',
      registeredOn: json['mandateregisteredon'] as String? ?? '',
      amountRegistered: (json['lDSEcsAmountReg'] as num?)?.toDouble() ?? 0.0,
      isApplicable: json['lDSEcsApplicable'] as bool? ?? false,
      isCanceled: json['ismandatecancel'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CustomerMandateDtoToJson(
        _$_CustomerMandateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lDSUmrn': instance.umrn,
      'mandateid': instance.mandateId,
      'mandatetype': instance.mandateType,
      'lDSEnachStage': instance.mandateStage,
      'lDSEnachStatus': instance.mandateStatus,
      'lDSUrl': instance.url,
      'lDSEnachSponserbank': instance.sponserBank,
      'mandateregisteredon': instance.registeredOn,
      'lDSEcsAmountReg': instance.amountRegistered,
      'lDSEcsApplicable': instance.isApplicable,
      'ismandatecancel': instance.isCanceled,
    };
