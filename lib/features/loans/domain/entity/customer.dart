import 'package:ez_flutter/features/loans/domain/entity/client_master.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_bank.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_location.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_mandate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required ClientMaster master,
    required List<CustomerLocation> locations,
    required List<CustomerBank> banks,
    required List<CustomerMandate> mandates,
  }) = _Customer;
}