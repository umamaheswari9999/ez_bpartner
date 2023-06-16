import 'package:ez_flutter/features/loans/domain/entity/client_master.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_bank.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_mandate.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_mandate_dto.g.dart';

part 'customer_mandate_dto.freezed.dart';

@freezed
class CustomerMandateDto
    with _$CustomerMandateDto, BaseDto<CustomerMandateDto, CustomerMandate> {
  const CustomerMandateDto._();

  const factory CustomerMandateDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'lDSUmrn', defaultValue: '') required String umrn,
    @JsonKey(name: 'mandateid', defaultValue: '') required String mandateId,
    @JsonKey(name: 'mandatetype', defaultValue: '') required String mandateType,
    @JsonKey(name: 'lDSEnachStage', defaultValue: '') required String mandateStage,
    @JsonKey(name: 'lDSEnachStatus', defaultValue: '') required String mandateStatus,
    @JsonKey(name: 'lDSUrl', defaultValue: '') required String url,
    @JsonKey(name: 'lDSEnachSponserbank', defaultValue: '') required String sponserBank,
    @JsonKey(name: 'mandateregisteredon', defaultValue: '') required String registeredOn,
    @JsonKey(name: 'lDSEcsAmountReg', defaultValue: 0.0) required double amountRegistered,
    @JsonKey(name: 'lDSEcsApplicable', defaultValue: false) required bool isApplicable,
    @JsonKey(name: 'ismandatecancel', defaultValue: false) required bool isCanceled,
  }) = _CustomerMandateDto;

  factory CustomerMandateDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerMandateDtoFromJson(json);

  @override
  CustomerMandateDto fromJson(Map<String, dynamic> json) =>
      CustomerMandateDto.fromJson(json);

  @override
  CustomerMandate toDomain() {
    return CustomerMandate(
      id: id,
      umrn: umrn,
      mandateId: mandateId,
      mandateType: mandateType,
      mandateStage: mandateStage,
      mandateStatus: mandateStatus,
      url: url,
      isApplicable: isApplicable,
      amountRegistered: amountRegistered,
      registeredOn: registeredOn,
      sponserBank: sponserBank,
      isCanceled: isCanceled,
    );
  }
}
