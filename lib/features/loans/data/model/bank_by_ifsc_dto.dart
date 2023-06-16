import 'package:ez_flutter/features/loans/domain/entity/bank_by_ifsc.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_by_ifsc_dto.g.dart';

part 'bank_by_ifsc_dto.freezed.dart';

@freezed
class BankByIfscDto with _$BankByIfscDto, BaseDto<BankByIfscDto, BankByIfsc> {
  const BankByIfscDto._();

  const factory BankByIfscDto({
    @JsonKey(name: 'inpifsccode') required String ifscCode,
    @JsonKey(name: 'inpbankbranch') required String bankBranchName,
    @JsonKey(name: 'inpbanknameId') required String bankBranchId,
    @JsonKey(name: 'inpmicr') required String micr,
  }) = _BankByIfscDto;

  factory BankByIfscDto.fromJson(Map<String, dynamic> json) =>
      _$BankByIfscDtoFromJson(json);

  @override
  BankByIfscDto fromJson(Map<String, dynamic> json) =>
      BankByIfscDto.fromJson(json);

  @override
  BankByIfsc toDomain() {
    return BankByIfsc(
      ifscCode: ifscCode,
      bankBranchName: bankBranchName,
      bankBranchId: bankBranchId,
      micr: micr,
    );
  }
}
