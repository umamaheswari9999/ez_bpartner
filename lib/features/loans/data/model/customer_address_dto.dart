import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_address_dto.g.dart';

part 'customer_address_dto.freezed.dart';

@freezed
class CustomerAddressDto
    with _$CustomerAddressDto, BaseDto<CustomerAddressDto, CustomerAddress> {
  const CustomerAddressDto._();

  const factory CustomerAddressDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'addressLine1') required String addressLine1,
    @JsonKey(name: 'addressLine2', defaultValue: '') required String addressLine2,
    @JsonKey(name: 'postalCode', defaultValue: '') required String postalCode,
    @JsonKey(name: 'cityName', defaultValue: '') required String cityName,
    @JsonKey(name: 'country\$_identifier', defaultValue: '') required String countryName,
    @JsonKey(name: 'region\$_identifier', defaultValue: '') required String stateName,
  }) = _CustomerAddressDto;

  factory CustomerAddressDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerAddressDtoFromJson(json);

  @override
  CustomerAddressDto fromJson(Map<String, dynamic> json) =>
      CustomerAddressDto.fromJson(json);

  @override
  CustomerAddress toDomain() {
    return CustomerAddress(
      id: id,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      postalCode: postalCode,
      cityName: cityName,
      countryName: countryName,
      stateName: stateName,
    );
  }
}
