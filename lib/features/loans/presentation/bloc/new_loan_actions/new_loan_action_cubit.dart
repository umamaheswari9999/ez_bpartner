import 'package:ez_flutter/features/loans/domain/entity/customer.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_bank.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_mandate.dart';
import 'package:ez_flutter/features/loans/domain/entity/emi_plan.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'new_loan_action_cubit.freezed.dart';

part 'new_loan_action_state.dart';

@injectable
class NewLoanActionCubit extends Cubit<NewLoanActionState> {
  NewLoanActionCubit(this.repo) : super(const NewLoanActionState.initial());

  final LoanRepo repo;

  void checkIfLoanExists(String pan, String? bpid, String? bpaddid) async {
    const action = NewLoanAction.existingLoanCheck;
    try {
      emit(const NewLoanActionState.loading(action));
      if (bpid == null) {
        emit(NewLoanActionState.failure(action,
            Failure.invalidFieldValue('Please select Business Partner.')));
      } else if (bpaddid == null) {
        emit(NewLoanActionState.failure(
            action,
            Failure.invalidFieldValue(
                'Please select Business Partner Branch.')));
      } else {
        final result = await repo.checkIfLoanExists(pan, bpid, bpaddid);
        result.fold(
          (l) => emit(NewLoanActionState.failure(action, l)),
          (r) => emit(NewLoanActionState.success(action, data: {'data': r})),
        );
      }
    } catch (e, st) {
      logError(e, st, '[bloc] could not send kyc link');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void createBasicPreEnquiry(
    String pan,
    String? customerName,
    String? aadhaarNumber,
    String? cnfAadharNumber,
    DateTime? dob,
    String mobile,
    String? gender,
    String? bpartnerId,
    String? bpartnerAddId, {
    String? customerRefNo,
    Customer? customer,
  }) async {
    const action = NewLoanAction.createBasicPreEnquiry;
    try {
      emit(const NewLoanActionState.loading(action));
      aadhaarNumber = aadhaarNumber?.trim().replaceAll(' ', '');
      cnfAadharNumber = cnfAadharNumber?.trim().replaceAll(' ', '');
      if (bpartnerId == null || bpartnerId.isEmpty) {
        _emitErrorState(action, 'Please select Agent');
      } else if (bpartnerAddId == null || bpartnerAddId.isEmpty) {
        _emitErrorState(action, 'Please select Agent Address');
      } else if (pan.isEmpty || pan.length != 10) {
        _emitErrorState(action, 'Please enter valid PAN Number');
      } else if (dob == null) {
        _emitErrorState(action, 'Please select date of birth');
      } else if (customerName == null || customerName.trim().isEmpty) {
        _emitErrorState(action, 'Please enter valid customer name');
      } else if (gender == null || gender.isEmpty) {
        _emitErrorState(action, 'Please select gender');
      } else if (mobile.trim().isEmpty) {
        _emitErrorState(action, 'Please enter valid Mobile Number');
      } else if (aadhaarNumber == null || aadhaarNumber.isEmpty) {
        _emitErrorState(action, 'Please enter valid aadhar number');
      } else if (cnfAadharNumber == null || cnfAadharNumber.isEmpty) {
        _emitErrorState(action, 'Please Confirm Your aadhar number');
      } else if (aadhaarNumber.trim().toLowerCase() !=
          cnfAadharNumber.trim().toLowerCase()) {
        _emitErrorState(
            action, 'Aadhar number that you entered are not matching');
      } else {
        final result = await repo.createBasicPreEnquiry(
          pan,
          customerName,
          cnfAadharNumber,
          dob,
          mobile,
          gender,
          bpartnerId,
          bpartnerAddId,
          customerRefNo: customerRefNo,
          customer: customer,
        );
        result.fold(
          (l) => emit(NewLoanActionState.failure(action, l)),
          (r) => emit(NewLoanActionState.success(action, data: {'loan': r})),
        );
      }
    } catch (e, st) {
      logError(e, st, '[bloc] could not create basic pre enquiry');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void _emitErrorState(NewLoanAction action, String msg) {
    emit(
      NewLoanActionState.failure(
        action,
        Failure.invalidFieldValue(msg),
      ),
    );
  }

  void checkLoanStatusAndSetStep(String loanNumber, String poiNumber) async {
    var action = NewLoanAction.stepDecider;
    try {
      emit(NewLoanActionState.loading(action));

      final result =
          await repo.fetchLoanAndClientMasterDetails(loanNumber, poiNumber);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) {
          emit(NewLoanActionState.success(action, data: {'data': r}));
        },
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not check loan status');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void sendConsentOtp(String preEnquiryId,
      [NewLoanAction action = NewLoanAction.kycConsentOtp]) async {
    try {
      emit(NewLoanActionState.loading(action));

      final result = await repo.sendConsentOtp(preEnquiryId);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'otp': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not send kyc link');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void resentOtp(String mobileNumber) async =>
      sendConsentOtp(mobileNumber, NewLoanAction.resendOtp);

  void verifyOtpAndFetchKycDetails(
      String preEnquiryId, String originalOtp, String enteredOtp) async {
    const action = NewLoanAction.verifyOtpAndDoKyc;
    try {
      emit(const NewLoanActionState.loading(action));

      if (originalOtp.isEmpty) {
        emit(NewLoanActionState.failure(
            action,
            Failure.invalidFieldValue(
                'Could not verify OTP. Original OTP is empty')));
      } else if (enteredOtp.isEmpty ||
          enteredOtp.length < 4 ||
          originalOtp.compareTo(enteredOtp) != 0) {
        emit(NewLoanActionState.failure(
            action, Failure.invalidFieldValue('Please enter valid OTP')));
      } else {
        final result =
            await repo.verifyConsentOtpAndDoKyc(preEnquiryId, enteredOtp);
        result.fold(
          (l) => emit(NewLoanActionState.failure(action, l)),
          (r) => emit(
            NewLoanActionState.success(action, data: {'data': r}),
          ),
        );
      }
    } catch (e, st) {
      logError(e, st, '[bloc] could not verify otp and complete the kyc');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void sendAadharKycOtp(String aadharNumber) async {
    const action = NewLoanAction.sendAadharKycOtp;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.sendAadharKycOtp(aadharNumber);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'data': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not send aadhar kyc otp');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void verifyAadharKycOtp(String aadharNumber, String clientId, String otp,
      [PreEnquiryForm? preEnquiryForm]) async {
    const action = NewLoanAction.verifyAadharKycOtp;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.verifyAadharKycOtp(
        aadharNumber,
        clientId,
        otp,
        preEnquiryForm,
      );
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not verify aadhar kyc otp');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void createClientMaster(PreEnquiryForm preEnquiryForm) async {
    const action = NewLoanAction.createClientMaster;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.createClientMaster(preEnquiryForm);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not create client master');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void addAddress(String preEnqiuryId, bool isCurrentAddressSameAsPerAddress,
      CustomerAddress permanentAddress, CustomerAddress currentAddress) async {
    const action = NewLoanAction.addAddress;
    try {
      emit(const NewLoanActionState.loading(action));

      if (permanentAddress.addressLine1.isEmpty) {
        emit(NewLoanActionState.failure(
            action,
            Failure.invalidFieldValue(
                'Please enter permanent address line 1')));
      } else if (permanentAddress.postalCode.isEmpty ||
          int.tryParse(permanentAddress.postalCode) == null) {
        emit(NewLoanActionState.failure(
            action,
            Failure.invalidFieldValue(
                'Please enter permanent address valid postal code')));
      } else if (permanentAddress.cityName.isEmpty) {
        emit(NewLoanActionState.failure(
            action,
            Failure.invalidFieldValue(
                'Please enter permanent address city name')));
      } else if (permanentAddress.stateName.isEmpty) {
        emit(NewLoanActionState.failure(
            action,
            Failure.invalidFieldValue(
                'Please select permanent address state')));
      } else if (isCurrentAddressSameAsPerAddress == false) {
        if (permanentAddress.addressLine1.isEmpty) {
          emit(NewLoanActionState.failure(
              action,
              Failure.invalidFieldValue(
                  'Please enter current address line 1')));
        } else if (permanentAddress.postalCode.isEmpty ||
            int.tryParse(permanentAddress.postalCode) == null) {
          emit(NewLoanActionState.failure(
              action,
              Failure.invalidFieldValue(
                  'Please enter current address valid postal code')));
        } else if (permanentAddress.cityName.isEmpty) {
          emit(NewLoanActionState.failure(
              action,
              Failure.invalidFieldValue(
                  'Please enter current address city name')));
        } else if (permanentAddress.stateName.isEmpty) {
          emit(NewLoanActionState.failure(
              action,
              Failure.invalidFieldValue(
                  'Please select current address state')));
        } else {
          await _createAddress(preEnqiuryId, isCurrentAddressSameAsPerAddress,
              permanentAddress, currentAddress, action);
        }
      } else {
        await _createAddress(preEnqiuryId, isCurrentAddressSameAsPerAddress,
            permanentAddress, currentAddress, action);
      }
    } catch (e, st) {
      logError(e, st, '[bloc] could not add address');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  Future<void> _createAddress(
      String preEnqiuryId,
      bool isCurrentAddressSameAsPerAddress,
      CustomerAddress permanentAddress,
      CustomerAddress currentAddress,
      NewLoanAction action) async {
    final result = await repo.addAddress(preEnqiuryId,
        isCurrentAddressSameAsPerAddress, permanentAddress, currentAddress);
    result.fold(
      (l) => emit(NewLoanActionState.failure(action, l)),
      (r) => emit(
        NewLoanActionState.success(action, data: {'loan': r}),
      ),
    );
  }

  Future<void> updateAddressInForm(String id,String permanentAddressid,String currentAddressId) async {
    final res = await repo.updateAddressInForm(id, permanentAddressid, currentAddressId);
    res.fold(
        (l) => emit(NewLoanActionState.failure(NewLoanAction.addAddress, l)),
        (r) => emit(
          NewLoanActionState.success(NewLoanAction.addAddress, data: {'loan': r}),
        ),
      );
  }

  void updatePreEnquiryStatus(String loanId, String status) async {
    const action = NewLoanAction.updatePreEnquiryStatus;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.updatePreEnquiryStatus(loanId, status);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not send kyc link');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void completeKycReview(String loanId, Customer customer,String permanentAddress, String currentAddress) async {
    const action = NewLoanAction.completeKycReview;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.completeKycReview(
          loanId, customer, permanentAddress, currentAddress);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) {
          emit(
            NewLoanActionState.success(action, data: {'loan': r}),
          );
        },
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not send kyc link');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void completeAdditionalDetails(
    String loanId, {
    String? gender,
    String? email,
    String? occupationType,
    String? maritalStatus,
    String? residenceType,
    String? phoneNumber,
    String? altPhoneNumber,
    String? fatherName,
    String? motherName,
    String? employeeName,
    String? offPhoneNumber,
    String? offEmailId,
    String? designation,
    String? annualIncome,
  }) async {
    const action = NewLoanAction.completeAdditionalInformation;
    try {
      emit(const NewLoanActionState.loading(action));

      if (email == null || email.isEmpty == true) {
        emit(NewLoanActionState.failure(
            action, Failure.invalidFieldValue('Please enter email')));
      } else if (phoneNumber == null || phoneNumber.trim().isEmpty) {
        emit(NewLoanActionState.failure(
            action, Failure.invalidFieldValue('Please enter Phone Number.')));
      } else if (!RegExp(
              r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
          .hasMatch(phoneNumber)) {
        emit(NewLoanActionState.failure(action,
            Failure.invalidFieldValue('Enter valid 10 digit mobile number')));
      } else if (phoneNumber.trim().length != 10) {
        emit(NewLoanActionState.failure(action,
            Failure.invalidFieldValue('Please enter valid Phone Number.')));
      } else if (altPhoneNumber != null &&
          altPhoneNumber.trim().isNotEmpty &&
          altPhoneNumber.length != 10) {
        emit(NewLoanActionState.failure(
            action,
            Failure.invalidFieldValue(
                'Please enter valid Alternatve Phone Number.')));
      } else {
        final result = await repo.completeAdditionalInformation(
          loanId,
          gender: gender,
          maritalStatus: maritalStatus,
          occupationType: occupationType,
          residenceType: residenceType,
          phoneNumber: phoneNumber,
          altPhoneNumber: altPhoneNumber,
          fatherName: fatherName,
          motherName: motherName,
          employeeName: employeeName,
          offPhoneNumber: offPhoneNumber,
          offEmailId: offEmailId,
          designation: designation,
          annualIncome: annualIncome,
          email: email,
        );
        result.fold(
          (l) => emit(NewLoanActionState.failure(action, l)),
          (r) => emit(
            NewLoanActionState.success(action, data: {'loan': r}),
          ),
        );
      }
    } catch (e, st) {
      logError(e, st, '[bloc] could update additional information');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void fetchBankDetailsByIfsc(String ifscCode) async {
    const action = NewLoanAction.fetchBankDetailsByIfsc;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.fetchBankDetailsByIfsc(ifscCode);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'data': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could update additional information');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void addNewBank(String loanId, CustomerBank bank) async {
    const action = NewLoanAction.addNewBank;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.addNewBank(loanId, bank);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'bank': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could update additional information');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void completeBankSelection(
      String loanId, CustomerBank bank, bool isPreApproved) async {
    const action = NewLoanAction.completeBankSelection;
    try {
      emit(const NewLoanActionState.loading(action));

      final result =
          await repo.completeBankSelection(loanId, bank, isPreApproved);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could update additional information');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void updateEmiDetails(String loanId, String amount, EmiPlan? emiPlan) async {
    const action = NewLoanAction.updateEmiDetails;
    try {
      emit(const NewLoanActionState.loading(action));

      final result =
          await repo.updateLoanAmountAndEmiDetails(loanId, amount, emiPlan);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(NewLoanActionState.success(action, data: {'loan': r})),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could update emi information');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void checkCibilLimit(String loanId) async {
    const action = NewLoanAction.checkCibilLimit;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.checkCibilLimit(loanId);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'limits': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not complete cibil limit check');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void completeLoanRequirements(String loanId, bool isPreApproved) async {
    const action = NewLoanAction.completeLoanDetails;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.completeLoanRequirements(loanId, isPreApproved);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not complete loan requirements');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void resendESignLink(
      String enquiryId, String preEnquiryId, String eSignAction) {
    sendESignLink(
        enquiryId, preEnquiryId, eSignAction, NewLoanAction.resendESignLink);
  }

  void sendESignLink(
    String enquiryId,
    String preEnquiryId,
    String eSignAction, [
    NewLoanAction eventAction = NewLoanAction.sendSignLink,
  ]) async {
    final action = eSignAction == Constants.eSignActionResend
        ? NewLoanAction.resendESignLink
        : NewLoanAction.sendSignLink;
    try {
      emit(NewLoanActionState.loading(action));

      final result =
          await repo.sendESignLink(enquiryId, preEnquiryId, eSignAction);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not send e-sign link');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void sendEMandateLink(
      String enquiryId, String preEnquiryId, String eMandateAction) async {

    final action = eMandateAction == Constants.eSignActionResend
        ? NewLoanAction.resendEmandateLink
        : NewLoanAction.sendEMandateLink;
    try {
      emit(NewLoanActionState.loading(action));

      final result =
          await repo.sendEMandateLink(enquiryId, preEnquiryId, eMandateAction);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not send e-mandate link');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void completeESignAndEMandate(String enquiryId, String preEnquiryId) async {
    const action = NewLoanAction.completeESignAndEMandate;
    try {
      emit(const NewLoanActionState.loading(action));

      final result =
          await repo.completeESignAndEMandate(enquiryId, preEnquiryId);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not send e-mandate link');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void updateMandateDetails(String enquiryId, CustomerMandate mandate) async {
    const action = NewLoanAction.updateMandateDetails;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.updateMandateDetails(enquiryId, mandate);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not update mandate details');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void generateAndSendBSLink(String enquiryId) async {
    const action = NewLoanAction.generateBSAnalyzerLink;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.generateAndSendBSLink(enquiryId);
      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'loan': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not generate Bank Statement link.');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }

  void downloadBankStatement(String enquiryId) async {
    const action = NewLoanAction.downloadBankStatement;
    try {
      emit(const NewLoanActionState.loading(action));

      final result = await repo.downloadBankStatement(enquiryId);

      result.fold(
        (l) => emit(NewLoanActionState.failure(action, l)),
        (r) => emit(
          NewLoanActionState.success(action, data: {'status': r}),
        ),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not generate Bank Statement link.');
      emit(NewLoanActionState.failure(action, Failure.unknownFailure()));
    }
  }
}
