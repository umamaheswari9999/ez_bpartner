import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_location.freezed.dart';

@freezed
class CustomerLocation with _$CustomerLocation {
  const factory CustomerLocation({
    CustomerAddress? currentAddress,
    CustomerAddress? permanentAddress,
}) = _CustomerLocation;
}