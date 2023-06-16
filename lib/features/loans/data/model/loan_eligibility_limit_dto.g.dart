// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_eligibility_limit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoanEligibilityLimitDto _$$_LoanEligibilityLimitDtoFromJson(
        Map<String, dynamic> json) =>
    _$_LoanEligibilityLimitDto(
      cibilLimit: (json['cibil_limit'] as num).toDouble(),
      cibilDecision: json['cibil_decision'] as String,
      bankLimit: (json['bank_imit'] as num).toDouble(),
      bankDecision: json['bank_decision'] as String,
      finalLimit: (json['final_limit'] as num).toDouble(),
      finalDecision: json['final_decision'] as String,
    );

Map<String, dynamic> _$$_LoanEligibilityLimitDtoToJson(
        _$_LoanEligibilityLimitDto instance) =>
    <String, dynamic>{
      'cibil_limit': instance.cibilLimit,
      'cibil_decision': instance.cibilDecision,
      'bank_imit': instance.bankLimit,
      'bank_decision': instance.bankDecision,
      'final_limit': instance.finalLimit,
      'final_decision': instance.finalDecision,
    };
