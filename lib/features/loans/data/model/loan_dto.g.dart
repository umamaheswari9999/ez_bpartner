// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoanDto _$$_LoanDtoFromJson(Map<String, dynamic> json) => _$_LoanDto(
      id: json['id'] as String,
      loanNo: json['loanno'] as String,
      customerName: json['customername'] as String? ?? '',
      mobileNumber: json['mobilenumber'] as String?,
      proofTypeNumber: json['prooftypenumber'] as String?,
      loanAmount: (json['loanamount'] as num?)?.toDouble() ?? 0,
      isPreApproved: json['loanpreapproved'] as bool? ?? false,
      isDisbursed: json['loandisburse'] as bool? ?? false,
      isRejected: json['loanrejected'] as bool? ?? false,
      createdAt: json['creationDate'] as String,
      rejectReason: json['rejectreason'] as String?,
      appLoanStatus: json['lDSApploanstatus'] as String?,
    );

Map<String, dynamic> _$$_LoanDtoToJson(_$_LoanDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loanno': instance.loanNo,
      'customername': instance.customerName,
      'mobilenumber': instance.mobileNumber,
      'prooftypenumber': instance.proofTypeNumber,
      'loanamount': instance.loanAmount,
      'loanpreapproved': instance.isPreApproved,
      'loandisburse': instance.isDisbursed,
      'loanrejected': instance.isRejected,
      'creationDate': instance.createdAt,
      'rejectreason': instance.rejectReason,
      'lDSApploanstatus': instance.appLoanStatus,
    };
