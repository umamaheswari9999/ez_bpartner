import 'package:ez_flutter/features/loans/data/model/customer_address_dto.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_location.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_location_dto.g.dart';

part 'customer_location_dto.freezed.dart';

@freezed
class CustomerLocationDto
    with _$CustomerLocationDto, BaseDto<CustomerLocationDto, CustomerLocation> {
  const CustomerLocationDto._();

  const factory CustomerLocationDto({
    @JsonKey(name: 'currentAddress') CustomerAddressDto? currentAddress,
    @JsonKey(name: 'permanentAddress') CustomerAddressDto? permanentAddress,
  }) = _CustomerLocationDto;

  factory CustomerLocationDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerLocationDtoFromJson(json);

  @override
  CustomerLocationDto fromJson(Map<String, dynamic> json) =>
      CustomerLocationDto.fromJson(json);

  @override
  CustomerLocation toDomain() {
    return CustomerLocation(
      currentAddress: currentAddress?.toDomain(),
        permanentAddress: permanentAddress?.toDomain(),
    );
  }
}
