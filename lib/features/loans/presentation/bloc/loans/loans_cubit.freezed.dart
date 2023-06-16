// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loans_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoansState {
  bool get isloading => throw _privateConstructorUsedError;
  LoanFilters get filter => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  List<Loan> get preapproved => throw _privateConstructorUsedError;
  List<Loan> get disbursed => throw _privateConstructorUsedError;
  List<Loan> get draft => throw _privateConstructorUsedError;
  List<Loan> get rejected => throw _privateConstructorUsedError;
  List<Loan> get allLoans => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoansStateCopyWith<LoansState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoansStateCopyWith<$Res> {
  factory $LoansStateCopyWith(
          LoansState value, $Res Function(LoansState) then) =
      _$LoansStateCopyWithImpl<$Res, LoansState>;
  @useResult
  $Res call(
      {bool isloading,
      LoanFilters filter,
      bool isSuccess,
      List<Loan> preapproved,
      List<Loan> disbursed,
      List<Loan> draft,
      List<Loan> rejected,
      List<Loan> allLoans,
      bool hasReachedMax,
      Failure? failure});

  $LoanFiltersCopyWith<$Res> get filter;
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$LoansStateCopyWithImpl<$Res, $Val extends LoansState>
    implements $LoansStateCopyWith<$Res> {
  _$LoansStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? filter = null,
    Object? isSuccess = null,
    Object? preapproved = null,
    Object? disbursed = null,
    Object? draft = null,
    Object? rejected = null,
    Object? allLoans = null,
    Object? hasReachedMax = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as LoanFilters,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      preapproved: null == preapproved
          ? _value.preapproved
          : preapproved // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      disbursed: null == disbursed
          ? _value.disbursed
          : disbursed // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      rejected: null == rejected
          ? _value.rejected
          : rejected // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      allLoans: null == allLoans
          ? _value.allLoans
          : allLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoanFiltersCopyWith<$Res> get filter {
    return $LoanFiltersCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoansStateCopyWith<$Res>
    implements $LoansStateCopyWith<$Res> {
  factory _$$_LoansStateCopyWith(
          _$_LoansState value, $Res Function(_$_LoansState) then) =
      __$$_LoansStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloading,
      LoanFilters filter,
      bool isSuccess,
      List<Loan> preapproved,
      List<Loan> disbursed,
      List<Loan> draft,
      List<Loan> rejected,
      List<Loan> allLoans,
      bool hasReachedMax,
      Failure? failure});

  @override
  $LoanFiltersCopyWith<$Res> get filter;
  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$_LoansStateCopyWithImpl<$Res>
    extends _$LoansStateCopyWithImpl<$Res, _$_LoansState>
    implements _$$_LoansStateCopyWith<$Res> {
  __$$_LoansStateCopyWithImpl(
      _$_LoansState _value, $Res Function(_$_LoansState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? filter = null,
    Object? isSuccess = null,
    Object? preapproved = null,
    Object? disbursed = null,
    Object? draft = null,
    Object? rejected = null,
    Object? allLoans = null,
    Object? hasReachedMax = null,
    Object? failure = freezed,
  }) {
    return _then(_$_LoansState(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as LoanFilters,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      preapproved: null == preapproved
          ? _value._preapproved
          : preapproved // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      disbursed: null == disbursed
          ? _value._disbursed
          : disbursed // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      draft: null == draft
          ? _value._draft
          : draft // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      rejected: null == rejected
          ? _value._rejected
          : rejected // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      allLoans: null == allLoans
          ? _value._allLoans
          : allLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_LoansState implements _LoansState {
  const _$_LoansState(
      {required this.isloading,
      required this.filter,
      required this.isSuccess,
      required final List<Loan> preapproved,
      required final List<Loan> disbursed,
      required final List<Loan> draft,
      required final List<Loan> rejected,
      required final List<Loan> allLoans,
      required this.hasReachedMax,
      this.failure})
      : _preapproved = preapproved,
        _disbursed = disbursed,
        _draft = draft,
        _rejected = rejected,
        _allLoans = allLoans;

  @override
  final bool isloading;
  @override
  final LoanFilters filter;
  @override
  final bool isSuccess;
  final List<Loan> _preapproved;
  @override
  List<Loan> get preapproved {
    if (_preapproved is EqualUnmodifiableListView) return _preapproved;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preapproved);
  }

  final List<Loan> _disbursed;
  @override
  List<Loan> get disbursed {
    if (_disbursed is EqualUnmodifiableListView) return _disbursed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disbursed);
  }

  final List<Loan> _draft;
  @override
  List<Loan> get draft {
    if (_draft is EqualUnmodifiableListView) return _draft;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_draft);
  }

  final List<Loan> _rejected;
  @override
  List<Loan> get rejected {
    if (_rejected is EqualUnmodifiableListView) return _rejected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rejected);
  }

  final List<Loan> _allLoans;
  @override
  List<Loan> get allLoans {
    if (_allLoans is EqualUnmodifiableListView) return _allLoans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allLoans);
  }

  @override
  final bool hasReachedMax;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'LoansState(isloading: $isloading, filter: $filter, isSuccess: $isSuccess, preapproved: $preapproved, disbursed: $disbursed, draft: $draft, rejected: $rejected, allLoans: $allLoans, hasReachedMax: $hasReachedMax, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoansState &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            const DeepCollectionEquality()
                .equals(other._preapproved, _preapproved) &&
            const DeepCollectionEquality()
                .equals(other._disbursed, _disbursed) &&
            const DeepCollectionEquality().equals(other._draft, _draft) &&
            const DeepCollectionEquality().equals(other._rejected, _rejected) &&
            const DeepCollectionEquality().equals(other._allLoans, _allLoans) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isloading,
      filter,
      isSuccess,
      const DeepCollectionEquality().hash(_preapproved),
      const DeepCollectionEquality().hash(_disbursed),
      const DeepCollectionEquality().hash(_draft),
      const DeepCollectionEquality().hash(_rejected),
      const DeepCollectionEquality().hash(_allLoans),
      hasReachedMax,
      failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoansStateCopyWith<_$_LoansState> get copyWith =>
      __$$_LoansStateCopyWithImpl<_$_LoansState>(this, _$identity);
}

abstract class _LoansState implements LoansState {
  const factory _LoansState(
      {required final bool isloading,
      required final LoanFilters filter,
      required final bool isSuccess,
      required final List<Loan> preapproved,
      required final List<Loan> disbursed,
      required final List<Loan> draft,
      required final List<Loan> rejected,
      required final List<Loan> allLoans,
      required final bool hasReachedMax,
      final Failure? failure}) = _$_LoansState;

  @override
  bool get isloading;
  @override
  LoanFilters get filter;
  @override
  bool get isSuccess;
  @override
  List<Loan> get preapproved;
  @override
  List<Loan> get disbursed;
  @override
  List<Loan> get draft;
  @override
  List<Loan> get rejected;
  @override
  List<Loan> get allLoans;
  @override
  bool get hasReachedMax;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_LoansStateCopyWith<_$_LoansState> get copyWith =>
      throw _privateConstructorUsedError;
}
