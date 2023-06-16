import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_eligibility_limit.freezed.dart';

@freezed
class LoanEligibilityLimit with _$LoanEligibilityLimit {
  const factory LoanEligibilityLimit({
    required double cibilLimit,
    required String cibilDecision,
    required double bankLimit,
    required String bankDecision,
    required double finalLimit,
    required String finalDecision,
  }) = _LoanEligibilityLimit;
}