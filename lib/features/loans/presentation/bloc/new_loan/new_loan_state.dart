part of 'new_loan_cubit.dart';

@freezed
class NewLoanState with _$NewLoanState {
  const factory NewLoanState({
    required int currentStep,
    PreEnquiryForm? form,
    Customer? customer,
    PreEnquiryForm? enquiryForm,
    required bool isLoading,
    Failure? error,
    required bool success,
    bool? ishold,
  }) = _NewLoanState;
}