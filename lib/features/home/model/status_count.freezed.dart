// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatusCount _$StatusCountFromJson(Map<String, dynamic> json) {
  return _GraphData.fromJson(json);
}

/// @nodoc
mixin _$StatusCount {
  String get count => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCountCopyWith<StatusCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCountCopyWith<$Res> {
  factory $StatusCountCopyWith(
          StatusCount value, $Res Function(StatusCount) then) =
      _$StatusCountCopyWithImpl<$Res, StatusCount>;
  @useResult
  $Res call({String count, String status});
}

/// @nodoc
class _$StatusCountCopyWithImpl<$Res, $Val extends StatusCount>
    implements $StatusCountCopyWith<$Res> {
  _$StatusCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GraphDataCopyWith<$Res>
    implements $StatusCountCopyWith<$Res> {
  factory _$$_GraphDataCopyWith(
          _$_GraphData value, $Res Function(_$_GraphData) then) =
      __$$_GraphDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String count, String status});
}

/// @nodoc
class __$$_GraphDataCopyWithImpl<$Res>
    extends _$StatusCountCopyWithImpl<$Res, _$_GraphData>
    implements _$$_GraphDataCopyWith<$Res> {
  __$$_GraphDataCopyWithImpl(
      _$_GraphData _value, $Res Function(_$_GraphData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? status = null,
  }) {
    return _then(_$_GraphData(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GraphData extends _GraphData {
  _$_GraphData({required this.count, required this.status}) : super._();

  factory _$_GraphData.fromJson(Map<String, dynamic> json) =>
      _$$_GraphDataFromJson(json);

  @override
  final String count;
  @override
  final String status;

  @override
  String toString() {
    return 'StatusCount(count: $count, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GraphData &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GraphDataCopyWith<_$_GraphData> get copyWith =>
      __$$_GraphDataCopyWithImpl<_$_GraphData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GraphDataToJson(
      this,
    );
  }
}

abstract class _GraphData extends StatusCount {
  factory _GraphData(
      {required final String count,
      required final String status}) = _$_GraphData;
  _GraphData._() : super._();

  factory _GraphData.fromJson(Map<String, dynamic> json) =
      _$_GraphData.fromJson;

  @override
  String get count;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_GraphDataCopyWith<_$_GraphData> get copyWith =>
      throw _privateConstructorUsedError;
}
