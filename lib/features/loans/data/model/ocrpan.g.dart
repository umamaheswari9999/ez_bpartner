// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocrpan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OCRPan _$$_OCRPanFromJson(Map<String, dynamic> json) => _$_OCRPan(
      name: json['name'] as String,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      fathersName: json['fathers_name'] as String? ?? '',
      idNo: json['id_no'] as String? ?? '',
      idtype: json['id_type'] as String,
    );

Map<String, dynamic> _$$_OCRPanToJson(_$_OCRPan instance) => <String, dynamic>{
      'name': instance.name,
      'dob': instance.dob,
      'gender': instance.gender,
      'fathers_name': instance.fathersName,
      'id_no': instance.idNo,
      'id_type': instance.idtype,
    };
