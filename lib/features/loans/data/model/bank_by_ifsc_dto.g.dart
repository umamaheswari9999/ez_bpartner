// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_by_ifsc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankByIfscDto _$$_BankByIfscDtoFromJson(Map<String, dynamic> json) =>
    _$_BankByIfscDto(
      ifscCode: json['inpifsccode'] as String,
      bankBranchName: json['inpbankbranch'] as String,
      bankBranchId: json['inpbanknameId'] as String,
      micr: json['inpmicr'] as String,
    );

Map<String, dynamic> _$$_BankByIfscDtoToJson(_$_BankByIfscDto instance) =>
    <String, dynamic>{
      'inpifsccode': instance.ifscCode,
      'inpbankbranch': instance.bankBranchName,
      'inpbanknameId': instance.bankBranchId,
      'inpmicr': instance.micr,
    };
