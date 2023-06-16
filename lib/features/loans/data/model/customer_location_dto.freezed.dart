// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerLocationDto _$CustomerLocationDtoFromJson(Map<String, dynamic> json) {
  return _CustomerLocationDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerLocationDto {
  @JsonKey(name: 'currentAddress')
  CustomerAddressDto? get currentAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'permanentAddress')
  CustomerAddressDto? get permanentAddress =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerLocationDtoCopyWith<CustomerLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLocationDtoCopyWith<$Res> {
  factory $CustomerLocationDtoCopyWith(
          CustomerLocationDto value, $Res Function(CustomerLocationDto) then) =
      _$CustomerLocationDtoCopyWithImpl<$Res, CustomerLocationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'currentAddress') CustomerAddressDto? currentAddress,
      @JsonKey(name: 'permanentAddress') CustomerAddressDto? permanentAddress});

  $CustomerAddressDtoCopyWith<$Res>? get currentAddress;
  $CustomerAddressDtoCopyWith<$Res>? get permanentAddress;
}

/// @nodoc
class _$CustomerLocationDtoCopyWithImpl<$Res, $Val extends CustomerLocationDto>
    implements $CustomerLocationDtoCopyWith<$Res> {
  _$CustomerLocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentAddress = freezed,
    Object? permanentAddress = freezed,
  }) {
    return _then(_value.copyWith(
      currentAddress: freezed == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as CustomerAddressDto?,
      permanentAddress: freezed == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as CustomerAddressDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerAddressDtoCopyWith<$Res>? get currentAddress {
    if (_value.currentAddress == null) {
      return null;
    }

    return $CustomerAddressDtoCopyWith<$Res>(_value.currentAddress!, (value) {
      return _then(_value.copyWith(currentAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerAddressDtoCopyWith<$Res>? get permanentAddress {
    if (_value.permanentAddress == null) {
      return null;
    }

    return $CustomerAddressDtoCopyWith<$Res>(_value.permanentAddress!, (value) {
      return _then(_value.copyWith(permanentAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerLocationDtoCopyWith<$Res>
    implements $CustomerLocationDtoCopyWith<$Res> {
  factory _$$_CustomerLocationDtoCopyWith(_$_CustomerLocationDto value,
          $Res Function(_$_CustomerLocationDto) then) =
      __$$_CustomerLocationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'currentAddress') CustomerAddressDto? currentAddress,
      @JsonKey(name: 'permanentAddress') CustomerAddressDto? permanentAddress});

  @override
  $CustomerAddressDtoCopyWith<$Res>? get currentAddress;
  @override
  $CustomerAddressDtoCopyWith<$Res>? get permanentAddress;
}

/// @nodoc
class __$$_CustomerLocationDtoCopyWithImpl<$Res>
    extends _$CustomerLocationDtoCopyWithImpl<$Res, _$_CustomerLocationDto>
    implements _$$_CustomerLocationDtoCopyWith<$Res> {
  __$$_CustomerLocationDtoCopyWithImpl(_$_CustomerLocationDto _value,
      $Res Function(_$_CustomerLocationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentAddress = freezed,
    Object? permanentAddress = freezed,
  }) {
    return _then(_$_CustomerLocationDto(
      currentAddress: freezed == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as CustomerAddressDto?,
      permanentAddress: freezed == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as CustomerAddressDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerLocationDto extends _CustomerLocationDto {
  const _$_CustomerLocationDto(
      {@JsonKey(name: 'currentAddress') this.currentAddress,
      @JsonKey(name: 'permanentAddress') this.permanentAddress})
      : super._();

  factory _$_CustomerLocationDto.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerLocationDtoFromJson(json);

  @override
  @JsonKey(name: 'currentAddress')
  final CustomerAddressDto? currentAddress;
  @override
  @JsonKey(name: 'permanentAddress')
  final CustomerAddressDto? permanentAddress;

  @override
  String toString() {
    return 'CustomerLocationDto(currentAddress: $currentAddress, permanentAddress: $permanentAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerLocationDto &&
            (identical(other.currentAddress, currentAddress) ||
                other.currentAddress == currentAddress) &&
            (identical(other.permanentAddress, permanentAddress) ||
                other.permanentAddress == permanentAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentAddress, permanentAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerLocationDtoCopyWith<_$_CustomerLocationDto> get copyWith =>
      __$$_CustomerLocationDtoCopyWithImpl<_$_CustomerLocationDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerLocationDtoToJson(
      this,
    );
  }
}

abstract class _CustomerLocationDto extends CustomerLocationDto {
  const factory _CustomerLocationDto(
      {@JsonKey(name: 'currentAddress')
          final CustomerAddressDto? currentAddress,
      @JsonKey(name: 'permanentAddress')
          final CustomerAddressDto? permanentAddress}) = _$_CustomerLocationDto;
  const _CustomerLocationDto._() : super._();

  factory _CustomerLocationDto.fromJson(Map<String, dynamic> json) =
      _$_CustomerLocationDto.fromJson;

  @override
  @JsonKey(name: 'currentAddress')
  CustomerAddressDto? get currentAddress;
  @override
  @JsonKey(name: 'permanentAddress')
  CustomerAddressDto? get permanentAddress;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerLocationDtoCopyWith<_$_CustomerLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
