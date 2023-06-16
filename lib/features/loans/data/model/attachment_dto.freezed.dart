// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttachmentDto _$AttachmentDtoFromJson(Map<String, dynamic> json) {
  return _AttachmentDto.fromJson(json);
}

/// @nodoc
mixin _$AttachmentDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttachmentDtoCopyWith<AttachmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentDtoCopyWith<$Res> {
  factory $AttachmentDtoCopyWith(
          AttachmentDto value, $Res Function(AttachmentDto) then) =
      _$AttachmentDtoCopyWithImpl<$Res, AttachmentDto>;
  @useResult
  $Res call(
      {String id, String name, @JsonKey(defaultValue: '') String description});
}

/// @nodoc
class _$AttachmentDtoCopyWithImpl<$Res, $Val extends AttachmentDto>
    implements $AttachmentDtoCopyWith<$Res> {
  _$AttachmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AttachmentDtoCopyWith<$Res>
    implements $AttachmentDtoCopyWith<$Res> {
  factory _$$_AttachmentDtoCopyWith(
          _$_AttachmentDto value, $Res Function(_$_AttachmentDto) then) =
      __$$_AttachmentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, @JsonKey(defaultValue: '') String description});
}

/// @nodoc
class __$$_AttachmentDtoCopyWithImpl<$Res>
    extends _$AttachmentDtoCopyWithImpl<$Res, _$_AttachmentDto>
    implements _$$_AttachmentDtoCopyWith<$Res> {
  __$$_AttachmentDtoCopyWithImpl(
      _$_AttachmentDto _value, $Res Function(_$_AttachmentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$_AttachmentDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttachmentDto extends _AttachmentDto {
  const _$_AttachmentDto(
      {required this.id,
      required this.name,
      @JsonKey(defaultValue: '') required this.description})
      : super._();

  factory _$_AttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$$_AttachmentDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String description;

  @override
  String toString() {
    return 'AttachmentDto(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttachmentDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttachmentDtoCopyWith<_$_AttachmentDto> get copyWith =>
      __$$_AttachmentDtoCopyWithImpl<_$_AttachmentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttachmentDtoToJson(
      this,
    );
  }
}

abstract class _AttachmentDto extends AttachmentDto {
  const factory _AttachmentDto(
          {required final String id,
          required final String name,
          @JsonKey(defaultValue: '') required final String description}) =
      _$_AttachmentDto;
  const _AttachmentDto._() : super._();

  factory _AttachmentDto.fromJson(Map<String, dynamic> json) =
      _$_AttachmentDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_AttachmentDtoCopyWith<_$_AttachmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}
