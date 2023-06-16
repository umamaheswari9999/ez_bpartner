import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_master.freezed.dart';

@freezed
class ClientMaster with _$ClientMaster {
  const factory ClientMaster({
    required String id,
    required String name,
    required String referenceId,
    String? aadharNumber,
    String? panNumber,
    String? mobile,
    String? email,
    String? alternativeMobileNumber,
    String? dob,
    String? gender,
    String? nameOnPan,
    String? fatherName,
    String? motherName,
    String? maritalStatus,
    String? occupationStatus,
    String? citizenship,
    String? residenceType,
    String? employeeName,
    String? employeeAddress,
    String? officePhoneNumber,
    String? officeEmailId,
    String? designation,
    int? annualIncome,
    String? consentCreatedBy,
    String? consentCreatedOn,
    int? verifiedOtp,
    String? consentApprovedIp,
    String? consentBrowserUsed,
    required bool consentApproved,
    required bool consentCibilCheck,
    required bool termsAgree,
    required bool consentKycCheck,
    String? ckycNo,
    String? ckycDate,
    String? ckycUpdated
  }) = _ClientMaster;
}