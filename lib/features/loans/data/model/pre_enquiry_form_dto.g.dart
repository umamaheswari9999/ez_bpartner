// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_enquiry_form_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PreEnquiryFormDto _$$_PreEnquiryFormDtoFromJson(Map<String, dynamic> json) =>
    _$_PreEnquiryFormDto(
      id: json['id'] as String,
      customerName: json['customername'] as String,
      poiNumber: json['prooftypenumber'] as String?,
      preEnquiryNumber: json['loanno'] as String,
      dob: json['dateofbirth'] as String?,
      mobileNumber: json['mobilenumber'] as String?,
      bpagent: json['bpagent'] as String?,
      bpagentName: json[r'bpagent$_identifier'] as String?,
      pan: json['panno'] as String?,
      gender: json['gender'] as String?,
      vKycRefId: json['vkycrefno'] as String?,
      maritalStatus: json['maritalstatus'] as String?,
      occupationType: json['occupationtype'] as String?,
      residenceType: json['residentialstatus'] as String?,
      altMobileNumber: json['alternatenumber'] as String?,
      fatherName: json['fathername'] as String?,
      motherName: json['mothername'] as String?,
      employerName: json['employername'] as String?,
      currentAddressId: json['currentaddress'] as String?,
      currentAddressName: json[r'currentaddress$_identifier'] as String? ?? '',
      permanentAddressId: json['location'] as String?,
      permanentAddressName: json[r'location$_identifier'] as String? ?? '',
      officePhoneNumber: json['officephonenumber'] as int?,
      emailId: json['emailid'] as String?,
      officialEmail: json['officialEmail'] as String?,
      designation: json['designation'] as String?,
      annualIncome: (json['annualincome'] as num?)?.toDouble(),
      appLoanStatus: json['lDSApploanstatus'] as String?,
      emiPlanId: json['lDSAgent'] as String?,
      emiPlanName: json[r'lDSAgent$_identifier'] as String?,
      loanAmount: (json['loanamount'] as num?)?.toDouble(),
      cibilLimit: (json['cibillimit'] as num?)?.toDouble(),
      emiAmount: (json['emiamount'] as num?)?.toDouble(),
      minDownPayment: (json['mindownpayment'] as num?)?.toDouble(),
      downPaymentCollected: (json['downpaymentcollected'] as num?)?.toDouble(),
      advanceEmi: (json['advemi'] as num?)?.toDouble(),
      annIntRate: (json['anuintrate'] as num?)?.toDouble(),
      docCharges: (json['docchargesgst'] as num?)?.toDouble(),
      processCharges: (json['processchargegst'] as num?)?.toDouble(),
      eSignDocumentId: json['esigndocumentid'] as String?,
      eSignUrl: json['esignurl'] as String?,
      eSignStatus: json['esignstatus'] as String?,
      eMandateId: json['mandateid'] as String?,
      eMandateUrl: json['url'] as String?,
      eMandateStage: json['enachstage'] as String?,
      eMandateStatus: json['enachstatus'] as String?,
      bankDecision: json['bankdecision'] as String?,
      cibilDecision: json['cibildecision'] as String?,
      finalDecision: json['finaldecision'] as String?,
      isPreApproved: json['loanpreapproved'] as bool? ?? false,
      isDisbursed: json['loandisburse'] as bool? ?? false,
      isRejected: json['loanrejected'] as bool? ?? false,
      downloadcibil: json['downloadcibil'] as bool? ?? false,
      ldsBsurl: json['ldsBsurl'] as String?,
      downloadBs: json['downloadBs'] as bool? ?? false,
      manualRegularlimit: (json['manualRegularlimit'] as num?)?.toDouble() ?? 0,
      manualFinaldecision: json['manualFinaldecision'] as String?,
    );

Map<String, dynamic> _$$_PreEnquiryFormDtoToJson(
        _$_PreEnquiryFormDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customername': instance.customerName,
      'prooftypenumber': instance.poiNumber,
      'loanno': instance.preEnquiryNumber,
      'dateofbirth': instance.dob,
      'mobilenumber': instance.mobileNumber,
      'bpagent': instance.bpagent,
      r'bpagent$_identifier': instance.bpagentName,
      'panno': instance.pan,
      'gender': instance.gender,
      'vkycrefno': instance.vKycRefId,
      'maritalstatus': instance.maritalStatus,
      'occupationtype': instance.occupationType,
      'residentialstatus': instance.residenceType,
      'alternatenumber': instance.altMobileNumber,
      'fathername': instance.fatherName,
      'mothername': instance.motherName,
      'employername': instance.employerName,
      'currentaddress': instance.currentAddressId,
      r'currentaddress$_identifier': instance.currentAddressName,
      'location': instance.permanentAddressId,
      r'location$_identifier': instance.permanentAddressName,
      'officephonenumber': instance.officePhoneNumber,
      'emailid': instance.emailId,
      'officialEmail': instance.officialEmail,
      'designation': instance.designation,
      'annualincome': instance.annualIncome,
      'lDSApploanstatus': instance.appLoanStatus,
      'lDSAgent': instance.emiPlanId,
      r'lDSAgent$_identifier': instance.emiPlanName,
      'loanamount': instance.loanAmount,
      'cibillimit': instance.cibilLimit,
      'emiamount': instance.emiAmount,
      'mindownpayment': instance.minDownPayment,
      'downpaymentcollected': instance.downPaymentCollected,
      'advemi': instance.advanceEmi,
      'anuintrate': instance.annIntRate,
      'docchargesgst': instance.docCharges,
      'processchargegst': instance.processCharges,
      'esigndocumentid': instance.eSignDocumentId,
      'esignurl': instance.eSignUrl,
      'esignstatus': instance.eSignStatus,
      'mandateid': instance.eMandateId,
      'url': instance.eMandateUrl,
      'enachstage': instance.eMandateStage,
      'enachstatus': instance.eMandateStatus,
      'bankdecision': instance.bankDecision,
      'cibildecision': instance.cibilDecision,
      'finaldecision': instance.finalDecision,
      'loanpreapproved': instance.isPreApproved,
      'loandisburse': instance.isDisbursed,
      'loanrejected': instance.isRejected,
      'downloadcibil': instance.downloadcibil,
      'ldsBsurl': instance.ldsBsurl,
      'downloadBs': instance.downloadBs,
      'manualRegularlimit': instance.manualRegularlimit,
      'manualFinaldecision': instance.manualFinaldecision,
    };
