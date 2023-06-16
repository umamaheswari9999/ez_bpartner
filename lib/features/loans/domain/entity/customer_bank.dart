import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_bank.freezed.dart';

@freezed
class CustomerBank with _$CustomerBank {
  const factory CustomerBank({
    required String id,
    required String bankName,
    required String bankId,
    required String branchName,
    required String ifscCode,
    required String accountType,
    required String accountNumber,
    required String nameOnBankAccount,
    int? micrCode,
    required bool isValidated,
    String? validatedBy,
  }) = _CustomerBank;
}