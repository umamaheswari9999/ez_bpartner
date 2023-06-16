// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerAddress {
  String get id => throw _privateConstructorUsedError;
  String get addressLine1 => throw _privateConstructorUsedError;
  String get addressLine2 => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get cityName => throw _privateConstructorUsedError;
  String get countryName => throw _privateConstructorUsedError;
  String get stateName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerAddressCopyWith<CustomerAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAddressCopyWith<$Res> {
  factory $CustomerAddressCopyWith(
          CustomerAddress value, $Res Function(CustomerAddress) then) =
      _$CustomerAddressCopyWithImpl<$Res, CustomerAddress>;
  @useResult
  $Res call(
      {String id,
      String addressLine1,
      String addressLine2,
      String postalCode,
      String cityName,
      String countryName,
      String stateName});
}

/// @nodoc
class _$CustomerAddressCopyWithImpl<$Res, $Val extends CustomerAddress>
    implements $CustomerAddressCopyWith<$Res> {
  _$CustomerAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addressLine1 = null,
    Object? addressLine2 = null,
    Object? postalCode = null,
    Object? cityName = null,
    Object? countryName = null,
    Object? stateName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine1: null == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine2: null == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerAddressCopyWith<$Res>
    implements $CustomerAddressCopyWith<$Res> {
  factory _$$_CustomerAddressCopyWith(
          _$_CustomerAddress value, $Res Function(_$_CustomerAddress) then) =
      __$$_CustomerAddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String addressLine1,
      String addressLine2,
      String postalCode,
      String cityName,
      String countryName,
      String stateName});
}

/// @nodoc
class __$$_CustomerAddressCopyWithImpl<$Res>
    extends _$CustomerAddressCopyWithImpl<$Res, _$_CustomerAddress>
    implements _$$_CustomerAddressCopyWith<$Res> {
  __$$_CustomerAddressCopyWithImpl(
      _$_CustomerAddress _value, $Res Function(_$_CustomerAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addressLine1 = null,
    Object? addressLine2 = null,
    Object? postalCode = null,
    Object? cityName = null,
    Object? countryName = null,
    Object? stateName = null,
  }) {
    return _then(_$_CustomerAddress(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine1: null == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine2: null == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CustomerAddress implements _CustomerAddress {
  const _$_CustomerAddress(
      {required this.id,
      required this.addressLine1,
      required this.addressLine2,
      required this.postalCode,
      required this.cityName,
      required this.countryName,
      required this.stateName});

  @override
  final String id;
  @override
  final String addressLine1;
  @override
  final String addressLine2;
  @override
  final String postalCode;
  @override
  final String cityName;
  @override
  final String countryName;
  @override
  final String stateName;

  @override
  String toString() {
    return 'CustomerAddress(id: $id, addressLine1: $addressLine1, addressLine2: $addressLine2, postalCode: $postalCode, cityName: $cityName, countryName: $countryName, stateName: $stateName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerAddress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, addressLine1, addressLine2,
      postalCode, cityName, countryName, stateName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerAddressCopyWith<_$_CustomerAddress> get copyWith =>
      __$$_CustomerAddressCopyWithImpl<_$_CustomerAddress>(this, _$identity);
}

abstract class _CustomerAddress implements CustomerAddress {
  const factory _CustomerAddress(
      {required final String id,
      required final String addressLine1,
      required final String addressLine2,
      required final String postalCode,
      required final String cityName,
      required final String countryName,
      required final String stateName}) = _$_CustomerAddress;

  @override
  String get id;
  @override
  String get addressLine1;
  @override
  String get addressLine2;
  @override
  String get postalCode;
  @override
  String get cityName;
  @override
  String get countryName;
  @override
  String get stateName;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerAddressCopyWith<_$_CustomerAddress> get copyWith =>
      throw _privateConstructorUsedError;
}
