// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDto _$$_NoteDtoFromJson(Map<String, dynamic> json) => _$_NoteDto(
      note: json['note'] as String,
      createdAt: json['creationDate'] as String,
      createdBy: json[r'createdBy$_identifier'] as String,
      createdById: json['createdBy'] as String,
    );

Map<String, dynamic> _$$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'note': instance.note,
      'creationDate': instance.createdAt,
      r'createdBy$_identifier': instance.createdBy,
      'createdBy': instance.createdById,
    };
