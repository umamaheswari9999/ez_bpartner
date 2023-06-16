import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/data/model/aadhaar_kyc_response_dto.dart';
import 'package:ez_flutter/features/loans/data/model/attachment_dto.dart';
import 'package:ez_flutter/features/loans/data/model/bank_by_ifsc_dto.dart';
import 'package:ez_flutter/features/loans/data/model/client_master_dto.dart';
import 'package:ez_flutter/features/loans/data/model/customer_bank_dto.dart';
import 'package:ez_flutter/features/loans/data/model/customer_dto.dart';
import 'package:ez_flutter/features/loans/data/model/emi_plan_dto.dart';
import 'package:ez_flutter/features/loans/data/model/loan_dto.dart';
import 'package:ez_flutter/features/loans/data/model/loan_eligibility_limit_dto.dart';
import 'package:ez_flutter/features/loans/data/model/note_dto.dart';
import 'package:ez_flutter/features/loans/data/model/ocrpan.dart';
import 'package:ez_flutter/features/loans/data/model/pre_enquiry_form_dto.dart';
import 'package:ez_flutter/features/loans/domain/entity/aadhaar_kyc_response.dart';
import 'package:ez_flutter/features/loans/domain/entity/attachment.dart';
import 'package:ez_flutter/features/loans/domain/entity/bank_by_ifsc.dart';
import 'package:ez_flutter/features/loans/domain/entity/client_master.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_address.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_bank.dart';
import 'package:ez_flutter/features/loans/domain/entity/customer_mandate.dart';
import 'package:ez_flutter/features/loans/domain/entity/emi_plan.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_eligibility_limit.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_filters.dart';
import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/features/loans/domain/entity/note.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/domain/entity/recent_loans.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/network/api_helper.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/utils/list_ext.dart';
import 'package:ez_flutter/shared/locator.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@LazySingleton(as: LoanRepo)
class LoanRepoImpl implements LoanRepo {
  final ApiHelper api;

  LoanRepoImpl(this.api);

  @override
  Future<Either<Failure, RecentLoans>> fetchRecentLoans(
      LoanFilters filters, int start, int end) async {
    const defErrMsg = "Could not load recent loans";
    try {
      late List<Loan> loans1 = [];
      late List<Loan> loans2 = [];
      late List<Loan> loans3 = [];
      late List<Loan> loans4 = [];
      if (filters.status == LoanStatus.all) {
        final draftloans = await fetchLoans(
            filters.copyWith(status: LoanStatus.draft), start, end);
        final preapprovedloans = await fetchLoans(
            filters.copyWith(status: LoanStatus.preApproved), start, end);
        final disbursedloans = await fetchLoans(
            filters.copyWith(status: LoanStatus.disbursed), start, end);
        loans1 = draftloans.getOrElse(() => []);
        loans2 = preapprovedloans.getOrElse(() => []);
        loans3 = disbursedloans.getOrElse(() => []);
      } else {
        if (filters.status == LoanStatus.draft) {
          final draftloans = await fetchLoans(
              filters.copyWith(status: LoanStatus.draft), 0, 20);
          loans1 = draftloans.getOrElse(() => []);
        } else if (filters.status == LoanStatus.preApproved) {
          final preapprovedloans = await fetchLoans(
              filters.copyWith(status: LoanStatus.preApproved), 0, 20);
          loans2 = preapprovedloans.getOrElse(() => []);
        } else if (filters.status == LoanStatus.disbursed) {
          final disbursedloans = await fetchLoans(
              filters.copyWith(status: LoanStatus.disbursed), 0, 20);
          loans3 = disbursedloans.getOrElse(() => []);
        } else if (filters.status == LoanStatus.rejected) {
          final disbursedloans = await fetchLoans(
              filters.copyWith(status: LoanStatus.rejected), 0, 9);
          loans4 = disbursedloans.getOrElse(() => []);
        }
      }
      return right(
        RecentLoans(
          draftLoans: loans1,
          preApprovedLoans: loans2,
          disbursedLoans: loans3,
          rejectedLoans: loans4,
        ),
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, List<Note>>> fetchNotes(
      String recordId, int start, int end) async {
    const defErrMsg = 'Could not load support chart';
    try {
      final url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.generic}?_entityName=${Entities.note}&"
          "_sortBy=creationDate desc&"
          "_selectedProperties=note,creationDate,createdBy&"
          "_where=record='$recordId'&"
          "_startRow=$start&_endRow=$end";
      final result = await api.get(url, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) => right(DtoListToDomainList<NoteDto, Note>(
                r.parseJsonList(NoteDto.fromJson))
            .toDomainList()),
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Note>> insertNote(String recordId, String note) async {
    const defErrMsg = 'Could not add note';
    try {
      const url = "${Constants.baseCustomApiUrl}/${CustomWebServices.generic}";
      final requestBody = json.encode({
        'data': {
          "_entityName": Entities.note,
          "note": note,
          "table": "B13E6D3936CD4811857E097C13E5CECC",
          "record": recordId,
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) => right(DtoListToDomainList<NoteDto, Note>(
                r.parseJsonList(NoteDto.fromJson))
            .toDomainList()[0]),
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, List<Loan>>> fetchLoans(
      LoanFilters filters, int start, int end) async {
    const defErrMsg = 'Could not load loans';

    String getRangeCondition(String? from, String? to) {
      if (from != null && to != null) {
        return "(date(creationDate) >= date('$from') and date(creationDate)<= date('$to'))";
      }
      if (from == null && to != null) {
        return "(date(creationDate) <= date('$to'))";
      }
      if (from != null && to == null) {
        return "(date(creationDate) >= date('$from'))";
      }
      return '';
    }

    String getSearchCondition(String? it) {
      if (it == null || it.isEmpty) return '';
      final loanno = it.trim().toLowerCase().startsWith('ezf') ? it : 'EZF$it';
      return "( (prooftypenumber LIKE '%$it%') OR (lower(customername) LIKE '%${it.toLowerCase()}%') OR (lower(loanno) LIKE '%${loanno.toLowerCase()}%') )";
    }

    String getStatusCondition(LoanStatus? loanStatus) {
      switch (loanStatus) {
        case LoanStatus.draft:
          return "(loandisburse = false and loanpreapproved = false and loanrejected = false)";
        case LoanStatus.preApproved:
          return "(loanpreapproved = true) and loanrejected= 'N' and loandisburse= 'N'";
        case LoanStatus.disbursed:
          return "loandisburse='Y' and loanpreapproved='Y' and loanrejected='N'";
        case LoanStatus.rejected:
          return "loanrejected='Y' and loandisburse='N' and loanpreapproved='N'";
        default:
          return "";
      }
    }

    try {
      final format = DateFormat("yyyy-MM-dd");
      final user = getLoggedInUser();
      final createdBy = "createdBy='${user.id}'";
      final businessPartnerId = "bpagent='${filters.bpId?.id}'";
      final branchid = "agentbranch='${filters.bpAddressId?.id}'";
      final statusCondition = getStatusCondition(filters.status);
      final searchCondition = getSearchCondition(filters.searchQuery);
      final rangeCondition = getRangeCondition(
          filters.fromDate == null ? null : format.format(filters.fromDate!),
          filters.toDate == null ? null : format.format(filters.toDate!));

      final conditions = [
        businessPartnerId,
        branchid,
        statusCondition,
        searchCondition,
        rangeCondition
      ];

      if (searchCondition.isNotEmpty &&
          user.businessPartnerId == null &&
          user.businessPartnerAddressId == null) {
        conditions.remove(businessPartnerId);
        conditions.remove(branchid);
      }
      final where =
          conditions.where((e) => e.isNotEmpty).toList().join(" and ");

      final url =
          "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}?_startRow=$start&_endRow=$end&"
          "_where=$where";

      final result = await api.get(url, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<LoanDto, Loan>(
                  r.parseJsonList(LoanDto.fromJson))
              .toDomainList());
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Tuple2<PreEnquiryForm?, Customer?>>> checkIfLoanExists(
      String panOrAadhaar, String bpid, String bpAddid) async {
    const String defErrMsg = 'Could not check for existing loan';
    try {
      final url =
          "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}?_where=panno='$panOrAadhaar' and bpagent='$bpid' and agentbranch = '$bpAddid' and loandisburse=false and loanrejected=false";
      final result = await api.get(url, defErrMsg);
      return await result.fold(
        (l) => left(l),
        (r) async {
          PreEnquiryForm? preEnquiry;

          if (r.isNotEmpty) {
            preEnquiry = DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                    r.parseJsonList(PreEnquiryFormDto.fromJson))
                .toDomainList()[0];
          }

          const url2 =
              "${Constants.baseCustomApiUrl}/${CustomWebServices.clientMasterDetails}";
          final requestBody = json.encode({
            'data': {
              'poiNumber': panOrAadhaar,
            }
          });
          final result2 = await api.post(url2, requestBody, defErrMsg);
          final clientMasterDetailsJson =
              result2.getOrElse(() => throw Exception(defErrMsg));
          if (clientMasterDetailsJson.isEmpty) {
            return right(Tuple2(preEnquiry, null));
          }

          final customer = CustomerDto.fromJson(
                  clientMasterDetailsJson[0] as Map<String, dynamic>)
              .toDomain();

          return right(Tuple2(preEnquiry, customer));
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, bool>> addBankDetails() {
    // TODO: implement addBankDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> checkLoanEligibility(
      double amount, String loanTerms) {
    // TODO: implement checkLoanEligibility
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PreEnquiryForm?>> createBasicPreEnquiry(
    String pan,
    String customerName,
    String aadhaarNumber,
    DateTime dob,
    String mobile,
    String gender,
    String bpartnerId,
    String bpartnerAddId, {
    String? customerRefNo,
    Customer? customer,
  }) async {
    const String defErrMsg = 'Could not create loan';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}";
      final appData = locator.get<AppStaticData>();
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'customername': customerName,
          'prooftypenumber': aadhaarNumber,
          'panno': pan,
          'gender': gender,
          'dateofbirth': DateFormat("yyyy-MM-dd").format(dob),
          'mobilenumber': mobile,
          'lDSProoftype': appData.panProofTypeId,
          'lDSApploanstatus': LoanStage.draft,
          'bpagent': bpartnerId,
          'agentbranch': bpartnerAddId,
          'vkycrefno': customerRefNo,
          'lDSProofofadd': appData.panProofTypeId,
          'lDSLoanaccounttype': appData.defaultLoanAccountType,
          'emailid': customer?.master.email,
          if (customer != null)
            'alternatenumber': customer.master.alternativeMobileNumber,
          if (customer == null) 'alternatenumber': mobile,
          if (customer != null) 'nameonpan': customer.master.nameOnPan,
          if (customer != null) ...{
            'fathername': customer.master.fatherName,
            'mothername': customer.master.motherName,
            'maritalstatus': customer.master.maritalStatus,
            'annualincome': customer.master.annualIncome,
            'employername': customer.master.employeeName,
            'occupationtype': customer.master.occupationStatus,
            'employeraddress': customer.master.employeeAddress,
            'designation': customer.master.designation,
            if (customer.master.officePhoneNumber != null)
              'officephonenumber':
                  int.tryParse(customer.master.officePhoneNumber!),
            'officialEmail': customer.master.officeEmailId,
            'consentCreatedBy': customer.master.consentCreatedBy,
            "consentCreatedOn": customer.master.consentCreatedOn,
            "verifiedOtp": customer.master.verifiedOtp,
            "consentCibilCheck": customer.master.consentCibilCheck,
            "termsAgree": customer.master.termsAgree,
            "consentApprovedIp": customer.master.consentApprovedIp,
            "consentBrowserUsed": customer.master.consentBrowserUsed,
            "consentCkycCheck": customer.master.consentKycCheck,
            "consentApproved": customer.master.consentApproved,
            "ckycNo": customer.master.ckycNo,
            "ckycKycDate": customer.master.ckycDate,
            "ckycKycUpdated": customer.master.ckycUpdated,
          }
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);

      return result.fold(
        (l) => left(l),
        (r) {
          if (r.isEmpty) return right(null);
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, String>> sendConsentOtp(String preEnquiryId) async {
    const String defErrMsg = 'Could not send otp';
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.sendKycOtp}";

      final requestBody = json.encode({
        'data': {'preEnquiryFormId': preEnquiryId, 'action': 'Send OTP'}
      });

      final result = await api.loanApiPost(url, requestBody, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          var data = r as Map<String, dynamic>;
          var otp = data['OTP'] as String;
          return right(otp);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Tuple2<PreEnquiryForm, PreEnquiryForm>>>
      sendEMandateLink(
          String enquiryId, String preEnquiryId, String action) async {
    const String defErrMsg = 'Could not send e-mandate link';
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.sendEMandateLink}";

      final requestBody = json.encode({
        'data': {
          'enquiryFormId': enquiryId,
          'action': action,
        }
      });
      final result = await api.loanApiPost(url, requestBody, defErrMsg);
      return await result.fold(
        (l) => left(l),
        (r) async {
          final preEnquiryResult = await _updateLoanEntity(
            Entities.preEnquiry,
            json.encode({
              'data': {
                '_entityName': Entities.preEnquiry,
                'id': preEnquiryId,
                'lDSApploanstatus': LoanStage.waitingForEMandate,
              }
            }),
          );

          final enquiryRes =
              await _getLoanEntity(Entities.enquiryForm, "id='$enquiryId'");
          final enquiry = enquiryRes.getOrElse(
            () => throw Exception(
                'eMandate link sent successfully but could\'t update the loan status'),
          );

          return preEnquiryResult.fold(
            (l) => left(
              Failure.apiFailure(
                  'eMandate link sent successfully but could\'t update the loan status'),
            ),
            (r) => right(Tuple2(r, enquiry)),
          );
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Tuple2<PreEnquiryForm, PreEnquiryForm>>> sendESignLink(
      String enquiryId, String preEnquiryId, String action) async {
    const String defErrMsg = 'Could not send e-sign link';
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.sendESignLink}";

      final requestBody = json.encode({
        'data': {
          'enquiryFormId': enquiryId,
          'action': action,
        }
      });

      final result = await api.loanApiPost(url, requestBody, defErrMsg);

      return await result.fold(
        (l) => left(l),
        (r) async {
          final preEnquiryResult = await _updateLoanEntity(
            Entities.preEnquiry,
            json.encode({
              'data': {
                '_entityName': Entities.preEnquiry,
                'id': preEnquiryId,
                'lDSApploanstatus': LoanStage.waitingForESign,
              }
            }),
          );

          final enquiryRes =
              await _getLoanEntity(Entities.enquiryForm, "id='$enquiryId'");
          final enquiry = enquiryRes.getOrElse(
            () => throw Exception(
                'eSign link sent successfully but could\'t update the loan status'),
          );

          return preEnquiryResult.fold(
            (l) => left(
              Failure.apiFailure(
                  'eSign link sent successfully but could\'t update the loan status'),
            ),
            (r) => right(Tuple2(r, enquiry)),
          );
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, bool>> sendKycLink(String mobileNumber) async {
    const defErrMsg = 'Could not send kyc link';
    try {
      await addDelay();
      return right(true);
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Tuple2<PreEnquiryForm, Customer>>>
      verifyConsentOtpAndDoKyc(String preEnquiry, String enteredOtp) async {
    const String defErrMsg = 'Could not complete the KYC';
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.fetchKycData}";
      final user = getLoggedInUser();
      final requestBody = json.encode({
        'data': {
          'preEnquiryFormId': preEnquiry,
          'otp': enteredOtp,
          'consentcreatedby': user.id,
          'browserused': Constants.consentBrowserUsed,
          'consentapprovedip': '',
          'consentcreatedon': '',
          'username': user.username,
        }
      });
      final result = await api.post(url, requestBody, defErrMsg);
      return await result.fold(
        (l) => left(l),
        (r) async {
          if (r.isEmpty) {
            return left(Failure.apiFailure(defErrMsg));
          }

          final preEnquiry = PreEnquiryFormDto.fromJson(
                  (r[0] as Map<String, dynamic>)['pre-enquiry']
                      as Map<String, dynamic>)
              .toDomain();

          const url2 =
              "${Constants.baseCustomApiUrl}/${CustomWebServices.clientMasterDetails}";
          final requestBody = json.encode({
            'data': {
              'poiNumber': preEnquiry.poiNumber,
            }
          });

          final result2 = await api.post(url2, requestBody, defErrMsg);

          final clientMasterDetailsJson =
              result2.getOrElse(() => throw Exception(defErrMsg));

          final customer = CustomerDto.fromJson(
                  clientMasterDetailsJson[0] as Map<String, dynamic>)
              .toDomain();

          return right(Tuple2(preEnquiry, customer));
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, bool>> checkIfKycDone(String customerId) async {
    const String defErrMsg = 'Could not check for kyc status';
    try {
      await addDelay();
      return right(false);
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  Future<void> addDelay() {
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<
          Either<Failure,
              Tuple2<Tuple2<PreEnquiryForm, PreEnquiryForm?>, Customer?>>>
      fetchLoanAndClientMasterDetails(
          String loanNumber, String poiNumber) async {
    const String defErrMsg = 'Could not fetch loan and client master details';
    try {
      final url =
          "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}?_where=loanno='$loanNumber'";
      final result = await api.get(url, defErrMsg);
      final loanDetailsJson =
          result.getOrElse(() => throw Exception(defErrMsg));
      final preEnquiry =
          PreEnquiryFormDto.fromJson(loanDetailsJson[0] as Map<String, dynamic>)
              .toDomain();

      final enquiryUrl =
          "${Constants.baseDefaultApiUrl}/${Entities.enquiryForm}?_where=loanno='$loanNumber'";

      final enquiryResult = await api.get(enquiryUrl, defErrMsg);
      final enquiryJson =
          enquiryResult.getOrElse(() => throw Exception(defErrMsg));
      final enquiry = enquiryJson.isNotEmpty
          ? PreEnquiryFormDto.fromJson(enquiryJson[0] as Map<String, dynamic>)
              .toDomain()
          : null;

      const url2 =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.clientMasterDetails}";
      final requestBody = json.encode({
        'data': {
          'poiNumber': poiNumber,
        }
      });

      final result2 = await api.post(url2, requestBody, defErrMsg);
      final clientMasterDetailsJson =
          result2.getOrElse(() => throw Exception(defErrMsg));
      if (clientMasterDetailsJson.isEmpty) {
        return right(Tuple2(Tuple2(preEnquiry, enquiry), null));
      }

      final customer = CustomerDto.fromJson(
              clientMasterDetailsJson[0] as Map<String, dynamic>)
          .toDomain();
      return right(Tuple2(Tuple2(preEnquiry, enquiry), customer));
    } catch (e, st) {
      dev.log(defErrMsg, error: e, stackTrace: st);
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> completeKycReview(String loanId,
      Customer customer, String permanentAddress, String currentAddress) async {
    const defErrMsg = 'Could not complete kyc review';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}";
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': loanId,
          if (currentAddress.isNotEmpty) 'currentaddress': currentAddress,
          if (permanentAddress.isNotEmpty) 'location': permanentAddress,
          'nameonpan': customer.master.nameOnPan,
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);

      Either<Failure, PreEnquiryForm> toBeReturned = result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );

      if (toBeReturned.isLeft()) return left(Failure.apiFailure(defErrMsg));

      final aadhaarRes =
          await _hasAttachment(loanId, 'Aadhar.jpg', Entities.preEnquiry);
      if (aadhaarRes.isLeft()) {
        return left(Failure.apiFailure(
            'Address details updated but not able to check for aadhaar document'));
      }
      final hasAadhar = aadhaarRes.getOrElse(() => false);
      if (!hasAadhar) {
        return left(Failure.serverFailure(Constants.documentsNeededCode,
            'To proceed further please upload required documents (Aadhaar and PAN)'));
      }

      final panRes =
          await _hasAttachment(loanId, 'PAN.jpg', Entities.preEnquiry);
      if (panRes.isLeft()) {
        return left(Failure.apiFailure(
            'Address details updated but not able to check for PAN document'));
      }
      final hasPan = panRes.getOrElse(() => false);
      if (!hasPan) {
        return left(Failure.serverFailure(Constants.documentsNeededCode,
            'To proceed further please upload required documents (Aadhaar and PAN)'));
      }

      await _updateLoanEntity(
          Entities.preEnquiry,
          json.encode({
            'data': {
              '_entityName': Entities.preEnquiry,
              'id': loanId,
              'lDSApploanstatus': LoanStage.additionalInfo,
            }
          }));

      return toBeReturned;
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> completeAdditionalInformation(
    String loanId, {
    String? gender,
    String? email,
    String? maritalStatus,
    String? occupationType,
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
    const String defErrMsg = 'Could not update additional information';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}";
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': loanId,
          'lDSApploanstatus': LoanStage.loanRequirements,
          'gender': gender,
          'maritalstatus': maritalStatus,
          'occupationtype': occupationType,
          'residentialstatus': residenceType,
          'fathername': fatherName,
          'mothername': motherName,
          'employername': employeeName,
          if (email != null && email.isNotEmpty) 'emailid': email,
          'officephonenumber':
              offPhoneNumber != null ? int.tryParse(offPhoneNumber) : null,
          'officialEmail': offEmailId,
          'designation': designation,
          'annualincome': int.tryParse(annualIncome ?? '0'),
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, CustomerBank>> addNewBank(String loanId, CustomerBank bank) async {
    const defErrMsg = 'Could not add new bank';
    try {
      const url = "${Constants.baseCustomApiUrl}/${CustomWebServices.addNewBank}";
      final requestBody = json.encode({
        'data': {
          if (bank.id.isNotEmpty) 'bankId': bank.id,
          "preEnquiryFormId": loanId,
          "accnumber": bank.accountNumber,
          "acctype": bank.accountType,
          "ifsccode": bank.ifscCode,
          "bankname": bank.bankName,
          "branchname": bank.branchName,
          "micr": bank.micrCode,
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);

      return result.fold(
        (l) => left(l),
        (r) {
          if (r.isEmpty) {
            return left(
                Failure.serverFailure(Constants.repoException, defErrMsg));
          }
          final data = r[0] as Map<String, dynamic>;
          final bank = data['Bank'] as Map<String, dynamic>;
          return right(CustomerBankDto.fromJson(bank).toDomain());
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Tuple2<PreEnquiryForm, PreEnquiryForm>>>
      completeBankSelection(
          String loanId, CustomerBank bank, bool isPreApproved) async {
    const String defErrMsg = 'Could not update bank information';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}";
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': loanId,
          'lDSApploanstatus': LoanStage.initiateESign,
          'lDSBankdetails': bank.id,
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);
      return await result.fold(
        (l) => left(l),
        (r) async {
          if (isPreApproved == false) {
            final preApprovalRes = await _doPreEnquiryAction(loanId,
                GetScoreApiActions.preApprove, 'Pre Approving the loan');

            if (preApprovalRes.isLeft()) {
              await _updateLoanEntity(
                Entities.preEnquiry,
                json.encode({
                  'data': {
                    '_entityName': Entities.preEnquiry,
                    'id': loanId,
                    'lDSApploanstatus': LoanStage.bankDetails,
                  }
                }),
              );
              return left(
                Failure.serverFailure(Constants.unexpectedResponse,
                    'Could not pre approve the loan. Please try again later'),
              );
            }
          }

          final sendToEnquiryRes = await _doPreEnquiryAction(
              loanId, GetScoreApiActions.sendToEnquiry, 'Send to enquiry');

          return await sendToEnquiryRes.fold(
            (l) async {
              await _updateLoanEntity(
                Entities.preEnquiry,
                json.encode({
                  'data': {
                    '_entityName': Entities.preEnquiry,
                    'id': loanId,
                    'lDSApploanstatus': LoanStage.bankDetails,
                  }
                }),
              );
              return left(l);
            },
            (r1) async {
              final preEnquiryForm =
                  DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                          r.parseJsonList(PreEnquiryFormDto.fromJson))
                      .toDomainList()[0];

              final enquiryRes = await _getLoanEntity(
                Entities.enquiryForm,
                "loanno='${preEnquiryForm.preEnquiryNumber}'",
              );
              final enquiry = enquiryRes.getOrElse(
                () => throw Exception(
                    'eSign link sent successfully but could\'t update the loan status'),
              );

              return right(Tuple2(preEnquiryForm, enquiry));
            },
          );
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, List<Simple>>> fetchBanks(
      int start, int end, String? query) async {
    const String defErrMsg = 'Could not fetch banks';
    try {
      final url = "${Constants.baseDefaultApiUrl}/${Entities.financialAccount}?"
          "_sortBy=name&"
          "_selectedProperties=id,name&"
          "${query == null ? '' : '&_where=lower(name) LIKE \'${query.toLowerCase()}\''}";
      final result = await api.get(url, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) =>
            right(r.map((e) => Simple(id: e['id'], title: e['name'])).toList()),
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, List<EmiPlan>>> fetchEmiPlans(String bpagent, int amount) async {
    const defErrMsg = 'Could not fetch EMI Loan Terms';
    try {
      final url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.loanterms}?agentid=$bpagent&loanamount=$amount";
      final result = await api.get(url, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          final plans = DtoListToDomainList<EmiPlanDto, EmiPlan>(
                  r.parseJsonList(EmiPlanDto.fromJson))
              .toDomainList();
          plans.sort((a, b) => a.totalemis.compareTo(b.totalemis));
          return right(plans);
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> completeLoanRequirements(
      String loanId, bool isPreApproved) async {
    const String defErrMsg = 'Could not update emi information';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}";
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': loanId,
          'lDSApploanstatus': LoanStage.bankDetails,
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);
      return await result.fold(
        (l) => left(l),
        (r) async {
          final preEnquiryForm =
              DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                      r.parseJsonList(PreEnquiryFormDto.fromJson))
                  .toDomainList()[0];

          return right(preEnquiryForm);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> updateLoanAmountAndEmiDetails(
      String loanId, String amount, EmiPlan? emiPlan) async {
    const defErrMsg = 'Could not update emi information';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}";
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': loanId,
          'lDSAgent': emiPlan?.id,
          'tenure': emiPlan?.totalemis,
          'anuintrate': emiPlan != null
              ? double.tryParse(emiPlan.interestrate) ??
                  int.parse(emiPlan.interestrate)
              : null,
          'loanamount': double.tryParse(amount),
          'docchargesgst': 0,
          'processchargegst': 0,
        }
      });
      final result = await api.post(url, requestBody, defErrMsg);

      return result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, LoanEligibilityLimit>> checkCibilLimit(
      String loanId) async {
    const defErrMsg = 'Could not check for loan eligibility';
    try {
      const url = "${Constants.baseCustomApiUrl}/${CustomWebServices.getScore}";
      final requestBody = json.encode({
        'data': {
          'preEnquiryFormId': loanId,
          'action': GetScoreApiActions.downloadCibil,
          'reason': 'Cibil Check'
        }
      });

      final result = await api.loanApiPost(
        url,
        requestBody,
        defErrMsg,
        needFullResponse: true,
      );
      return await result.fold(
        (l) => left(l),
        (r) async {
          final r1 = await _doPreEnquiryAction(
              loanId, GetScoreApiActions.getScore, 'Get Score');
          return r1.fold(
            (l) => left(
              Failure.apiFailure(
                  'Loan Eligibility check completed. Please continue'),
            ),
            (r) {
              return right(
                LoanEligibilityLimitDto.fromJson(r as Map<String, dynamic>)
                    .toDomain(),
              );
            },
          );
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, BankByIfsc>> fetchBankDetailsByIfsc(
      String ifscCode) async {
    const String defErrMsg = 'Could not fetch bank details by ifsc';
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.fetchBankDetails}";
      final requestBody = json.encode({
        'data': {
          'ifscCode': ifscCode,
        }
      });

      final result = await api.loanApiPost(
        url, 
        requestBody, 
        defErrMsg,
        needFullResponse: true,
      );
      return result.fold(
        (l) => left(l),
        (r) {
          final data = r as Map<String, dynamic>;
          final resultForIfsc = data['response'] as Map<String, dynamic>;
          final bankByIfsc = BankByIfscDto.fromJson(resultForIfsc).toDomain();
          return right(bankByIfsc);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  Future<Either<Failure, dynamic>> _doPreEnquiryAction(
    String loanId,
    String action,
    String reason,
  ) async {
    const String defErrMsg = 'Could not get score';
    try {
      const url = "${Constants.baseCustomApiUrl}/${CustomWebServices.getScore}";

      final requestBody = json.encode({
        'data': {
          'preEnquiryFormId': loanId,
          'action': action,
          'reason': reason,
        }
      });
      final result = await api.loanApiPost(url, requestBody, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) => right(r),
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  Future<Either<Failure, PreEnquiryForm>> _updateLoanEntity(String entity, String requestBody) async {
    const defErrMsg = 'Could not update loan form';
    try {
      final url = "${Constants.baseDefaultApiUrl}/$entity";
      final result = await api.post(url, requestBody, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  Future<Either<Failure, PreEnquiryForm>> _getLoanEntity(
      String entity, String where) async {
    const defErrMsg = 'Could not update loan form';
    try {
      final url = "${Constants.baseDefaultApiUrl}/$entity?_where=$where";
      final result = await api.get(url, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> completeESignAndEMandate(
      String enquiryId, String preEnquiryId) async {
    const String defErrMsg = 'Could not complete eSign and eMandate step';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.preEnquiry}";
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': preEnquiryId,
          'lDSApploanstatus': LoanStage.waitingForCallVerification,
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> updateMandateDetails(
      String enquiryId, CustomerMandate mandate) async {
    const String defErrMsg = 'Could not update mandate details';
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.enquiryForm}";
      final requestBody = json.encode({
        'data': {
          '_entityName': Entities.enquiryForm,
          'id': enquiryId,
          'mandateid': mandate.mandateId,
          'url': mandate.url,
          'mandatetype': mandate.mandateType,
          'mandateregisteredon': mandate.registeredOn,
          'enachstage': mandate.mandateStage,
          'enachstatus': mandate.mandateStatus,
          'umrnnumber': mandate.umrn,
          'enachspb': mandate.sponserBank,
          'ecsapplicable': mandate.isApplicable,
          'ecsamount': mandate.amountRegistered,
        }
      });

      final result = await api.post(url, requestBody, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          return right(DtoListToDomainList<PreEnquiryFormDto, PreEnquiryForm>(
                  r.parseJsonList(PreEnquiryFormDto.fromJson))
              .toDomainList()[0]);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Uint8List>> fetchAttachment(
      String recordId, String fileName, String entityName) async {
    const defErrMsg = "Could not fetch attachment data";
    try {
      final url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.attachmentWs}?entity_name=$entityName&name=$fileName&record_id=$recordId&selected=file_data";

      final data = await api.get(url, defErrMsg);
      return data.fold(
        (l) => left(l),
        (r) {
          if (r.isEmpty) {
            return left(Failure.invalidFieldValue('Empty'));
          }
          return right(base64Decode(r[0]['file_data'] as String));
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, List<Attachment>>> fetchLoanAttachments(
      String recordId) async {
    const defErrMsg = "Could not fetch attachments";
    try {
      final url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.attachmentWsV2}?entity_name=${Entities.preEnquiry}&record_id=$recordId&selected=id,name,description";

      final data = await api.get(url, defErrMsg);
      return data.fold(
        (l) => left(l),
        (r) {
          var attachments =
              r.map((e) => AttachmentDto.fromJson(e).toDomain()).toList();
          return right(attachments);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, List<Simple>>> fetchAttachmentDocTypes() async {
    const defErrMsg = "Could not fetch attachment types";
    try {
      const url =
          "${Constants.baseDefaultApiUrl}/${Entities.attachmentDocTypes}";

      final data = await api.get(url, defErrMsg);
      return data.fold(
        (l) => left(l),
        (r) {
          final types =
              r.map((e) => Simple(id: e['id'], title: e['name'])).toList();
          return right(types);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, Attachment>> uploadFile(String recordId,
      Simple docType, PlatformFile file, String filepath) async {
    const defErrMsg = "Could not upload file";
    try {
      final data = await api.addAttachment(
          Entities.preEnquiry, recordId, docType.title, file, filepath);

      return await data.fold(
        (l) => left(l),
        (r) async {
          const url = "${Constants.baseDefaultApiUrl}/${Entities.attachment}";
          final requestBody = json.encode({
            'data': {
              '_entityName': Entities.attachment,
              'id': r.id,
              'ldsDocumentmaster': docType.id,
            }
          });

          final result = await api.post(url, requestBody, defErrMsg);

          return result.fold(
            (l) => left(l),
            (r1) => right(r),
          );
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, AadhaarKycResponse>> sendAadharKycOtp(
      String aadharNumber) async {
    const String defErrMsg = "Could not send OTP";
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.aadharKyc}";

      final body = json.encode({
        'data': {
          'aadhaar': aadharNumber,
          'action': AadharKycActions.generate,
        }
      });

      final data = await api.loanApiPost(url, body, defErrMsg);
      return await data.fold(
        (l) => left(l),
        (r) async {
          final data = r as Map<String, dynamic>;
          return right(AadhaarKycResponseDto.fromJson(data).toDomain());
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, ClientMaster>> verifyAadharKycOtp(
      String aadharNumber, String clientId, String otp,
      [PreEnquiryForm? preEnquiryForm]) async {
    const String defErrMsg = "Could not verify OTP";
    try {
      const url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.aadharKyc}";

      final body = json.encode({
        'data': {
          'aadhaar': aadharNumber,
          'clientid': clientId,
          'otp': otp,
          'pan': preEnquiryForm?.pan,
          'action': AadharKycActions.submit,
        }
      });

      final data = await api.loanApiPost(url, body, defErrMsg);

      return await data.fold(
        (l) => left(l),
        (r) async {
          final data = r as Map<String, dynamic>;

          final domain = ClientMasterDto.fromJson(data).toDomain();
          if (preEnquiryForm != null) {
            final reqBody = json.encode({
              'data': {
                '_entityName': Entities.clientMaster,
                'id': domain.id,
                'lDSPanno': preEnquiryForm.pan,
                'phone': preEnquiryForm.mobileNumber,
                'email': preEnquiryForm.email,
                'aadhaarnumber': aadharNumber,
              }
            });

            const url2 =
                "${Constants.baseDefaultApiUrl}/${Entities.clientMaster}";
            await api.post(url2, reqBody, defErrMsg);

            await _updateLoanEntity(
              Entities.preEnquiry,
              json.encode({
                'data': {
                  '_entityName': Entities.preEnquiry,
                  'id': preEnquiryForm.id,
                  'lDSApploanstatus': LoanStage.reviewKyc,
                  'vkycrefno': domain.id,
                  'prooftypenumber': aadharNumber,
                }
              }),
            );
          }

          return right(domain);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, ClientMaster>> createClientMaster(
      PreEnquiryForm preEnquiryForm) async {
    const defErrMsg = "Could not create client master";
    try {
      const url = "${Constants.baseDefaultApiUrl}/${Entities.clientMaster}";
      final body = json.encode({
        'data': {
          '_entityName': Entities.clientMaster,
          'lDSName': preEnquiryForm.customerName,
          'aadhaarnumber': preEnquiryForm.poiNumber,
          'lDSPanno': preEnquiryForm.pan,
          'phone': preEnquiryForm.mobileNumber,
          'gender': preEnquiryForm.gender,
          'dateofbirth': preEnquiryForm.dob,
        }
      });

      final data = await api.post(url, body, defErrMsg);

      return await data.fold(
        (l) => left(l),
        (r) async {
          final data = (r)[0] as Map<String, dynamic>;
          final clientMaster = ClientMasterDto.fromJson(data).toDomain();
          await _updateLoanEntity(
            Entities.preEnquiry,
            json.encode({
              'data': {
                '_entityName': Entities.preEnquiry,
                'id': preEnquiryForm.id,
                'lDSApploanstatus': LoanStage.reviewKyc,
                'vkycrefno': clientMaster.id,
              }
            }),
          );
          return right(clientMaster);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, bool>> addAddress(
    String preEnqiuryId,
    bool isCurrentAddressSameAsPerAddress,
    CustomerAddress address,
    CustomerAddress currentAddress,
  ) async {
    const String defErrMsg = "Could not add new address";
    try {
      String permanentAddressId = '';
      String currentAddressId = '';

      if (isCurrentAddressSameAsPerAddress) {
        final addressRes = await _createAddress(address, defErrMsg);
        if (addressRes.isLeft()) {
          return left(Failure.apiFailure(defErrMsg));
        }
        permanentAddressId =
            addressRes.getOrElse(() => throw Exception(defErrMsg));
        currentAddressId = permanentAddressId;
      } else {
        final permanent = await _createAddress(address, defErrMsg);
        if (permanent.isLeft()) {
          return left(Failure.apiFailure(defErrMsg));
        }
        permanentAddressId =
            permanent.getOrElse(() => throw Exception(defErrMsg));

        final current = await _createAddress(currentAddress, defErrMsg);
        if (current.isLeft()) {
          return left(Failure.apiFailure(defErrMsg));
        }
        currentAddressId = current.getOrElse(() => throw Exception(defErrMsg));
      }
      await _updateLoanEntity(
        Entities.preEnquiry,
        json.encode({
          'data': {
            '_entityName': Entities.preEnquiry,
            'id': preEnqiuryId,
            'location': permanentAddressId,
            "currentaddress": currentAddressId,
            "iscurrentadd": permanentAddressId == currentAddressId,
          }
        }),
      );
      return right(true);
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> updateAddressInForm(
      String preEnqiuryId,
      String permanentAddressid,
      String currentAddressId) async {
    return await _updateLoanEntity(
      Entities.preEnquiry,
      json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': preEnqiuryId,
          'location': permanentAddressid,
          "currentaddress": currentAddressId,
          "iscurrentadd": permanentAddressid == currentAddressId,
        }
      }),
    );
  }

  Future<Either<Failure, String>> _createAddress(
      CustomerAddress address, String defErrMsg) async {
    const url = "${Constants.baseDefaultApiUrl}/${Entities.location}";
    final reqBody = json.encode({
      'data': {
        "addressLine1": address.addressLine1,
        "addressLine2": address.addressLine2,
        "cityName": address.cityName,
        "postalCode": address.postalCode,
        "country": Constants.indiaCountryCode,
        "region": address.stateName,
      }
    });

    final data = await api.post(url, reqBody, defErrMsg);
    return await data.fold(
      (l) => left(l),
      (r) async {
        final res = r[0] as Map<String, dynamic>;
        final locationId = res['id'] as String;
        return right(locationId);
      },
    );
  }

  @override
  Future<Either<Failure, List<Simple>>> fetchStates(String countryCode) async {
    const defErrMsg = 'Could not fetch states';
    try {
      final url =
          "${Constants.baseDefaultApiUrl}/${Entities.region}?_where=country='$countryCode'&"
          "_sortBy=name&_selectedProperties=id,name";
      final result = await api.get(url, defErrMsg);
      return result.fold(
        (l) => left(l),
        (r) {
          final statesList = r
              .map((e) => Simple(
                    id: e['id'],
                    title: e['name'],
                  ))
              .toList();
          return right(statesList);
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, bool>> checkIfPincodeIsOnHold(String pincode) async {
    const String defErrMsg = "Could not check if pincode is on hold";
    try {
      const String url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.pincodeHoldCheck}";
      final reqBody = json.encode({'pincode': pincode});
      final data = await api.loanApiPost(url, reqBody, defErrMsg,
          isCustomLoanApi: false);
      return data.fold(
        (l) => left(l),
        (r) => right(
          r.isEmpty ? false : r[0]['ishold'] == true,
        ),
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  Future<Either<Failure, bool>> _hasAttachment(
      String recordId, String fileName, String entityName) async {
    const String defErrMsg = "Could not fetch attachment data";
    try {
      final String url =
          "${Constants.baseCustomApiUrl}/${CustomWebServices.attachmentWs}?entity_name=$entityName&name=$fileName&record_id=$recordId&selected=id,name";

      final data = await api.get(url, defErrMsg);
      return data.fold(
        (l) => left(l),
        (r) => right(r.isNotEmpty),
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> updatePreEnquiryStatus(
      String recordId, String status) async {
    return await _updateLoanEntity(
      Entities.preEnquiry,
      json.encode({
        'data': {
          '_entityName': Entities.preEnquiry,
          'id': recordId,
          'lDSApploanstatus': status,
        }
      }),
    );
  }

  @override
  Future<Either<Failure, OCRPan>> ocrPANValidation(PlatformFile file) async {
    const String errMessage = 'Cant able to fetch PAN details.';
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('ocrPanValidation');
      final filebytes = base64Encode(file.bytes!);
      final fbRes = await callable.call({'filedata': filebytes});
      final res = fbRes.data as Map<String, dynamic>;
      if (res.containsKey('response')) {
        final res1 = fbRes.data['response'] as Map<Object?, Object?>;
        Map<String, dynamic> newMap = {};
        res1.forEach((key, value) {
          if (key is String) {
            newMap[key] = value;
          }
        });
        final ocr = OCRPan.fromJson(newMap);
        return right(ocr);
      } else {
        final ocrdata = fbRes.data['error'] as Map<String, dynamic>;
        String msg = ocrdata['message'];
        return left(Failure.apiFailure(msg));
      }
    } catch (e, st) {
      logError(e, st, errMessage);
      return left(Failure.unknownApiFailure());
    }
  }

  @override
  Future<Either<Failure, Tuple2<bool, String?>>> validatePAN(
      String panNumber) async {
    const String defErrMsg = 'Could not validate PANNumber';
    try {
      final callable =
          FirebaseFunctions.instance.httpsCallable('panValidation');
      final fbRes = await callable.call({'pan': panNumber});
      if (fbRes.data['response']['status'] == 'VALID') {
        return right(Tuple2(true, fbRes.data['response']['full_name']));
      }
      return right(const Tuple2(false, null));
    } catch (e, st) {
      logError(e, st, defErrMsg);
      return left(Failure.unknownApiFailure());
    }
  }

  @override
  Future<Either<Failure, List<IdName>>> fetchBPartners(int start, int end,
      {String? query}) async {
    const defErrMsg = 'Could not fetch Business Partners';
    try {
      const url = '${Constants.baseDefaultApiUrl}/${Entities.bpartner}';
      const selectedProperties = "&_selectedProperties=id,name";
      String searchCondition = "?_where=  businessPartnerCategory.name='Agent'";
      if (query != null && query.trim().isNotEmpty) {
        searchCondition =
            '$searchCondition and lower(name) LIKE lower(\'%25${query.trim()}%25\')';
      }
      final url2 =
          '$url$searchCondition$selectedProperties&_startRow=$start&_endRow=$end';
      final res = await api.get(url2, defErrMsg);
      return res.fold(
        (l) => left(l),
        (r) {
          final bpartners = r.map((e) => IdName.fromJson(e)).toList();
          return right(bpartners);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, List<IdName>>> fetchBPartnerAddress(
      int start, int end, String bpid,
      {String? query}) async {
    const defErrMsg = 'Could not fetch Business Partners';
    try {
      const url = '${Constants.baseDefaultApiUrl}/${Entities.bpartnerAdd}';
      const selectedProperties = "&_selectedProperties=id,name";
      String searchCondition = "?_where= businessPartner.id='$bpid'";
      if (query != null && query.trim().isNotEmpty) {
        searchCondition =
            '$searchCondition and lower(name) LIKE lower(\'%25${query.trim()}%25\')';
      }
      final url2 =
          '$url$searchCondition$selectedProperties&_startRow=$start&_endRow=$end';
      final res = await api.get(url2, defErrMsg);
      return res.fold(
        (l) => left(l),
        (r) {
          final bpartners = r.map((e) => IdName.fromJson(e)).toList();
          return right(bpartners);
        },
      );
    } catch (e, st) {
      logError(e, st);
    }
    return left(Failure.apiFailure(defErrMsg));
  }

  @override
  Future<Either<Failure, PreEnquiryForm>> generateAndSendBSLink(
      String preenquiryid) async {
    const defErrMsg = 'can\'t able to generate Bank Statement.';
    try {
      const url =
          '${Constants.baseCustomApiUrl}/${CustomWebServices.generateBSLink}';
      final reqBody = jsonEncode({'pre-enquiryid': preenquiryid});
      final res = await api.post(url, reqBody, defErrMsg);
      return res.fold(
        (l) => left(l),
        (r) async {
          final formres =
              await _getLoanEntity(Entities.preEnquiry, "id='$preenquiryid'");
          return formres.fold(
            (l) => left(l),
            (form) => right(form),
          );
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.unknownApiFailure());
  }

  @override
  Future<Either<Failure, bool>> downloadBankStatement(
      String preenquiryid) async {
    const defErrMsg = 'can\'t able to generate Bank Statement.';
    try {
      final url =
          '${Constants.baseCustomApiUrl}/${CustomWebServices.downloadBankStatement}?pre-enquiryid=$preenquiryid';
      final res = await api.get(url, defErrMsg);
      return res.fold(
        (l) => left(l),
        (r) {
          final resjson = r.first as Map<String, dynamic>;
          if (resjson['Message'] == 'success') {
            return right(true);
          } else {
            return left(Failure.apiFailure(resjson['error']));
          }
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
    }
    return left(Failure.unknownApiFailure());
  }
}
