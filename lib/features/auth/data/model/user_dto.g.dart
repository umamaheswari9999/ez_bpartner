// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      defaultRole: json['defaultRole'] as String,
      defaultOrgId: json['defaultOrganization'] as String,
      organizationId: json['organization'] as String,
      organizationName: json[r'organization$_identifier'] as String,
      clientId: json['client'] as String,
      clientName: json[r'client$_identifier'] as String,
      businessPartnerId: json['businessPartner'] as String?,
      businessPartnerName: json[r'businessPartner$_identifier'] as String?,
      partnerAddressId: json['partnerAddress'] as String?,
      partnerAddressName: json[r'partnerAddress$_identifier'] as String?,
      isManager: json['samIsmanager'] as bool,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'defaultRole': instance.defaultRole,
      'defaultOrganization': instance.defaultOrgId,
      'organization': instance.organizationId,
      r'organization$_identifier': instance.organizationName,
      'client': instance.clientId,
      r'client$_identifier': instance.clientName,
      'businessPartner': instance.businessPartnerId,
      r'businessPartner$_identifier': instance.businessPartnerName,
      'partnerAddress': instance.partnerAddressId,
      r'partnerAddress$_identifier': instance.partnerAddressName,
      'samIsmanager': instance.isManager,
    };
