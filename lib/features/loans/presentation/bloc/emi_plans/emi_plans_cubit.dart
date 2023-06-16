import 'package:ez_flutter/features/loans/domain/entity/emi_plan.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'emi_plans_cubit.freezed.dart';

part 'emi_plans_state.dart';

@injectable
class EmiPlansCubit extends Cubit<EmiPlansState> {
  EmiPlansCubit(this.repo) : super(const EmiPlansState.initial());

  final LoanRepo repo;
  final pageLength = 20;

  void fetchInitial(String bpartnerid,String amount) async {
    emit(const EmiPlansState.loading());
    final result = await repo.fetchEmiPlans(bpartnerid,double.parse(amount).toInt());
    result.fold(
      (l) => emit(EmiPlansState.failure(l)),
      (r) => emit(
        EmiPlansState.success(
          records: r,
          emiAmout: amount
        ),
      ),
    );
  }
}
