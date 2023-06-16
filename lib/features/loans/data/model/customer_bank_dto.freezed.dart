// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_bank_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerBankDto _$CustomerBankDtoFromJson(Map<String, dynamic> json) {
  return _CustomerBankDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerBankDto {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankname\$_identifier')
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankname')
  String get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankbranch')
  String get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ifsccode')
  String get ifscCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'lDSAccountType')
  String get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountno', defaultValue: '')
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'applicantname', defaultValue: '')
  String get nameOnBankAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isvalidated', defaultValue: false)
  bool get isValidated => throw _privateConstructorUsedError;
  @JsonKey(name: 'micr')
  int? get micrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankvalidationBy')
  String? get validatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerBankDtoCopyWith<CustomerBankDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerBankDtoCopyWith<$Res> {
  factory $CustomerBankDtoCopyWith(
          CustomerBankDto value, $Res Function(CustomerBankDto) then) =
      _$CustomerBankDtoCopyWithImpl<$Res, CustomerBankDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'bankname\$_identifier')
          String bankName,
      @JsonKey(name: 'bankname')
          String bankId,
      @JsonKey(name: 'bankbranch')
          String branchName,
      @JsonKey(name: 'ifsccode')
          String ifscCode,
      @JsonKey(name: 'lDSAccountType')
          String accountType,
      @JsonKey(name: 'accountno', defaultValue: '')
          String accountNumber,
      @JsonKey(name: 'applicantname', defaultValue: '')
          String nameOnBankAccount,
      @JsonKey(name: 'isvalidated', defaultValue: false)
          bool isValidated,
      @JsonKey(name: 'micr')
          int? micrCode,
      @JsonKey(name: 'bankvalidationBy')
          String? validatedBy});
}

/// @nodoc
class _$CustomerBankDtoCopyWithImpl<$Res, $Val extends CustomerBankDto>
    implements $CustomerBankDtoCopyWith<$Res> {
  _$CustomerBankDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankName = null,
    Object? bankId = null,
    Object? branchName = null,
    Object? ifscCode = null,
    Object? accountType = null,
    Object? accountNumber = null,
    Object? nameOnBankAccount = null,
    Object? isValidated = null,
    Object? micrCode = freezed,
    Object? validatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nameOnBankAccount: null == nameOnBankAccount
          ? _value.nameOnBankAccount
          : nameOnBankAccount // ignore: cast_nullable_to_non_nullable
              as String,
      isValidated: null == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      micrCode: freezed == micrCode
          ? _value.micrCode
          : micrCode // ignore: cast_nullable_to_non_nullable
              as int?,
      validatedBy: freezed == validatedBy
          ? _value.validatedBy
          : validatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerBankDtoCopyWith<$Res>
    implements $CustomerBankDtoCopyWith<$Res> {
  factory _$$_CustomerBankDtoCopyWith(
          _$_CustomerBankDto value, $Res Function(_$_CustomerBankDto) then) =
      __$$_CustomerBankDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'bankname\$_identifier')
          String bankName,
      @JsonKey(name: 'bankname')
          String bankId,
      @JsonKey(name: 'bankbranch')
          String branchName,
      @JsonKey(name: 'ifsccode')
          String ifscCode,
      @JsonKey(name: 'lDSAccountType')
          String accountType,
      @JsonKey(name: 'accountno', defaultValue: '')
          String accountNumber,
      @JsonKey(name: 'applicantname', defaultValue: '')
          String nameOnBankAccount,
      @JsonKey(name: 'isvalidated', defaultValue: false)
          bool isValidated,
      @JsonKey(name: 'micr')
          int? micrCode,
      @JsonKey(name: 'bankvalidationBy')
          String? validatedBy});
}

/// @nodoc
class __$$_CustomerBankDtoCopyWithImpl<$Res>
    extends _$CustomerBankDtoCopyWithImpl<$Res, _$_CustomerBankDto>
    implements _$$_CustomerBankDtoCopyWith<$Res> {
  __$$_CustomerBankDtoCopyWithImpl(
      _$_CustomerBankDto _value, $Res Function(_$_CustomerBankDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankName = null,
    Object? bankId = null,
    Object? branchName = null,
    Object? ifscCode = null,
    Object? accountType = null,
    Object? accountNumber = null,
    Object? nameOnBankAccount = null,
    Object? isValidated = null,
    Object? micrCode = freezed,
    Object? validatedBy = freezed,
  }) {
    return _then(_$_CustomerBankDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nameOnBankAccount: null == nameOnBankAccount
          ? _value.nameOnBankAccount
          : nameOnBankAccount // ignore: cast_nullable_to_non_nullable
              as String,
      isValidated: null == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      micrCode: freezed == micrCode
          ? _value.micrCode
          : micrCode // ignore: cast_nullable_to_non_nullable
              as int?,
      validatedBy: freezed == validatedBy
          ? _value.validatedBy
          : validatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerBankDto extends _CustomerBankDto {
  const _$_CustomerBankDto(
      {@JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'bankname\$_identifier')
          required this.bankName,
      @JsonKey(name: 'bankname')
          required this.bankId,
      @JsonKey(name: 'bankbranch')
          required this.branchName,
      @JsonKey(name: 'ifsccode')
          required this.ifscCode,
      @JsonKey(name: 'lDSAccountType')
          required this.accountType,
      @JsonKey(name: 'accountno', defaultValue: '')
          required this.accountNumber,
      @JsonKey(name: 'applicantname', defaultValue: '')
          required this.nameOnBankAccount,
      @JsonKey(name: 'isvalidated', defaultValue: false)
          required this.isValidated,
      @JsonKey(name: 'micr')
          this.micrCode,
      @JsonKey(name: 'bankvalidationBy')
          this.validatedBy})
      : super._();

  factory _$_CustomerBankDto.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerBankDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'bankname\$_identifier')
  final String bankName;
  @override
  @JsonKey(name: 'bankname')
  final String bankId;
  @override
  @JsonKey(name: 'bankbranch')
  final String branchName;
  @override
  @JsonKey(name: 'ifsccode')
  final String ifscCode;
  @override
  @JsonKey(name: 'lDSAccountType')
  final String accountType;
  @override
  @JsonKey(name: 'accountno', defaultValue: '')
  final String accountNumber;
  @override
  @JsonKey(name: 'applicantname', defaultValue: '')
  final String nameOnBankAccount;
  @override
  @JsonKey(name: 'isvalidated', defaultValue: false)
  final bool isValidated;
  @override
  @JsonKey(name: 'micr')
  final int? micrCode;
  @override
  @JsonKey(name: 'bankvalidationBy')
  final String? validatedBy;

  @override
  String toString() {
    return 'CustomerBankDto(id: $id, bankName: $bankName, bankId: $bankId, branchName: $branchName, ifscCode: $ifscCode, accountType: $accountType, accountNumber: $accountNumber, nameOnBankAccount: $nameOnBankAccount, isValidated: $isValidated, micrCode: $micrCode, validatedBy: $validatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerBankDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.nameOnBankAccount, nameOnBankAccount) ||
                other.nameOnBankAccount == nameOnBankAccount) &&
            (identical(other.isValidated, isValidated) ||
                other.isValidated == isValidated) &&
            (identical(other.micrCode, micrCode) ||
                other.micrCode == micrCode) &&
            (identical(other.validatedBy, validatedBy) ||
                other.validatedBy == validatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bankName,
      bankId,
      branchName,
      ifscCode,
      accountType,
      accountNumber,
      nameOnBankAccount,
      isValidated,
      micrCode,
      validatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerBankDtoCopyWith<_$_CustomerBankDto> get copyWith =>
      __$$_CustomerBankDtoCopyWithImpl<_$_CustomerBankDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerBankDtoToJson(
      this,
    );
  }
}

abstract class _CustomerBankDto extends CustomerBankDto {
  const factory _CustomerBankDto(
      {@JsonKey(name: 'id')
          required final String id,
      @JsonKey(name: 'bankname\$_identifier')
          required final String bankName,
      @JsonKey(name: 'bankname')
          required final String bankId,
      @JsonKey(name: 'bankbranch')
          required final String branchName,
      @JsonKey(name: 'ifsccode')
          required final String ifscCode,
      @JsonKey(name: 'lDSAccountType')
          required final String accountType,
      @JsonKey(name: 'accountno', defaultValue: '')
          required final String accountNumber,
      @JsonKey(name: 'applicantname', defaultValue: '')
          required final String nameOnBankAccount,
      @JsonKey(name: 'isvalidated', defaultValue: false)
          required final bool isValidated,
      @JsonKey(name: 'micr')
          final int? micrCode,
      @JsonKey(name: 'bankvalidationBy')
          final String? validatedBy}) = _$_CustomerBankDto;
  const _CustomerBankDto._() : super._();

  factory _CustomerBankDto.fromJson(Map<String, dynamic> json) =
      _$_CustomerBankDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'bankname\$_identifier')
  String get bankName;
  @override
  @JsonKey(name: 'bankname')
  String get bankId;
  @override
  @JsonKey(name: 'bankbranch')
  String get branchName;
  @override
  @JsonKey(name: 'ifsccode')
  String get ifscCode;
  @override
  @JsonKey(name: 'lDSAccountType')
  String get accountType;
  @override
  @JsonKey(name: 'accountno', defaultValue: '')
  String get accountNumber;
  @override
  @JsonKey(name: 'applicantname', defaultValue: '')
  String get nameOnBankAccount;
  @override
  @JsonKey(name: 'isvalidated', defaultValue: false)
  bool get isValidated;
  @override
  @JsonKey(name: 'micr')
  int? get micrCode;
  @override
  @JsonKey(name: 'bankvalidationBy')
  String? get validatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerBankDtoCopyWith<_$_CustomerBankDto> get copyWith =>
      throw _privateConstructorUsedError;
}
