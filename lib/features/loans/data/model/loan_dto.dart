import 'package:ez_flutter/features/loans/domain/entity/loan.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_dto.g.dart';

part 'loan_dto.freezed.dart';

@freezed
class LoanDto with _$LoanDto, BaseDto<LoanDto, Loan> {
  const LoanDto._();

  const factory LoanDto({
    required String id,
    @JsonKey(name: 'loanno') required String loanNo,
    @JsonKey(name: 'customername', defaultValue: '') required String customerName,
    @JsonKey(name: 'mobilenumber') String? mobileNumber,
    @JsonKey(name: 'prooftypenumber') String? proofTypeNumber,
    @JsonKey(name: 'loanamount', defaultValue: 0) required double loanAmount,
    @JsonKey(name: 'loanpreapproved', defaultValue: false) required bool isPreApproved,
    @JsonKey(name: 'loandisburse', defaultValue: false) required bool isDisbursed,
    @JsonKey(name: 'loanrejected', defaultValue: false) required bool isRejected,
    @JsonKey(name: 'creationDate') required String createdAt,
    @JsonKey(name: 'rejectreason') String? rejectReason,
    @JsonKey(name: 'lDSApploanstatus') String? appLoanStatus,
  }) = _LoanDto;

  factory LoanDto.fromJson(Map<String, dynamic> json) =>
      _$LoanDtoFromJson(json);

  @override
  LoanDto fromJson(Map<String, dynamic> json) => LoanDto.fromJson(json);

  @override
  Loan toDomain() {
    return Loan(
      id: id,
      loanNo: loanNo,
      customerName: customerName,
      mobileNumber: mobileNumber,
      proofTypeNumber: proofTypeNumber,
      loanAmount: loanAmount,
      isPreApproved: isPreApproved,
      isDisbursed: isDisbursed,
      isRejected: isRejected,
      createdAt: createdAt,
      rejectReason: rejectReason,
      appLoanStatus: appLoanStatus,
    );
  }
}