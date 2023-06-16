import 'package:ez_flutter/features/loans/domain/entity/loan_status.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_filters.freezed.dart';

@freezed
class LoanFilters with _$LoanFilters {
  const factory LoanFilters({
    String? searchQuery,
    LoanStatus? status,
    DateTime? fromDate,
    DateTime? toDate,
    IdName? bpAddressId,
    IdName? bpId,
}) = _LoanFilters;
}