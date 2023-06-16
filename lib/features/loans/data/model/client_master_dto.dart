import 'package:ez_flutter/features/loans/domain/entity/client_master.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_master_dto.g.dart';

part 'client_master_dto.freezed.dart';

@freezed
class ClientMasterDto
    with _$ClientMasterDto, BaseDto<ClientMasterDto, ClientMaster> {
  const ClientMasterDto._();

  const factory ClientMasterDto({
    required String id,
    @JsonKey(name: 'lDSName',defaultValue: '') required String name,
    @JsonKey(name: 'referenceid') required String referenceId,
    @JsonKey(name: 'aadhaarnumber') String? aadharNumber,
    @JsonKey(name: 'lDSPanno') String? panNumber,
    @JsonKey(name: 'phone') String? mobile,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'lDSAlternativeno') String? altMobile,
    @JsonKey(name: 'dateofbirth') String? dob,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'lDSNameonpan') String? nameOnPan,
    @JsonKey(name: 'fathername') String? fatherName,
    @JsonKey(name: 'mothername') String? motherName,
    @JsonKey(name: 'maritalstatus') String? maritalStatus,
    @JsonKey(name: 'occupationtype') String? occupationStatus,
    @JsonKey(name: 'citizenship') String? citizenship,
    @JsonKey(name: 'typeofresidence') String? residenceType,
    @JsonKey(name: 'lDSEmployeename') String? employeeName,
    @JsonKey(name: 'lDSAddress') String? employeeAddress,
    @JsonKey(name: 'lDSOfficephoneno') String? officePhoneNumber,
    @JsonKey(name: 'officialemailid') String? officeEmailId,
    @JsonKey(name: 'designation') String? designation,
    @JsonKey(name: 'monthlyincome') int? annualIncome,
    @JsonKey(name: 'lDSConsentCreatedby') String? consentCreatedBy,
    @JsonKey(name: 'consentCreatedOn') String? consentCreatedOn,
    @JsonKey(name: 'lDSVerifiedOtp') int? verifiedOtp,
    @JsonKey(name: 'lDSConsentAprovedip') String? consentApprovedIp,
    @JsonKey(name: 'lDSConsentBrowserUsed') String? consentBrowserUsed,
    @JsonKey(name: 'lDSConsentApproved', defaultValue: false) required bool consentApproved,
    @JsonKey(name: 'lDSConsentCibilCheck', defaultValue: false) required bool consentCibilCheck,
    @JsonKey(name: 'lDSTermsAgree', defaultValue: false) required bool termsAgree,
    @JsonKey(name: 'lDSConsentCkycCheck', defaultValue: false) required bool consentKycCheck,
    @JsonKey(name: 'lDSCkycno') String? ckycNo,
    @JsonKey(name: 'lDSCkycKycdate') String? ckycDate,
    @JsonKey(name: 'lDSCkycupdated') String? ckycUpdated,
  }) = _ClientMasterDto;

  factory ClientMasterDto.fromJson(Map<String, dynamic> json) =>
      _$ClientMasterDtoFromJson(json);

  @override
  ClientMasterDto fromJson(Map<String, dynamic> json) =>
      ClientMasterDto.fromJson(json);

  @override
  ClientMaster toDomain() {
    return ClientMaster(
      id: id,
      name: name,
      referenceId: referenceId,
      aadharNumber: aadharNumber,
      panNumber: panNumber,
      mobile: mobile,
      email: email,
      dob: dob,
      gender: gender,
      nameOnPan: nameOnPan,
      fatherName: fatherName,
      motherName: motherName,
      maritalStatus: maritalStatus,
      occupationStatus: occupationStatus,
      citizenship: citizenship,
      residenceType: residenceType,
      alternativeMobileNumber: altMobile,
      employeeName: employeeName,
      employeeAddress: employeeAddress,
      officeEmailId: officeEmailId,
      officePhoneNumber: officePhoneNumber,
      designation: designation,
      annualIncome: annualIncome,
      ckycDate: ckycDate,
      ckycNo: ckycNo,
      ckycUpdated: ckycUpdated,
      consentApproved: consentApproved,
      consentApprovedIp: consentApprovedIp,
      consentBrowserUsed: consentBrowserUsed,
      consentCibilCheck: consentCibilCheck,
      consentCreatedBy: consentCreatedBy,
      consentCreatedOn: consentCreatedOn,
      consentKycCheck: consentKycCheck,
      termsAgree: termsAgree,
      verifiedOtp: verifiedOtp,
    );
  }
}
