// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoanFilters {
  String? get searchQuery => throw _privateConstructorUsedError;
  LoanStatus? get status => throw _privateConstructorUsedError;
  DateTime? get fromDate => throw _privateConstructorUsedError;
  DateTime? get toDate => throw _privateConstructorUsedError;
  IdName? get bpAddressId => throw _privateConstructorUsedError;
  IdName? get bpId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoanFiltersCopyWith<LoanFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanFiltersCopyWith<$Res> {
  factory $LoanFiltersCopyWith(
          LoanFilters value, $Res Function(LoanFilters) then) =
      _$LoanFiltersCopyWithImpl<$Res, LoanFilters>;
  @useResult
  $Res call(
      {String? searchQuery,
      LoanStatus? status,
      DateTime? fromDate,
      DateTime? toDate,
      IdName? bpAddressId,
      IdName? bpId});

  $IdNameCopyWith<$Res>? get bpAddressId;
  $IdNameCopyWith<$Res>? get bpId;
}

/// @nodoc
class _$LoanFiltersCopyWithImpl<$Res, $Val extends LoanFilters>
    implements $LoanFiltersCopyWith<$Res> {
  _$LoanFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? status = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? bpAddressId = freezed,
    Object? bpId = freezed,
  }) {
    return _then(_value.copyWith(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoanStatus?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bpAddressId: freezed == bpAddressId
          ? _value.bpAddressId
          : bpAddressId // ignore: cast_nullable_to_non_nullable
              as IdName?,
      bpId: freezed == bpId
          ? _value.bpId
          : bpId // ignore: cast_nullable_to_non_nullable
              as IdName?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdNameCopyWith<$Res>? get bpAddressId {
    if (_value.bpAddressId == null) {
      return null;
    }

    return $IdNameCopyWith<$Res>(_value.bpAddressId!, (value) {
      return _then(_value.copyWith(bpAddressId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IdNameCopyWith<$Res>? get bpId {
    if (_value.bpId == null) {
      return null;
    }

    return $IdNameCopyWith<$Res>(_value.bpId!, (value) {
      return _then(_value.copyWith(bpId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoanFiltersCopyWith<$Res>
    implements $LoanFiltersCopyWith<$Res> {
  factory _$$_LoanFiltersCopyWith(
          _$_LoanFilters value, $Res Function(_$_LoanFilters) then) =
      __$$_LoanFiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? searchQuery,
      LoanStatus? status,
      DateTime? fromDate,
      DateTime? toDate,
      IdName? bpAddressId,
      IdName? bpId});

  @override
  $IdNameCopyWith<$Res>? get bpAddressId;
  @override
  $IdNameCopyWith<$Res>? get bpId;
}

/// @nodoc
class __$$_LoanFiltersCopyWithImpl<$Res>
    extends _$LoanFiltersCopyWithImpl<$Res, _$_LoanFilters>
    implements _$$_LoanFiltersCopyWith<$Res> {
  __$$_LoanFiltersCopyWithImpl(
      _$_LoanFilters _value, $Res Function(_$_LoanFilters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? status = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? bpAddressId = freezed,
    Object? bpId = freezed,
  }) {
    return _then(_$_LoanFilters(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoanStatus?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bpAddressId: freezed == bpAddressId
          ? _value.bpAddressId
          : bpAddressId // ignore: cast_nullable_to_non_nullable
              as IdName?,
      bpId: freezed == bpId
          ? _value.bpId
          : bpId // ignore: cast_nullable_to_non_nullable
              as IdName?,
    ));
  }
}

/// @nodoc

class _$_LoanFilters implements _LoanFilters {
  const _$_LoanFilters(
      {this.searchQuery,
      this.status,
      this.fromDate,
      this.toDate,
      this.bpAddressId,
      this.bpId});

  @override
  final String? searchQuery;
  @override
  final LoanStatus? status;
  @override
  final DateTime? fromDate;
  @override
  final DateTime? toDate;
  @override
  final IdName? bpAddressId;
  @override
  final IdName? bpId;

  @override
  String toString() {
    return 'LoanFilters(searchQuery: $searchQuery, status: $status, fromDate: $fromDate, toDate: $toDate, bpAddressId: $bpAddressId, bpId: $bpId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoanFilters &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.bpAddressId, bpAddressId) ||
                other.bpAddressId == bpAddressId) &&
            (identical(other.bpId, bpId) || other.bpId == bpId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, searchQuery, status, fromDate, toDate, bpAddressId, bpId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoanFiltersCopyWith<_$_LoanFilters> get copyWith =>
      __$$_LoanFiltersCopyWithImpl<_$_LoanFilters>(this, _$identity);
}

abstract class _LoanFilters implements LoanFilters {
  const factory _LoanFilters(
      {final String? searchQuery,
      final LoanStatus? status,
      final DateTime? fromDate,
      final DateTime? toDate,
      final IdName? bpAddressId,
      final IdName? bpId}) = _$_LoanFilters;

  @override
  String? get searchQuery;
  @override
  LoanStatus? get status;
  @override
  DateTime? get fromDate;
  @override
  DateTime? get toDate;
  @override
  IdName? get bpAddressId;
  @override
  IdName? get bpId;
  @override
  @JsonKey(ignore: true)
  _$$_LoanFiltersCopyWith<_$_LoanFilters> get copyWith =>
      throw _privateConstructorUsedError;
}
