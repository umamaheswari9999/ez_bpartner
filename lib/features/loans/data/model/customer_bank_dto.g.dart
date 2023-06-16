// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_bank_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerBankDto _$$_CustomerBankDtoFromJson(Map<String, dynamic> json) =>
    _$_CustomerBankDto(
      id: json['id'] as String,
      bankName: json[r'bankname$_identifier'] as String,
      bankId: json['bankname'] as String,
      branchName: json['bankbranch'] as String,
      ifscCode: json['ifsccode'] as String,
      accountType: json['lDSAccountType'] as String,
      accountNumber: json['accountno'] as String? ?? '',
      nameOnBankAccount: json['applicantname'] as String? ?? '',
      isValidated: json['isvalidated'] as bool? ?? false,
      micrCode: json['micr'] as int?,
      validatedBy: json['bankvalidationBy'] as String?,
    );

Map<String, dynamic> _$$_CustomerBankDtoToJson(_$_CustomerBankDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      r'bankname$_identifier': instance.bankName,
      'bankname': instance.bankId,
      'bankbranch': instance.branchName,
      'ifsccode': instance.ifscCode,
      'lDSAccountType': instance.accountType,
      'accountno': instance.accountNumber,
      'applicantname': instance.nameOnBankAccount,
      'isvalidated': instance.isValidated,
      'micr': instance.micrCode,
      'bankvalidationBy': instance.validatedBy,
    };
