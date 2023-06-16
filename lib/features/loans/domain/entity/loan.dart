import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan.freezed.dart';

@freezed
class Loan with _$Loan {
  const factory Loan({
    required String id,
    required String loanNo,
    required String customerName,
    String? mobileNumber,
    String? proofTypeNumber,
    required double loanAmount,
    required bool isPreApproved,
    required bool isDisbursed,
    required bool isRejected,
    required String createdAt,
    String? rejectReason,
    String? appLoanStatus,
  }) = _Loan;
}

extension LoanExt on Loan {
  bool get isInDraft => isPreApproved == false;
  bool get isEditable => isRejected == false && isPreApproved == false;

  LoanStatus getLoanStatus() {
    if (isDisbursed) {
      return LoanStatus.disbursed;
    } else if (isPreApproved) {
      return LoanStatus.preApproved;
    } else if (isPreApproved == false && isRejected) {
      return LoanStatus.rejected;
    } else {
      return LoanStatus.draft;
    }
  }
}