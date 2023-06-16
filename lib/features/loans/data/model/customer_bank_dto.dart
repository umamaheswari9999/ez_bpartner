import 'package:ez_flutter/features/loans/domain/entity/client_master.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_bank.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_bank_dto.g.dart';

part 'customer_bank_dto.freezed.dart';

@freezed
class CustomerBankDto
    with _$CustomerBankDto, BaseDto<CustomerBankDto, CustomerBank> {
  const CustomerBankDto._();

  const factory CustomerBankDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'bankname\$_identifier') required String bankName,
    @JsonKey(name: 'bankname') required String bankId,
    @JsonKey(name: 'bankbranch') required String branchName,
    @JsonKey(name: 'ifsccode') required String ifscCode,
    @JsonKey(name: 'lDSAccountType') required String accountType,
    @JsonKey(name: 'accountno', defaultValue: '') required String accountNumber,
    @JsonKey(name: 'applicantname', defaultValue: '') required String nameOnBankAccount,
    @JsonKey(name: 'isvalidated', defaultValue: false) required bool isValidated,
    @JsonKey(name: 'micr') int? micrCode,
    @JsonKey(name: 'bankvalidationBy') String? validatedBy,
  }) = _CustomerBankDto;

  factory CustomerBankDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerBankDtoFromJson(json);

  @override
  CustomerBankDto fromJson(Map<String, dynamic> json) =>
      CustomerBankDto.fromJson(json);

  @override
  CustomerBank toDomain() {
    return CustomerBank(
      id: id,
      bankName: bankName,
      bankId: bankId,
      branchName: branchName,
      ifscCode: ifscCode,
      accountType: accountType,
      accountNumber: accountNumber,
      nameOnBankAccount: nameOnBankAccount,
      isValidated: isValidated,
      micrCode: micrCode,
      validatedBy: validatedBy,
    );
  }
}
