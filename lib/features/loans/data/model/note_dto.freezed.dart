// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) {
  return _NoteDto.fromJson(json);
}

/// @nodoc
mixin _$NoteDto {
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'creationDate')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy\$_identifier')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy')
  String get createdById => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDtoCopyWith<NoteDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDtoCopyWith<$Res> {
  factory $NoteDtoCopyWith(NoteDto value, $Res Function(NoteDto) then) =
      _$NoteDtoCopyWithImpl<$Res, NoteDto>;
  @useResult
  $Res call(
      {String note,
      @JsonKey(name: 'creationDate') String createdAt,
      @JsonKey(name: 'createdBy\$_identifier') String createdBy,
      @JsonKey(name: 'createdBy') String createdById});
}

/// @nodoc
class _$NoteDtoCopyWithImpl<$Res, $Val extends NoteDto>
    implements $NoteDtoCopyWith<$Res> {
  _$NoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? createdById = null,
  }) {
    return _then(_value.copyWith(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteDtoCopyWith<$Res> implements $NoteDtoCopyWith<$Res> {
  factory _$$_NoteDtoCopyWith(
          _$_NoteDto value, $Res Function(_$_NoteDto) then) =
      __$$_NoteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String note,
      @JsonKey(name: 'creationDate') String createdAt,
      @JsonKey(name: 'createdBy\$_identifier') String createdBy,
      @JsonKey(name: 'createdBy') String createdById});
}

/// @nodoc
class __$$_NoteDtoCopyWithImpl<$Res>
    extends _$NoteDtoCopyWithImpl<$Res, _$_NoteDto>
    implements _$$_NoteDtoCopyWith<$Res> {
  __$$_NoteDtoCopyWithImpl(_$_NoteDto _value, $Res Function(_$_NoteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? createdById = null,
  }) {
    return _then(_$_NoteDto(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteDto extends _NoteDto {
  const _$_NoteDto(
      {required this.note,
      @JsonKey(name: 'creationDate') required this.createdAt,
      @JsonKey(name: 'createdBy\$_identifier') required this.createdBy,
      @JsonKey(name: 'createdBy') required this.createdById})
      : super._();

  factory _$_NoteDto.fromJson(Map<String, dynamic> json) =>
      _$$_NoteDtoFromJson(json);

  @override
  final String note;
  @override
  @JsonKey(name: 'creationDate')
  final String createdAt;
  @override
  @JsonKey(name: 'createdBy\$_identifier')
  final String createdBy;
  @override
  @JsonKey(name: 'createdBy')
  final String createdById;

  @override
  String toString() {
    return 'NoteDto(note: $note, createdAt: $createdAt, createdBy: $createdBy, createdById: $createdById)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDto &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, note, createdAt, createdBy, createdById);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteDtoCopyWith<_$_NoteDto> get copyWith =>
      __$$_NoteDtoCopyWithImpl<_$_NoteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDtoToJson(
      this,
    );
  }
}

abstract class _NoteDto extends NoteDto {
  const factory _NoteDto(
      {required final String note,
      @JsonKey(name: 'creationDate')
          required final String createdAt,
      @JsonKey(name: 'createdBy\$_identifier')
          required final String createdBy,
      @JsonKey(name: 'createdBy')
          required final String createdById}) = _$_NoteDto;
  const _NoteDto._() : super._();

  factory _NoteDto.fromJson(Map<String, dynamic> json) = _$_NoteDto.fromJson;

  @override
  String get note;
  @override
  @JsonKey(name: 'creationDate')
  String get createdAt;
  @override
  @JsonKey(name: 'createdBy\$_identifier')
  String get createdBy;
  @override
  @JsonKey(name: 'createdBy')
  String get createdById;
  @override
  @JsonKey(ignore: true)
  _$$_NoteDtoCopyWith<_$_NoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
