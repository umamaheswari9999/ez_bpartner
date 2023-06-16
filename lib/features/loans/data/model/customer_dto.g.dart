// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerDto _$$_CustomerDtoFromJson(Map<String, dynamic> json) =>
    _$_CustomerDto(
      master: ClientMasterDto.fromJson(
          json['ClientMaster_Header'] as Map<String, dynamic>),
      locations: (json['ClientMaster_Locations'] as List<dynamic>)
          .map((e) => CustomerLocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      banks: (json['ClientMaster_Bank'] as List<dynamic>)
          .map((e) => CustomerBankDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      mandates: (json['ClientMaster_Mandates'] as List<dynamic>)
          .map((e) => CustomerMandateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CustomerDtoToJson(_$_CustomerDto instance) =>
    <String, dynamic>{
      'ClientMaster_Header': instance.master,
      'ClientMaster_Locations': instance.locations,
      'ClientMaster_Bank': instance.banks,
      'ClientMaster_Mandates': instance.mandates,
    };
