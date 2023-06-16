// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerAddressDto _$$_CustomerAddressDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerAddressDto(
      id: json['id'] as String,
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      cityName: json['cityName'] as String? ?? '',
      countryName: json[r'country$_identifier'] as String? ?? '',
      stateName: json[r'region$_identifier'] as String? ?? '',
    );

Map<String, dynamic> _$$_CustomerAddressDtoToJson(
        _$_CustomerAddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'postalCode': instance.postalCode,
      'cityName': instance.cityName,
      r'country$_identifier': instance.countryName,
      r'region$_identifier': instance.stateName,
    };
