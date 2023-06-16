import 'package:ez_flutter/features/loans/domain/entity/emi_plan.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emi_plan_dto.g.dart';

part 'emi_plan_dto.freezed.dart';

@freezed
class EmiPlanDto with _$EmiPlanDto, BaseDto<EmiPlanDto, EmiPlan> {
  const EmiPlanDto._();

  const factory EmiPlanDto({
    required String id,
    @JsonKey(name: 'plan_name') required String name,
    @JsonKey(name: 'toalemis') required int totalemis,
    required String interestrate,
    required int advemi,
    @JsonKey(name: 'downPaymentAmount') required String downPayment,
    required String emiAmount,
  }) = _EmiPlanDto;

  factory EmiPlanDto.fromJson(Map<String, dynamic> json) =>
      _$EmiPlanDtoFromJson(json);

  @override
  EmiPlanDto fromJson(Map<String, dynamic> json) => EmiPlanDto.fromJson(json);

  @override
  EmiPlan toDomain() {
    return EmiPlan(
      id: id,
      emiAmount: emiAmount,
      name: name,
      advemi: advemi,
      interestrate: interestrate,
      totalemis: totalemis,
      downPayment: downPayment,
    );
  }
}