import 'package:ez_flutter/features/loans/domain/entity/loan_eligibility_limit.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_eligibility_limit_dto.g.dart';

part 'loan_eligibility_limit_dto.freezed.dart';

@freezed
class LoanEligibilityLimitDto
    with
        _$LoanEligibilityLimitDto,
        BaseDto<LoanEligibilityLimitDto, LoanEligibilityLimit> {
  const LoanEligibilityLimitDto._();

  const factory LoanEligibilityLimitDto({
    @JsonKey(name: 'cibil_limit') required double cibilLimit,
    @JsonKey(name: 'cibil_decision') required String cibilDecision,
    @JsonKey(name: 'bank_imit') required double bankLimit,
    @JsonKey(name: 'bank_decision') required String bankDecision,
    @JsonKey(name: 'final_limit') required double finalLimit,
    @JsonKey(name: 'final_decision') required String finalDecision,
  }) = _LoanEligibilityLimitDto;

  factory LoanEligibilityLimitDto.fromJson(Map<String, dynamic> json) =>
      _$LoanEligibilityLimitDtoFromJson(json);

  @override
  LoanEligibilityLimitDto fromJson(Map<String, dynamic> json) =>
      LoanEligibilityLimitDto.fromJson(json);

  @override
  LoanEligibilityLimit toDomain() {
    return LoanEligibilityLimit(
      cibilLimit: cibilLimit,
      cibilDecision: cibilDecision,
      bankLimit: bankLimit,
      bankDecision: bankDecision,
      finalLimit: finalLimit,
      finalDecision: finalDecision,
    );
  }
}
