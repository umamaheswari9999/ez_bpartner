// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aadhaar_kyc_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AadhaarKycResponse {
  String get clientId => throw _privateConstructorUsedError;
  bool get otpSent => throw _privateConstructorUsedError;
  bool get ifNumber => throw _privateConstructorUsedError;
  bool get validAadhaar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AadhaarKycResponseCopyWith<AadhaarKycResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AadhaarKycResponseCopyWith<$Res> {
  factory $AadhaarKycResponseCopyWith(
          AadhaarKycResponse value, $Res Function(AadhaarKycResponse) then) =
      _$AadhaarKycResponseCopyWithImpl<$Res, AadhaarKycResponse>;
  @useResult
  $Res call({String clientId, bool otpSent, bool ifNumber, bool validAadhaar});
}

/// @nodoc
class _$AadhaarKycResponseCopyWithImpl<$Res, $Val extends AadhaarKycResponse>
    implements $AadhaarKycResponseCopyWith<$Res> {
  _$AadhaarKycResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? otpSent = null,
    Object? ifNumber = null,
    Object? validAadhaar = null,
  }) {
    return _then(_value.copyWith(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      otpSent: null == otpSent
          ? _value.otpSent
          : otpSent // ignore: cast_nullable_to_non_nullable
              as bool,
      ifNumber: null == ifNumber
          ? _value.ifNumber
          : ifNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      validAadhaar: null == validAadhaar
          ? _value.validAadhaar
          : validAadhaar // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AadhaarKycResponseCopyWith<$Res>
    implements $AadhaarKycResponseCopyWith<$Res> {
  factory _$$_AadhaarKycResponseCopyWith(_$_AadhaarKycResponse value,
          $Res Function(_$_AadhaarKycResponse) then) =
      __$$_AadhaarKycResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String clientId, bool otpSent, bool ifNumber, bool validAadhaar});
}

/// @nodoc
class __$$_AadhaarKycResponseCopyWithImpl<$Res>
    extends _$AadhaarKycResponseCopyWithImpl<$Res, _$_AadhaarKycResponse>
    implements _$$_AadhaarKycResponseCopyWith<$Res> {
  __$$_AadhaarKycResponseCopyWithImpl(
      _$_AadhaarKycResponse _value, $Res Function(_$_AadhaarKycResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? otpSent = null,
    Object? ifNumber = null,
    Object? validAadhaar = null,
  }) {
    return _then(_$_AadhaarKycResponse(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      otpSent: null == otpSent
          ? _value.otpSent
          : otpSent // ignore: cast_nullable_to_non_nullable
              as bool,
      ifNumber: null == ifNumber
          ? _value.ifNumber
          : ifNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      validAadhaar: null == validAadhaar
          ? _value.validAadhaar
          : validAadhaar // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AadhaarKycResponse implements _AadhaarKycResponse {
  const _$_AadhaarKycResponse(
      {required this.clientId,
      required this.otpSent,
      required this.ifNumber,
      required this.validAadhaar});

  @override
  final String clientId;
  @override
  final bool otpSent;
  @override
  final bool ifNumber;
  @override
  final bool validAadhaar;

  @override
  String toString() {
    return 'AadhaarKycResponse(clientId: $clientId, otpSent: $otpSent, ifNumber: $ifNumber, validAadhaar: $validAadhaar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AadhaarKycResponse &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.otpSent, otpSent) || other.otpSent == otpSent) &&
            (identical(other.ifNumber, ifNumber) ||
                other.ifNumber == ifNumber) &&
            (identical(other.validAadhaar, validAadhaar) ||
                other.validAadhaar == validAadhaar));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, clientId, otpSent, ifNumber, validAadhaar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AadhaarKycResponseCopyWith<_$_AadhaarKycResponse> get copyWith =>
      __$$_AadhaarKycResponseCopyWithImpl<_$_AadhaarKycResponse>(
          this, _$identity);
}

abstract class _AadhaarKycResponse implements AadhaarKycResponse {
  const factory _AadhaarKycResponse(
      {required final String clientId,
      required final bool otpSent,
      required final bool ifNumber,
      required final bool validAadhaar}) = _$_AadhaarKycResponse;

  @override
  String get clientId;
  @override
  bool get otpSent;
  @override
  bool get ifNumber;
  @override
  bool get validAadhaar;
  @override
  @JsonKey(ignore: true)
  _$$_AadhaarKycResponseCopyWith<_$_AadhaarKycResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
