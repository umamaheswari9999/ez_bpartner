part of 'bank_accounts_cubit.dart';

@freezed
class BankAccountsState with _$BankAccountsState {
  const factory BankAccountsState.initial() = _BankAccountsInitial;

  const factory BankAccountsState.loading() = _BankAccountsLoading;

  const factory BankAccountsState.success({
    required List<Simple> records,
    required bool hasReachedMax,
  }) = _BankAccountsSuccess;

  const factory BankAccountsState.failure(Failure failure) =
  _BankAccountsFailure;
}
