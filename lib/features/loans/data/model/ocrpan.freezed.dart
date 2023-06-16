// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocrpan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OCRPan _$OCRPanFromJson(Map<String, dynamic> json) {
  return _OCRPan.fromJson(json);
}

/// @nodoc
mixin _$OCRPan {
  String get name => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'fathers_name', defaultValue: '')
  String? get fathersName => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_no', defaultValue: '')
  String get idNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_type')
  String get idtype => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OCRPanCopyWith<OCRPan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OCRPanCopyWith<$Res> {
  factory $OCRPanCopyWith(OCRPan value, $Res Function(OCRPan) then) =
      _$OCRPanCopyWithImpl<$Res, OCRPan>;
  @useResult
  $Res call(
      {String name,
      String? dob,
      String? gender,
      @JsonKey(name: 'fathers_name', defaultValue: '') String? fathersName,
      @JsonKey(name: 'id_no', defaultValue: '') String idNo,
      @JsonKey(name: 'id_type') String idtype});
}

/// @nodoc
class _$OCRPanCopyWithImpl<$Res, $Val extends OCRPan>
    implements $OCRPanCopyWith<$Res> {
  _$OCRPanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? fathersName = freezed,
    Object? idNo = null,
    Object? idtype = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      fathersName: freezed == fathersName
          ? _value.fathersName
          : fathersName // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: null == idNo
          ? _value.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String,
      idtype: null == idtype
          ? _value.idtype
          : idtype // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OCRPanCopyWith<$Res> implements $OCRPanCopyWith<$Res> {
  factory _$$_OCRPanCopyWith(_$_OCRPan value, $Res Function(_$_OCRPan) then) =
      __$$_OCRPanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? dob,
      String? gender,
      @JsonKey(name: 'fathers_name', defaultValue: '') String? fathersName,
      @JsonKey(name: 'id_no', defaultValue: '') String idNo,
      @JsonKey(name: 'id_type') String idtype});
}

/// @nodoc
class __$$_OCRPanCopyWithImpl<$Res>
    extends _$OCRPanCopyWithImpl<$Res, _$_OCRPan>
    implements _$$_OCRPanCopyWith<$Res> {
  __$$_OCRPanCopyWithImpl(_$_OCRPan _value, $Res Function(_$_OCRPan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? fathersName = freezed,
    Object? idNo = null,
    Object? idtype = null,
  }) {
    return _then(_$_OCRPan(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      fathersName: freezed == fathersName
          ? _value.fathersName
          : fathersName // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: null == idNo
          ? _value.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String,
      idtype: null == idtype
          ? _value.idtype
          : idtype // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OCRPan extends _OCRPan {
  _$_OCRPan(
      {required this.name,
      this.dob,
      this.gender,
      @JsonKey(name: 'fathers_name', defaultValue: '') this.fathersName,
      @JsonKey(name: 'id_no', defaultValue: '') required this.idNo,
      @JsonKey(name: 'id_type') required this.idtype})
      : super._();

  factory _$_OCRPan.fromJson(Map<String, dynamic> json) =>
      _$$_OCRPanFromJson(json);

  @override
  final String name;
  @override
  final String? dob;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'fathers_name', defaultValue: '')
  final String? fathersName;
  @override
  @JsonKey(name: 'id_no', defaultValue: '')
  final String idNo;
  @override
  @JsonKey(name: 'id_type')
  final String idtype;

  @override
  String toString() {
    return 'OCRPan(name: $name, dob: $dob, gender: $gender, fathersName: $fathersName, idNo: $idNo, idtype: $idtype)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OCRPan &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.fathersName, fathersName) ||
                other.fathersName == fathersName) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.idtype, idtype) || other.idtype == idtype));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, dob, gender, fathersName, idNo, idtype);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OCRPanCopyWith<_$_OCRPan> get copyWith =>
      __$$_OCRPanCopyWithImpl<_$_OCRPan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OCRPanToJson(
      this,
    );
  }
}

abstract class _OCRPan extends OCRPan {
  factory _OCRPan(
      {required final String name,
      final String? dob,
      final String? gender,
      @JsonKey(name: 'fathers_name', defaultValue: '')
          final String? fathersName,
      @JsonKey(name: 'id_no', defaultValue: '')
          required final String idNo,
      @JsonKey(name: 'id_type')
          required final String idtype}) = _$_OCRPan;
  _OCRPan._() : super._();

  factory _OCRPan.fromJson(Map<String, dynamic> json) = _$_OCRPan.fromJson;

  @override
  String get name;
  @override
  String? get dob;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'fathers_name', defaultValue: '')
  String? get fathersName;
  @override
  @JsonKey(name: 'id_no', defaultValue: '')
  String get idNo;
  @override
  @JsonKey(name: 'id_type')
  String get idtype;
  @override
  @JsonKey(ignore: true)
  _$$_OCRPanCopyWith<_$_OCRPan> get copyWith =>
      throw _privateConstructorUsedError;
}
