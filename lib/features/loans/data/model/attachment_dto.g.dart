// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttachmentDto _$$_AttachmentDtoFromJson(Map<String, dynamic> json) =>
    _$_AttachmentDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_AttachmentDtoToJson(_$_AttachmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
