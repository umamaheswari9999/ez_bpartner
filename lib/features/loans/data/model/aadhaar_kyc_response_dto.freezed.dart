// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aadhaar_kyc_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AadhaarKycResponseDto _$AadhaarKycResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _AadhaarKycResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AadhaarKycResponseDto {
  @JsonKey(name: 'client_id')
  String get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'otp_sent', defaultValue: false)
  bool get otpSent => throw _privateConstructorUsedError;
  @JsonKey(name: 'if_number', defaultValue: false)
  bool get ifNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_aadhaar', defaultValue: false)
  bool get validAadhaar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AadhaarKycResponseDtoCopyWith<AadhaarKycResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AadhaarKycResponseDtoCopyWith<$Res> {
  factory $AadhaarKycResponseDtoCopyWith(AadhaarKycResponseDto value,
          $Res Function(AadhaarKycResponseDto) then) =
      _$AadhaarKycResponseDtoCopyWithImpl<$Res, AadhaarKycResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') String clientId,
      @JsonKey(name: 'otp_sent', defaultValue: false) bool otpSent,
      @JsonKey(name: 'if_number', defaultValue: false) bool ifNumber,
      @JsonKey(name: 'valid_aadhaar', defaultValue: false) bool validAadhaar});
}

/// @nodoc
class _$AadhaarKycResponseDtoCopyWithImpl<$Res,
        $Val extends AadhaarKycResponseDto>
    implements $AadhaarKycResponseDtoCopyWith<$Res> {
  _$AadhaarKycResponseDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_AadhaarKycResponseDtoCopyWith<$Res>
    implements $AadhaarKycResponseDtoCopyWith<$Res> {
  factory _$$_AadhaarKycResponseDtoCopyWith(_$_AadhaarKycResponseDto value,
          $Res Function(_$_AadhaarKycResponseDto) then) =
      __$$_AadhaarKycResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') String clientId,
      @JsonKey(name: 'otp_sent', defaultValue: false) bool otpSent,
      @JsonKey(name: 'if_number', defaultValue: false) bool ifNumber,
      @JsonKey(name: 'valid_aadhaar', defaultValue: false) bool validAadhaar});
}

/// @nodoc
class __$$_AadhaarKycResponseDtoCopyWithImpl<$Res>
    extends _$AadhaarKycResponseDtoCopyWithImpl<$Res, _$_AadhaarKycResponseDto>
    implements _$$_AadhaarKycResponseDtoCopyWith<$Res> {
  __$$_AadhaarKycResponseDtoCopyWithImpl(_$_AadhaarKycResponseDto _value,
      $Res Function(_$_AadhaarKycResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? otpSent = null,
    Object? ifNumber = null,
    Object? validAadhaar = null,
  }) {
    return _then(_$_AadhaarKycResponseDto(
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
@JsonSerializable()
class _$_AadhaarKycResponseDto extends _AadhaarKycResponseDto {
  const _$_AadhaarKycResponseDto(
      {@JsonKey(name: 'client_id')
          required this.clientId,
      @JsonKey(name: 'otp_sent', defaultValue: false)
          required this.otpSent,
      @JsonKey(name: 'if_number', defaultValue: false)
          required this.ifNumber,
      @JsonKey(name: 'valid_aadhaar', defaultValue: false)
          required this.validAadhaar})
      : super._();

  factory _$_AadhaarKycResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_AadhaarKycResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'client_id')
  final String clientId;
  @override
  @JsonKey(name: 'otp_sent', defaultValue: false)
  final bool otpSent;
  @override
  @JsonKey(name: 'if_number', defaultValue: false)
  final bool ifNumber;
  @override
  @JsonKey(name: 'valid_aadhaar', defaultValue: false)
  final bool validAadhaar;

  @override
  String toString() {
    return 'AadhaarKycResponseDto(clientId: $clientId, otpSent: $otpSent, ifNumber: $ifNumber, validAadhaar: $validAadhaar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AadhaarKycResponseDto &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.otpSent, otpSent) || other.otpSent == otpSent) &&
            (identical(other.ifNumber, ifNumber) ||
                other.ifNumber == ifNumber) &&
            (identical(other.validAadhaar, validAadhaar) ||
                other.validAadhaar == validAadhaar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientId, otpSent, ifNumber, validAadhaar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AadhaarKycResponseDtoCopyWith<_$_AadhaarKycResponseDto> get copyWith =>
      __$$_AadhaarKycResponseDtoCopyWithImpl<_$_AadhaarKycResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AadhaarKycResponseDtoToJson(
      this,
    );
  }
}

abstract class _AadhaarKycResponseDto extends AadhaarKycResponseDto {
  const factory _AadhaarKycResponseDto(
      {@JsonKey(name: 'client_id')
          required final String clientId,
      @JsonKey(name: 'otp_sent', defaultValue: false)
          required final bool otpSent,
      @JsonKey(name: 'if_number', defaultValue: false)
          required final bool ifNumber,
      @JsonKey(name: 'valid_aadhaar', defaultValue: false)
          required final bool validAadhaar}) = _$_AadhaarKycResponseDto;
  const _AadhaarKycResponseDto._() : super._();

  factory _AadhaarKycResponseDto.fromJson(Map<String, dynamic> json) =
      _$_AadhaarKycResponseDto.fromJson;

  @override
  @JsonKey(name: 'client_id')
  String get clientId;
  @override
  @JsonKey(name: 'otp_sent', defaultValue: false)
  bool get otpSent;
  @override
  @JsonKey(name: 'if_number', defaultValue: false)
  bool get ifNumber;
  @override
  @JsonKey(name: 'valid_aadhaar', defaultValue: false)
  bool get validAadhaar;
  @override
  @JsonKey(ignore: true)
  _$$_AadhaarKycResponseDtoCopyWith<_$_AadhaarKycResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
