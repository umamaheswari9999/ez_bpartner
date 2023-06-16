// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emi_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmiPlanDto _$$_EmiPlanDtoFromJson(Map<String, dynamic> json) =>
    _$_EmiPlanDto(
      id: json['id'] as String,
      name: json['plan_name'] as String,
      totalemis: json['toalemis'] as int,
      interestrate: json['interestrate'] as String,
      advemi: json['advemi'] as int,
      downPayment: json['downPaymentAmount'] as String,
      emiAmount: json['emiAmount'] as String,
    );

Map<String, dynamic> _$$_EmiPlanDtoToJson(_$_EmiPlanDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_name': instance.name,
      'toalemis': instance.totalemis,
      'interestrate': instance.interestrate,
      'advemi': instance.advemi,
      'downPaymentAmount': instance.downPayment,
      'emiAmount': instance.emiAmount,
    };
