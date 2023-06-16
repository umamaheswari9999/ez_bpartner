import 'package:ez_flutter/features/loans/domain/entity/loan.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/features/loans/domain/entity/recent_loans.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'loans_cubit.freezed.dart';

@injectable
class LoansCubit extends Cubit<LoansState> {
  LoansCubit(this.repo)
      : super(
          LoansState(
            filter: LoanFilters(
              fromDate: DateTime.now().subtract(const Duration(days: 30)),
              toDate: DateTime.now(),
            ),
            isloading: false,
            preapproved: [],
            disbursed: [],
            draft: [],
            rejected: [],
            allLoans: [],
            hasReachedMax: false,
            isSuccess: false,
          ),
        );

  final LoanRepo repo;
  final pageLength = 10;

  void fetchInitial(LoanFilters filters) async {
    emit(state.copyWith(isloading: true));
    final result = await repo.fetchRecentLoans(filters, 0, pageLength);
    result.fold(
      (l) => emit(state.copyWith(failure: l, isloading: false)),
      (r) => emit(
        state.copyWith(
          isSuccess: true,
          disbursed: r.disbursedLoans,
          draft: r.draftLoans,
          preapproved: r.preApprovedLoans,
          rejected: r.rejectedLoans,
          isloading: false,
        ),
      ),
    );
  }

  void fetchInitialAllLoans(LoanFilters filters) async {
    emit(state.copyWith(isloading: true));
    final result = await repo.fetchLoans(filters, 0, pageLength);
    result.fold(
      (l) => emit(state.copyWith(failure: l, isloading: false)),
      (r) => emit(
        state.copyWith(
          isSuccess: true,
          allLoans: r,
          isloading: false,
        ),
      ),
    );
  }

  void setFilters(LoanFilters filters) => emit(state.copyWith(filter: filters));

  void updateFilters({
    String? searchQuery,
    LoanStatus? status,
    DateTime? fromDate,
    DateTime? toDate,
    IdName? bpAddressId,
    IdName? bpId,
  }) {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(
          bpAddressId: bpAddressId ?? state.filter.bpAddressId,
          bpId: bpId ?? state.filter.bpId,
          fromDate: fromDate ?? state.filter.fromDate,
          toDate: toDate ?? state.filter.toDate,
        ),
      ),
    );
  }

  void updateLoans(RecentLoans loans) {
    emit(
      state.copyWith(
        disbursed: loans.disbursedLoans,
        draft: loans.draftLoans,
        isSuccess: true,
        failure: null,
        preapproved: loans.preApprovedLoans,
      ),
    );
  }

  void fetchMore(LoanFilters filters) async {
    if (filters.status == LoanStatus.draft) {
      final start = state.draft.length;
      final end = state.draft.length + pageLength;
      final res = await repo.fetchLoans(filters, start, end);
      res.fold(
        (l) => null,
        (r) => emit(
          state.copyWith(
            draft: [...state.draft, ...r],
            hasReachedMax: r.length < pageLength,
            isSuccess: true,
          ),
        ),
      );
    } else if (filters.status == LoanStatus.preApproved) {
      final start = state.preapproved.length;
      final end = state.preapproved.length + pageLength;
      final res = await repo.fetchLoans(filters, start, end);
      res.fold(
        (l) => null,
        (r) => emit(
          state.copyWith(
            preapproved: [...state.preapproved, ...r],
            hasReachedMax: r.length < pageLength,
            isSuccess: true,
          ),
        ),
      );
    } else if (filters.status == LoanStatus.disbursed) {
      final start = state.disbursed.length;
      final end = state.disbursed.length + pageLength;
      final res = await repo.fetchLoans(filters, start, end);
      res.fold(
        (l) => null,
        (r) => emit(
          state.copyWith(
            disbursed: [...state.disbursed, ...r],
            hasReachedMax: r.length < pageLength,
            isSuccess: true,
          ),
        ),
      );
    } else if (filters.status == LoanStatus.rejected) {
      final start = state.rejected.length;
      final end = state.rejected.length + pageLength;
      final res = await repo.fetchLoans(filters, start, end);
      res.fold(
        (l) => null,
        (r) => emit(
          state.copyWith(
            rejected: [...state.rejected, ...r],
            hasReachedMax: r.length < pageLength,
            isSuccess: true,
          ),
        ),
      );
    } else {
      final start = state.allLoans.length;
      final end = state.allLoans.length + pageLength;
      final res = await repo.fetchLoans(filters, start, end);
      res.fold(
        (l) => null,
        (r) {
          emit(
            state.copyWith(
              allLoans: [...state.allLoans, ...r],
              hasReachedMax: r.length < pageLength,
              isSuccess: true,
            ),
          );
        },
      );
    }
  }
}

@freezed
class LoansState with _$LoansState {
  const factory LoansState({
    required bool isloading,
    required LoanFilters filter,
    required bool isSuccess,
    required List<Loan> preapproved,
    required List<Loan> disbursed,
    required List<Loan> draft,
    required List<Loan> rejected,
    required List<Loan> allLoans,
    required bool hasReachedMax,
    Failure? failure,
  }) = _LoansState;
}
