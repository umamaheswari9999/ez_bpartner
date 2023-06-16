// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdName _$IdNameFromJson(Map<String, dynamic> json) {
  return _IdName.fromJson(json);
}

/// @nodoc
mixin _$IdName {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdNameCopyWith<IdName> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdNameCopyWith<$Res> {
  factory $IdNameCopyWith(IdName value, $Res Function(IdName) then) =
      _$IdNameCopyWithImpl<$Res, IdName>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class _$IdNameCopyWithImpl<$Res, $Val extends IdName>
    implements $IdNameCopyWith<$Res> {
  _$IdNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdNameCopyWith<$Res> implements $IdNameCopyWith<$Res> {
  factory _$$_IdNameCopyWith(_$_IdName value, $Res Function(_$_IdName) then) =
      __$$_IdNameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class __$$_IdNameCopyWithImpl<$Res>
    extends _$IdNameCopyWithImpl<$Res, _$_IdName>
    implements _$$_IdNameCopyWith<$Res> {
  __$$_IdNameCopyWithImpl(_$_IdName _value, $Res Function(_$_IdName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_IdName(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdName extends _IdName {
  const _$_IdName(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name})
      : super._();

  factory _$_IdName.fromJson(Map<String, dynamic> json) =>
      _$$_IdNameFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'IdName(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdName &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdNameCopyWith<_$_IdName> get copyWith =>
      __$$_IdNameCopyWithImpl<_$_IdName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdNameToJson(
      this,
    );
  }
}

abstract class _IdName extends IdName {
  const factory _IdName(
      {@JsonKey(name: 'id')
          required final String id,
      @JsonKey(name: 'name', defaultValue: '')
          required final String name}) = _$_IdName;
  const _IdName._() : super._();

  factory _IdName.fromJson(Map<String, dynamic> json) = _$_IdName.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_IdNameCopyWith<_$_IdName> get copyWith =>
      throw _privateConstructorUsedError;
}
