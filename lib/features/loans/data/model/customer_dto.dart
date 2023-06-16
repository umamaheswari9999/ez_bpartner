import 'package:ez_flutter/features/loans/data/model/client_master_dto.dart';
import 'package:ez_flutter/features/loans/data/model/customer_address_dto.dart';
import 'package:ez_flutter/features/loans/data/model/customer_bank_dto.dart';
import 'package:ez_flutter/features/loans/data/model/customer_location_dto.dart';
import 'package:ez_flutter/features/loans/data/model/customer_mandate_dto.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_dto.g.dart';

part 'customer_dto.freezed.dart';

@freezed
class CustomerDto with _$CustomerDto, BaseDto<CustomerDto, Customer> {
  const CustomerDto._();

  const factory CustomerDto({
    @JsonKey(name: 'ClientMaster_Header') required ClientMasterDto master,
    @JsonKey(name: 'ClientMaster_Locations') required List<CustomerLocationDto> locations,
    @JsonKey(name: 'ClientMaster_Bank') required List<CustomerBankDto> banks,
    @JsonKey(name: 'ClientMaster_Mandates') required List<CustomerMandateDto> mandates,
  }) = _CustomerDto;

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);

  @override
  CustomerDto fromJson(Map<String, dynamic> json) => CustomerDto.fromJson(json);

  @override
  Customer toDomain() {
    return Customer(
      master: master.toDomain(),
      locations: locations.map((e) => e.toDomain()).toList(),
      banks: banks.map((e) => e.toDomain()).toList(),
      mandates: mandates.map((e) => e.toDomain()).toList(),
    );
  }
}
