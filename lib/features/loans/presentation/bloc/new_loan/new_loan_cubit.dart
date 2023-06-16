import 'package:ez_flutter/features/loans/domain/entity/customer.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_bank.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'new_loan_cubit.freezed.dart';

part 'new_loan_state.dart';

@injectable
class NewLoanCubit extends Cubit<NewLoanState> {
  NewLoanCubit(this.repo)
      : super(
          const NewLoanState(
              currentStep: 0, isLoading: false, success: false, ishold: false),
        );

  final LoanRepo repo;

  void setLoanDetails(PreEnquiryForm form) => emit(state.copyWith(form: form));

  void setEnquiryForm(PreEnquiryForm form) =>
      emit(state.copyWith(enquiryForm: form));

  void updateForm(PreEnquiryForm form) => emit(state.copyWith(form: form));

  void setCustomer(Customer? customer) async {
    bool ishold = false;
    if (customer != null) {
      String? perPostalCode;
      String? resPostalCode;
      if (customer.locations.isNotEmpty) {
        perPostalCode = customer.locations.first.permanentAddress?.postalCode;
        resPostalCode = customer.locations.first.currentAddress?.postalCode;
      }
      final pincode = perPostalCode ?? resPostalCode;
      if (pincode != null) {
        final pinres = await repo.checkIfPincodeIsOnHold(pincode);
        ishold = pinres.fold(
          (l) => false, 
          (r) => r,
        );
      }
    }
    emit(state.copyWith(customer: customer, ishold: ishold));
  }

  Future<void> withCustomState(NewLoanState state) async {
    emit(state.copyWith(isLoading: true));
    bool ishold = false;
    try {
      if (state.customer != null) {
        String? perPostalCode;
        String? resPostalCode;
        if (state.customer!.locations.isNotEmpty) {
          perPostalCode =
              state.customer!.locations.first.permanentAddress?.postalCode;
        } else if (state.customer!.locations.isNotEmpty) {
          resPostalCode =
              state.customer!.locations.first.currentAddress?.postalCode;
        }
        final pincode = perPostalCode ?? resPostalCode;
        if (pincode != null) {
          final pinres = await repo.checkIfPincodeIsOnHold(pincode);
          ishold = pinres.fold((l) => false, (r) => r);
        }
      }
    } catch (e, st) {
      logError(e, st);
    }
    emit(state.copyWith(ishold: ishold, isLoading: false));
  }

  void refreshFormAndCustomer(
    String loanNumber,
    String panNumber, {
    bool shouldMoveToNextStep = false,
  }) async {

    final result = await repo.fetchLoanAndClientMasterDetails(loanNumber, panNumber);
    result.fold(
      (l) {},
      (r) {
        updateForms(
          form: r.value1.value1,
          enquiryForm: r.value1.value2,
          customer: r.value2,
        );

        if (shouldMoveToNextStep) {
          moveToNextStep();
        }
      },
    );
  }

  void addNewBank(CustomerBank bank) {
    final banks = [...state.customer!.banks];
    banks.add(bank);

    emit(state.copyWith(customer: state.customer!.copyWith(banks: banks)));
  }

  void onStepChanged(int newStep) => emit(state.copyWith(currentStep: newStep));

  void updateForms({
    PreEnquiryForm? form,
    PreEnquiryForm? enquiryForm,
    Customer? customer,
  }) async {
    emit(state.copyWith(isLoading: true));
    bool ishold = false;
    if (customer != null) {
      String? perPostalCode;
      String? resPostalCode;
      if (customer.locations.isNotEmpty) {
        perPostalCode = customer.locations.first.permanentAddress?.postalCode;
        resPostalCode = customer.locations.first.currentAddress?.postalCode;
      }
      final pincode = perPostalCode ?? resPostalCode;
      if (pincode != null) {
        final pinres = await repo.checkIfPincodeIsOnHold(pincode);
        ishold = pinres.fold((l) => false, (r) => r);
      }
    }
    final apploanStatus = (form ?? state.form)!.appLoanStatus;
    emit(
      state.copyWith(
        currentStep: stepToIndex(apploanStatus),
        form: form ?? state.form,
        enquiryForm: enquiryForm ?? state.enquiryForm,
        customer: customer ?? state.customer,
        ishold: ishold,
        isLoading: false,
      ),
    );
  }

  void moveToNextStep({
    PreEnquiryForm? form,
    Customer? customer,
    PreEnquiryForm? enquiryForm,
  }) async {
    bool ishold = false;
    if (customer != null) {
      String? perPostalCode;
      String? resPostalCode;
      if (customer.locations.isNotEmpty) {
        perPostalCode = customer.locations.first.permanentAddress?.postalCode;
        resPostalCode = customer.locations.first.currentAddress?.postalCode;
      }
      final pincode = perPostalCode ?? resPostalCode;
      if (pincode != null) {
        final pinres = await repo.checkIfPincodeIsOnHold(pincode);
        ishold = pinres.fold((l) => false, (r) => r);
      }
    }
    emit(
      state.copyWith(
        currentStep: state.currentStep + 1,
        customer: customer ?? state.customer,
        form: form ?? state.form,
        ishold: ishold,
        enquiryForm: enquiryForm ?? state.enquiryForm,
      ),
    );
  }

  int stepToIndex(String? loanStatus) {
    const kycStep = 0;
    const reviewKycStep = 1;
    const additionalDetailsStep = 2;
    const loanRequirementsStep = 3;
    const bankDetailsStep = 4;
    const eSignAndeMandateStep = 5;
    const preApprovalStep = 6;
    int step = 0;
    if (loanStatus == LoanStage.draft) {
      step = kycStep;
    } else if (loanStatus == LoanStage.draft) {
      step = reviewKycStep;
    } else if (loanStatus == LoanStage.waitingForKyc) {
      step = kycStep;
    } else if (loanStatus == LoanStage.reviewKyc) {
      step = reviewKycStep;
    } else if (loanStatus == LoanStage.additionalInfo) {
      step = additionalDetailsStep;
    } else if (loanStatus == LoanStage.bankDetails) {
      step = bankDetailsStep;
    } else if (loanStatus == LoanStage.loanRequirements) {
      step = loanRequirementsStep;
    } else if (['IES', 'WES', 'RES', 'IEM', 'WEM', 'REM']
        .contains(loanStatus)) {
      step = eSignAndeMandateStep;
    } else if (loanStatus == LoanStage.waitingForPreApproval ||
        loanStatus == LoanStage.preApproved ||
        loanStatus == LoanStage.waitingForCallVerification ||
        loanStatus == LoanStage.waitingForDisbursement) {
      step = preApprovalStep;
    }
    return step;
  }
}
