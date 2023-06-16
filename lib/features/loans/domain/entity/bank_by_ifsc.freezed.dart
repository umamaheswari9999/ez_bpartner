// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_by_ifsc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankByIfsc {
  String get ifscCode => throw _privateConstructorUsedError;
  String get bankBranchName => throw _privateConstructorUsedError;
  String get bankBranchId => throw _privateConstructorUsedError;
  String get micr => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankByIfscCopyWith<BankByIfsc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankByIfscCopyWith<$Res> {
  factory $BankByIfscCopyWith(
          BankByIfsc value, $Res Function(BankByIfsc) then) =
      _$BankByIfscCopyWithImpl<$Res, BankByIfsc>;
  @useResult
  $Res call(
      {String ifscCode,
      String bankBranchName,
      String bankBranchId,
      String micr});
}

/// @nodoc
class _$BankByIfscCopyWithImpl<$Res, $Val extends BankByIfsc>
    implements $BankByIfscCopyWith<$Res> {
  _$BankByIfscCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ifscCode = null,
    Object? bankBranchName = null,
    Object? bankBranchId = null,
    Object? micr = null,
  }) {
    return _then(_value.copyWith(
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchName: null == bankBranchName
          ? _value.bankBranchName
          : bankBranchName // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchId: null == bankBranchId
          ? _value.bankBranchId
          : bankBranchId // ignore: cast_nullable_to_non_nullable
              as String,
      micr: null == micr
          ? _value.micr
          : micr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankByIfscCopyWith<$Res>
    implements $BankByIfscCopyWith<$Res> {
  factory _$$_BankByIfscCopyWith(
          _$_BankByIfsc value, $Res Function(_$_BankByIfsc) then) =
      __$$_BankByIfscCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ifscCode,
      String bankBranchName,
      String bankBranchId,
      String micr});
}

/// @nodoc
class __$$_BankByIfscCopyWithImpl<$Res>
    extends _$BankByIfscCopyWithImpl<$Res, _$_BankByIfsc>
    implements _$$_BankByIfscCopyWith<$Res> {
  __$$_BankByIfscCopyWithImpl(
      _$_BankByIfsc _value, $Res Function(_$_BankByIfsc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ifscCode = null,
    Object? bankBranchName = null,
    Object? bankBranchId = null,
    Object? micr = null,
  }) {
    return _then(_$_BankByIfsc(
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchName: null == bankBranchName
          ? _value.bankBranchName
          : bankBranchName // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchId: null == bankBranchId
          ? _value.bankBranchId
          : bankBranchId // ignore: cast_nullable_to_non_nullable
              as String,
      micr: null == micr
          ? _value.micr
          : micr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BankByIfsc implements _BankByIfsc {
  const _$_BankByIfsc(
      {required this.ifscCode,
      required this.bankBranchName,
      required this.bankBranchId,
      required this.micr});

  @override
  final String ifscCode;
  @override
  final String bankBranchName;
  @override
  final String bankBranchId;
  @override
  final String micr;

  @override
  String toString() {
    return 'BankByIfsc(ifscCode: $ifscCode, bankBranchName: $bankBranchName, bankBranchId: $bankBranchId, micr: $micr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankByIfsc &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.bankBranchName, bankBranchName) ||
                other.bankBranchName == bankBranchName) &&
            (identical(other.bankBranchId, bankBranchId) ||
                other.bankBranchId == bankBranchId) &&
            (identical(other.micr, micr) || other.micr == micr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ifscCode, bankBranchName, bankBranchId, micr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankByIfscCopyWith<_$_BankByIfsc> get copyWith =>
      __$$_BankByIfscCopyWithImpl<_$_BankByIfsc>(this, _$identity);
}

abstract class _BankByIfsc implements BankByIfsc {
  const factory _BankByIfsc(
      {required final String ifscCode,
      required final String bankBranchName,
      required final String bankBranchId,
      required final String micr}) = _$_BankByIfsc;

  @override
  String get ifscCode;
  @override
  String get bankBranchName;
  @override
  String get bankBranchId;
  @override
  String get micr;
  @override
  @JsonKey(ignore: true)
  _$$_BankByIfscCopyWith<_$_BankByIfsc> get copyWith =>
      throw _privateConstructorUsedError;
}
