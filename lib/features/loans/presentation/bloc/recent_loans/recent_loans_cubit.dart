import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/features/loans/domain/entity/recent_loans.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'recent_loans_cubit.freezed.dart';

part 'recent_loans_state.dart';

@injectable
class RecentLoansCubit extends Cubit<RecentLoansState> {
  RecentLoansCubit(this.repo) : super(const RecentLoansState.initial());

  final LoanRepo repo;

  void fetchRecentLoans(LoanFilters filters) async {
    emit(const RecentLoansState.loading());

    try {
      final result = await repo.fetchRecentLoans(filters,0,10);
      result.fold(
        (l) => emit(RecentLoansState.failure(l)),
        (r) => emit(RecentLoansState.success(records: r, hasReachedMax: false)),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not load recent loans');
      emit(RecentLoansState.failure(Failure.unknownFailure()));
    }
  }
}
