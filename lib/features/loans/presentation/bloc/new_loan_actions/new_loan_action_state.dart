part of 'new_loan_action_cubit.dart';

@freezed
class NewLoanActionState with _$NewLoanActionState {
  const factory NewLoanActionState.initial() = _NewLoanActionInitial;

  const factory NewLoanActionState.loading(NewLoanAction action) = _NewLoanActionLoading;

  const factory NewLoanActionState.success(NewLoanAction action, {
    Map<String, dynamic>? data,
}) = _NewLoanActionSuccess;

  const factory NewLoanActionState.failure(NewLoanAction action, Failure failure) =
  _NewLoanActionFailure;
}

