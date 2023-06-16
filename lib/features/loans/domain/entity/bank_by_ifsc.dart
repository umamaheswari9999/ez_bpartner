import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_by_ifsc.freezed.dart';

@freezed
class BankByIfsc with _$BankByIfsc {
  const factory BankByIfsc({
    required String ifscCode,
    required String bankBranchName,
    required String bankBranchId,
    required String micr,
  }) = _BankByIfsc;
}
