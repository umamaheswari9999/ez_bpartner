import 'package:freezed_annotation/freezed_annotation.dart';

part 'emi_plan.freezed.dart';
part 'emi_plan.g.dart';

@freezed
class EmiPlan with _$EmiPlan {
  const EmiPlan._();
  factory EmiPlan({
    required String id,
    required String name,
    required int totalemis,
    required String interestrate,
    required int advemi,
    required String downPayment,
    required String emiAmount,
  }) = _EmiPlan;

  factory EmiPlan.fromJson(Map<String, dynamic> json) =>
      _$EmiPlanFromJson(json);
}
