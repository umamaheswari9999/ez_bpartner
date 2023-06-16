import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pre_enquiry_form_dto.g.dart';

part 'pre_enquiry_form_dto.freezed.dart';

@freezed
class PreEnquiryFormDto
    with _$PreEnquiryFormDto, BaseDto<PreEnquiryFormDto, PreEnquiryForm> {
  const PreEnquiryFormDto._();

  const factory PreEnquiryFormDto({
    required String id,
    @JsonKey(name: 'customername') required String customerName,
    @JsonKey(name: 'prooftypenumber') String? poiNumber,
    @JsonKey(name: 'loanno') required String preEnquiryNumber,
    @JsonKey(name: 'dateofbirth') String? dob,
    @JsonKey(name: 'mobilenumber') String? mobileNumber,
    @JsonKey(name: 'bpagent') String? bpagent,
    @JsonKey(name: 'bpagent\$_identifier') String? bpagentName,
    @JsonKey(name: 'panno') String? pan,
    String? gender,
    @JsonKey(name: 'vkycrefno') String? vKycRefId,
    @JsonKey(name: 'maritalstatus') String? maritalStatus,
    @JsonKey(name: 'occupationtype') String? occupationType,
    @JsonKey(name: 'residentialstatus') String? residenceType,
    @JsonKey(name: 'alternatenumber') String? altMobileNumber,
    @JsonKey(name: 'fathername') String? fatherName,
    @JsonKey(name: 'mothername') String? motherName,
    @JsonKey(name: 'employername') String? employerName,
    @JsonKey(name: 'currentaddress') String? currentAddressId,
    @JsonKey(name: 'currentaddress\$_identifier', defaultValue: '') String? currentAddressName,
    @JsonKey(name: 'location') String? permanentAddressId,
    @JsonKey(name: 'location\$_identifier', defaultValue: '') String? permanentAddressName,
    @JsonKey(name: 'officephonenumber') int? officePhoneNumber,
    @JsonKey(name: 'emailid') String? emailId,
    @JsonKey(name: 'officialEmail') String? officialEmail,
    @JsonKey(name: 'designation') String? designation,
    @JsonKey(name: 'annualincome') double? annualIncome,
    @JsonKey(name: 'lDSApploanstatus') String? appLoanStatus,
    @JsonKey(name: 'lDSAgent') String? emiPlanId,
    @JsonKey(name: 'lDSAgent\$_identifier') String? emiPlanName,
    @JsonKey(name: 'loanamount') double? loanAmount,
    @JsonKey(name: 'cibillimit') double? cibilLimit,
    @JsonKey(name: 'emiamount') double? emiAmount,
    @JsonKey(name: 'mindownpayment') double? minDownPayment,
    @JsonKey(name: 'downpaymentcollected') double? downPaymentCollected,
    @JsonKey(name: 'advemi') double? advanceEmi,
    @JsonKey(name: 'anuintrate') double? annIntRate,
    @JsonKey(name: 'docchargesgst') double? docCharges,
    @JsonKey(name: 'processchargegst') double? processCharges,
    @JsonKey(name: 'esigndocumentid') String? eSignDocumentId,
    @JsonKey(name: 'esignurl') String? eSignUrl,
    @JsonKey(name: 'esignstatus') String? eSignStatus,
    @JsonKey(name: 'mandateid') String? eMandateId,
    @JsonKey(name: 'url') String? eMandateUrl,
    @JsonKey(name: 'enachstage') String? eMandateStage,
    @JsonKey(name: 'enachstatus') String? eMandateStatus,
    @JsonKey(name: 'bankdecision') String? bankDecision,
    @JsonKey(name: 'cibildecision') String? cibilDecision,
    @JsonKey(name: 'finaldecision') String? finalDecision,
    @JsonKey(name: 'loanpreapproved', defaultValue: false) required bool isPreApproved,
    @JsonKey(name: 'loandisburse', defaultValue: false) required bool isDisbursed,
    @JsonKey(name: 'loanrejected', defaultValue: false) required bool isRejected,
    @JsonKey(name: 'downloadcibil',defaultValue: false) bool? downloadcibil,
    String? ldsBsurl,
    @JsonKey(name: 'downloadBs',defaultValue: false)  bool? downloadBs,
    @JsonKey(defaultValue: 0) double? manualRegularlimit,
    String? manualFinaldecision,
  }) = _PreEnquiryFormDto;

  factory PreEnquiryFormDto.fromJson(Map<String, dynamic> json) =>
      _$PreEnquiryFormDtoFromJson(json);

  @override
  PreEnquiryFormDto fromJson(Map<String, dynamic> json) =>
      PreEnquiryFormDto.fromJson(json);

  @override
  PreEnquiryForm toDomain() {
    return PreEnquiryForm(
      id: id,
      customerName: customerName,
      poiNumber: poiNumber,
      preEnquiryNumber: preEnquiryNumber,
      dob: dob,
      pan: pan,
      mobileNumber: mobileNumber,
      gender: gender,
      vKycRefId: vKycRefId,
      appLoanStatus: appLoanStatus,
      loanAmount: loanAmount,
      bpagent: bpagent,
      bpagentName: bpagentName,
      emiPlanId: emiPlanId,
      emiPlanName: emiPlanName,
      emiAmount: emiAmount,
      minDownPayment: minDownPayment,
      downPaymentCollected: downPaymentCollected,
      advanceEmi: advanceEmi,
      annIntRate: annIntRate,
      docCharges: docCharges,
      processCharges: processCharges,
      eSignDocumentId: eSignDocumentId,
      eSignUrl: eSignUrl,
      eSignStatus: eSignStatus,
      eMandateId: eMandateId,
      eMandateUrl: eMandateUrl,
      eMandateStage: eMandateStage,
      eMandateStatus: eMandateStatus,
      bankDecision: bankDecision,
      cibilDecision: cibilDecision,
      finalDecision: finalDecision,
      isPreApproved: isPreApproved,
      isDisbursed: isDisbursed,
      isRejected: isRejected,
      cibilLimit: cibilLimit,
      maritalStatus: maritalStatus,
      altMobileNumber: altMobileNumber,
      annualIncome: annualIncome,
      designation: designation,
      employerName: employerName,
      fatherName: fatherName,
      motherName: motherName,
      occupationType: occupationType,
      officePhoneNumber: officePhoneNumber,
      officialEmail: officialEmail,
      residenceType: residenceType,
      email: emailId,
      currentAddressId: currentAddressId,
      currentAddressName: currentAddressName,
      permanentAddressId: permanentAddressId,
      permanentAddressName: permanentAddressName,
      ldsBsurl: ldsBsurl,
      downloadcibil: downloadcibil,
      downloadBs: downloadBs,
      manualFinaldecision: manualFinaldecision,
      manualRegularlimit: manualRegularlimit,
    );
  }
}