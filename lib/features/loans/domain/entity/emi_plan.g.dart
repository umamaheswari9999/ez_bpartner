// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emi_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmiPlan _$$_EmiPlanFromJson(Map<String, dynamic> json) => _$_EmiPlan(
      id: json['id'] as String,
      name: json['name'] as String,
      totalemis: json['totalemis'] as int,
      interestrate: json['interestrate'] as String,
      advemi: json['advemi'] as int,
      downPayment: json['downPayment'] as String,
      emiAmount: json['emiAmount'] as String,
    );

Map<String, dynamic> _$$_EmiPlanToJson(_$_EmiPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalemis': instance.totalemis,
      'interestrate': instance.interestrate,
      'advemi': instance.advemi,
      'downPayment': instance.downPayment,
      'emiAmount': instance.emiAmount,
    };
