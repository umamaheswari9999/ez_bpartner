// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Simple {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimpleCopyWith<Simple> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleCopyWith<$Res> {
  factory $SimpleCopyWith(Simple value, $Res Function(Simple) then) =
      _$SimpleCopyWithImpl<$Res, Simple>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$SimpleCopyWithImpl<$Res, $Val extends Simple>
    implements $SimpleCopyWith<$Res> {
  _$SimpleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimpleCopyWith<$Res> implements $SimpleCopyWith<$Res> {
  factory _$$_SimpleCopyWith(_$_Simple value, $Res Function(_$_Simple) then) =
      __$$_SimpleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_SimpleCopyWithImpl<$Res>
    extends _$SimpleCopyWithImpl<$Res, _$_Simple>
    implements _$$_SimpleCopyWith<$Res> {
  __$$_SimpleCopyWithImpl(_$_Simple _value, $Res Function(_$_Simple) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_Simple(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Simple implements _Simple {
  const _$_Simple({required this.id, required this.title});

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'Simple(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Simple &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimpleCopyWith<_$_Simple> get copyWith =>
      __$$_SimpleCopyWithImpl<_$_Simple>(this, _$identity);
}

abstract class _Simple implements Simple {
  const factory _Simple(
      {required final String id, required final String title}) = _$_Simple;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleCopyWith<_$_Simple> get copyWith =>
      throw _privateConstructorUsedError;
}
