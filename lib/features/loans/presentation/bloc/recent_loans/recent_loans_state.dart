part of 'recent_loans_cubit.dart';

@freezed
class RecentLoansState with _$RecentLoansState {
  const factory RecentLoansState.initial() = _RecentLoansInitial;

  const factory RecentLoansState.loading() = _RecentLoansLoading;

  const factory RecentLoansState.success({
    required RecentLoans records,
    required bool hasReachedMax,
  }) = _RecentLoansSuccess;

  const factory RecentLoansState.failure(Failure failure) =
  _RecentLoansFailure;
}
