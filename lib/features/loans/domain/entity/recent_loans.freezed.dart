// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_loans.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentLoans {
  List<Loan> get draftLoans => throw _privateConstructorUsedError;
  List<Loan> get preApprovedLoans => throw _privateConstructorUsedError;
  List<Loan> get disbursedLoans => throw _privateConstructorUsedError;
  List<Loan> get rejectedLoans => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentLoansCopyWith<RecentLoans> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentLoansCopyWith<$Res> {
  factory $RecentLoansCopyWith(
          RecentLoans value, $Res Function(RecentLoans) then) =
      _$RecentLoansCopyWithImpl<$Res, RecentLoans>;
  @useResult
  $Res call(
      {List<Loan> draftLoans,
      List<Loan> preApprovedLoans,
      List<Loan> disbursedLoans,
      List<Loan> rejectedLoans});
}

/// @nodoc
class _$RecentLoansCopyWithImpl<$Res, $Val extends RecentLoans>
    implements $RecentLoansCopyWith<$Res> {
  _$RecentLoansCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftLoans = null,
    Object? preApprovedLoans = null,
    Object? disbursedLoans = null,
    Object? rejectedLoans = null,
  }) {
    return _then(_value.copyWith(
      draftLoans: null == draftLoans
          ? _value.draftLoans
          : draftLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      preApprovedLoans: null == preApprovedLoans
          ? _value.preApprovedLoans
          : preApprovedLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      disbursedLoans: null == disbursedLoans
          ? _value.disbursedLoans
          : disbursedLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      rejectedLoans: null == rejectedLoans
          ? _value.rejectedLoans
          : rejectedLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentLoansCopyWith<$Res>
    implements $RecentLoansCopyWith<$Res> {
  factory _$$_RecentLoansCopyWith(
          _$_RecentLoans value, $Res Function(_$_RecentLoans) then) =
      __$$_RecentLoansCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Loan> draftLoans,
      List<Loan> preApprovedLoans,
      List<Loan> disbursedLoans,
      List<Loan> rejectedLoans});
}

/// @nodoc
class __$$_RecentLoansCopyWithImpl<$Res>
    extends _$RecentLoansCopyWithImpl<$Res, _$_RecentLoans>
    implements _$$_RecentLoansCopyWith<$Res> {
  __$$_RecentLoansCopyWithImpl(
      _$_RecentLoans _value, $Res Function(_$_RecentLoans) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftLoans = null,
    Object? preApprovedLoans = null,
    Object? disbursedLoans = null,
    Object? rejectedLoans = null,
  }) {
    return _then(_$_RecentLoans(
      draftLoans: null == draftLoans
          ? _value._draftLoans
          : draftLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      preApprovedLoans: null == preApprovedLoans
          ? _value._preApprovedLoans
          : preApprovedLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      disbursedLoans: null == disbursedLoans
          ? _value._disbursedLoans
          : disbursedLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
      rejectedLoans: null == rejectedLoans
          ? _value._rejectedLoans
          : rejectedLoans // ignore: cast_nullable_to_non_nullable
              as List<Loan>,
    ));
  }
}

/// @nodoc

class _$_RecentLoans implements _RecentLoans {
  const _$_RecentLoans(
      {required final List<Loan> draftLoans,
      required final List<Loan> preApprovedLoans,
      required final List<Loan> disbursedLoans,
      required final List<Loan> rejectedLoans})
      : _draftLoans = draftLoans,
        _preApprovedLoans = preApprovedLoans,
        _disbursedLoans = disbursedLoans,
        _rejectedLoans = rejectedLoans;

  final List<Loan> _draftLoans;
  @override
  List<Loan> get draftLoans {
    if (_draftLoans is EqualUnmodifiableListView) return _draftLoans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_draftLoans);
  }

  final List<Loan> _preApprovedLoans;
  @override
  List<Loan> get preApprovedLoans {
    if (_preApprovedLoans is EqualUnmodifiableListView)
      return _preApprovedLoans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preApprovedLoans);
  }

  final List<Loan> _disbursedLoans;
  @override
  List<Loan> get disbursedLoans {
    if (_disbursedLoans is EqualUnmodifiableListView) return _disbursedLoans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disbursedLoans);
  }

  final List<Loan> _rejectedLoans;
  @override
  List<Loan> get rejectedLoans {
    if (_rejectedLoans is EqualUnmodifiableListView) return _rejectedLoans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rejectedLoans);
  }

  @override
  String toString() {
    return 'RecentLoans(draftLoans: $draftLoans, preApprovedLoans: $preApprovedLoans, disbursedLoans: $disbursedLoans, rejectedLoans: $rejectedLoans)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentLoans &&
            const DeepCollectionEquality()
                .equals(other._draftLoans, _draftLoans) &&
            const DeepCollectionEquality()
                .equals(other._preApprovedLoans, _preApprovedLoans) &&
            const DeepCollectionEquality()
                .equals(other._disbursedLoans, _disbursedLoans) &&
            const DeepCollectionEquality()
                .equals(other._rejectedLoans, _rejectedLoans));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_draftLoans),
      const DeepCollectionEquality().hash(_preApprovedLoans),
      const DeepCollectionEquality().hash(_disbursedLoans),
      const DeepCollectionEquality().hash(_rejectedLoans));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentLoansCopyWith<_$_RecentLoans> get copyWith =>
      __$$_RecentLoansCopyWithImpl<_$_RecentLoans>(this, _$identity);
}

abstract class _RecentLoans implements RecentLoans {
  const factory _RecentLoans(
      {required final List<Loan> draftLoans,
      required final List<Loan> preApprovedLoans,
      required final List<Loan> disbursedLoans,
      required final List<Loan> rejectedLoans}) = _$_RecentLoans;

  @override
  List<Loan> get draftLoans;
  @override
  List<Loan> get preApprovedLoans;
  @override
  List<Loan> get disbursedLoans;
  @override
  List<Loan> get rejectedLoans;
  @override
  @JsonKey(ignore: true)
  _$$_RecentLoansCopyWith<_$_RecentLoans> get copyWith =>
      throw _privateConstructorUsedError;
}
