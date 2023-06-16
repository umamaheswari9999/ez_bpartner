// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerLocationDto _$$_CustomerLocationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerLocationDto(
      currentAddress: json['currentAddress'] == null
          ? null
          : CustomerAddressDto.fromJson(
              json['currentAddress'] as Map<String, dynamic>),
      permanentAddress: json['permanentAddress'] == null
          ? null
          : CustomerAddressDto.fromJson(
              json['permanentAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CustomerLocationDtoToJson(
        _$_CustomerLocationDto instance) =>
    <String, dynamic>{
      'currentAddress': instance.currentAddress,
      'permanentAddress': instance.permanentAddress,
    };
