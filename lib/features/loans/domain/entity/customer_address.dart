import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_address.freezed.dart';

@freezed
class CustomerAddress with _$CustomerAddress {
  const factory CustomerAddress({
    required String id,
    required String addressLine1,
    required String addressLine2,
    required String postalCode,
    required String cityName,
    required String countryName,
    required String stateName,
  }) = _CustomerAddress;
}


