import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_mandate.freezed.dart';

@freezed
class CustomerMandate with _$CustomerMandate {
  const factory CustomerMandate({
    required String id,
    required String umrn,
    required String url,
    required String sponserBank,
    required String registeredOn,
    required double amountRegistered,
    required bool isApplicable,
    required String mandateId,
    required String mandateType,
    required String mandateStage,
    required String mandateStatus,
    required bool isCanceled,
  }) = _CustomerMandate;
}