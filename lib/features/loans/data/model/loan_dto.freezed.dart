// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoanDto _$LoanDtoFromJson(Map<String, dynamic> json) {
  return _LoanDto.fromJson(json);
}

/// @nodoc
mixin _$LoanDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'loanno')
  String get loanNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'customername', defaultValue: '')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobilenumber')
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'prooftypenumber')
  String? get proofTypeNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'loanamount', defaultValue: 0)
  double get loanAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'loanpreapproved', defaultValue: false)
  bool get isPreApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'loandisburse', defaultValue: false)
  bool get isDisbursed => throw _privateConstructorUsedError;
  @JsonKey(name: 'loanrejected', defaultValue: false)
  bool get isRejected => throw _privateConstructorUsedError;
  @JsonKey(name: 'creationDate')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejectreason')
  String? get rejectReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'lDSApploanstatus')
  String? get appLoanStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoanDtoCopyWith<LoanDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanDtoCopyWith<$Res> {
  factory $LoanDtoCopyWith(LoanDto value, $Res Function(LoanDto) then) =
      _$LoanDtoCopyWithImpl<$Res, LoanDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'loanno') String loanNo,
      @JsonKey(name: 'customername', defaultValue: '') String customerName,
      @JsonKey(name: 'mobilenumber') String? mobileNumber,
      @JsonKey(name: 'prooftypenumber') String? proofTypeNumber,
      @JsonKey(name: 'loanamount', defaultValue: 0) double loanAmount,
      @JsonKey(name: 'loanpreapproved', defaultValue: false) bool isPreApproved,
      @JsonKey(name: 'loandisburse', defaultValue: false) bool isDisbursed,
      @JsonKey(name: 'loanrejected', defaultValue: false) bool isRejected,
      @JsonKey(name: 'creationDate') String createdAt,
      @JsonKey(name: 'rejectreason') String? rejectReason,
      @JsonKey(name: 'lDSApploanstatus') String? appLoanStatus});
}

/// @nodoc
class _$LoanDtoCopyWithImpl<$Res, $Val extends LoanDto>
    implements $LoanDtoCopyWith<$Res> {
  _$LoanDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? loanNo = null,
    Object? customerName = null,
    Object? mobileNumber = freezed,
    Object? proofTypeNumber = freezed,
    Object? loanAmount = null,
    Object? isPreApproved = null,
    Object? isDisbursed = null,
    Object? isRejected = null,
    Object? createdAt = null,
    Object? rejectReason = freezed,
    Object? appLoanStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      loanNo: null == loanNo
          ? _value.loanNo
          : loanNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      proofTypeNumber: freezed == proofTypeNumber
          ? _value.proofTypeNumber
          : proofTypeNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isPreApproved: null == isPreApproved
          ? _value.isPreApproved
          : isPreApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisbursed: null == isDisbursed
          ? _value.isDisbursed
          : isDisbursed // ignore: cast_nullable_to_non_nullable
              as bool,
      isRejected: null == isRejected
          ? _value.isRejected
          : isRejected // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      appLoanStatus: freezed == appLoanStatus
          ? _value.appLoanStatus
          : appLoanStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoanDtoCopyWith<$Res> implements $LoanDtoCopyWith<$Res> {
  factory _$$_LoanDtoCopyWith(
          _$_LoanDto value, $Res Function(_$_LoanDto) then) =
      __$$_LoanDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'loanno') String loanNo,
      @JsonKey(name: 'customername', defaultValue: '') String customerName,
      @JsonKey(name: 'mobilenumber') String? mobileNumber,
      @JsonKey(name: 'prooftypenumber') String? proofTypeNumber,
      @JsonKey(name: 'loanamount', defaultValue: 0) double loanAmount,
      @JsonKey(name: 'loanpreapproved', defaultValue: false) bool isPreApproved,
      @JsonKey(name: 'loandisburse', defaultValue: false) bool isDisbursed,
      @JsonKey(name: 'loanrejected', defaultValue: false) bool isRejected,
      @JsonKey(name: 'creationDate') String createdAt,
      @JsonKey(name: 'rejectreason') String? rejectReason,
      @JsonKey(name: 'lDSApploanstatus') String? appLoanStatus});
}

/// @nodoc
class __$$_LoanDtoCopyWithImpl<$Res>
    extends _$LoanDtoCopyWithImpl<$Res, _$_LoanDto>
    implements _$$_LoanDtoCopyWith<$Res> {
  __$$_LoanDtoCopyWithImpl(_$_LoanDto _value, $Res Function(_$_LoanDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? loanNo = null,
    Object? customerName = null,
    Object? mobileNumber = freezed,
    Object? proofTypeNumber = freezed,
    Object? loanAmount = null,
    Object? isPreApproved = null,
    Object? isDisbursed = null,
    Object? isRejected = null,
    Object? createdAt = null,
    Object? rejectReason = freezed,
    Object? appLoanStatus = freezed,
  }) {
    return _then(_$_LoanDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      loanNo: null == loanNo
          ? _value.loanNo
          : loanNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      proofTypeNumber: freezed == proofTypeNumber
          ? _value.proofTypeNumber
          : proofTypeNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isPreApproved: null == isPreApproved
          ? _value.isPreApproved
          : isPreApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisbursed: null == isDisbursed
          ? _value.isDisbursed
          : isDisbursed // ignore: cast_nullable_to_non_nullable
              as bool,
      isRejected: null == isRejected
          ? _value.isRejected
          : isRejected // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      appLoanStatus: freezed == appLoanStatus
          ? _value.appLoanStatus
          : appLoanStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoanDto extends _LoanDto {
  const _$_LoanDto(
      {required this.id,
      @JsonKey(name: 'loanno')
          required this.loanNo,
      @JsonKey(name: 'customername', defaultValue: '')
          required this.customerName,
      @JsonKey(name: 'mobilenumber')
          this.mobileNumber,
      @JsonKey(name: 'prooftypenumber')
          this.proofTypeNumber,
      @JsonKey(name: 'loanamount', defaultValue: 0)
          required this.loanAmount,
      @JsonKey(name: 'loanpreapproved', defaultValue: false)
          required this.isPreApproved,
      @JsonKey(name: 'loandisburse', defaultValue: false)
          required this.isDisbursed,
      @JsonKey(name: 'loanrejected', defaultValue: false)
          required this.isRejected,
      @JsonKey(name: 'creationDate')
          required this.createdAt,
      @JsonKey(name: 'rejectreason')
          this.rejectReason,
      @JsonKey(name: 'lDSApploanstatus')
          this.appLoanStatus})
      : super._();

  factory _$_LoanDto.fromJson(Map<String, dynamic> json) =>
      _$$_LoanDtoFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'loanno')
  final String loanNo;
  @override
  @JsonKey(name: 'customername', defaultValue: '')
  final String customerName;
  @override
  @JsonKey(name: 'mobilenumber')
  final String? mobileNumber;
  @override
  @JsonKey(name: 'prooftypenumber')
  final String? proofTypeNumber;
  @override
  @JsonKey(name: 'loanamount', defaultValue: 0)
  final double loanAmount;
  @override
  @JsonKey(name: 'loanpreapproved', defaultValue: false)
  final bool isPreApproved;
  @override
  @JsonKey(name: 'loandisburse', defaultValue: false)
  final bool isDisbursed;
  @override
  @JsonKey(name: 'loanrejected', defaultValue: false)
  final bool isRejected;
  @override
  @JsonKey(name: 'creationDate')
  final String createdAt;
  @override
  @JsonKey(name: 'rejectreason')
  final String? rejectReason;
  @override
  @JsonKey(name: 'lDSApploanstatus')
  final String? appLoanStatus;

  @override
  String toString() {
    return 'LoanDto(id: $id, loanNo: $loanNo, customerName: $customerName, mobileNumber: $mobileNumber, proofTypeNumber: $proofTypeNumber, loanAmount: $loanAmount, isPreApproved: $isPreApproved, isDisbursed: $isDisbursed, isRejected: $isRejected, createdAt: $createdAt, rejectReason: $rejectReason, appLoanStatus: $appLoanStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoanDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.loanNo, loanNo) || other.loanNo == loanNo) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.proofTypeNumber, proofTypeNumber) ||
                other.proofTypeNumber == proofTypeNumber) &&
            (identical(other.loanAmount, loanAmount) ||
                other.loanAmount == loanAmount) &&
            (identical(other.isPreApproved, isPreApproved) ||
                other.isPreApproved == isPreApproved) &&
            (identical(other.isDisbursed, isDisbursed) ||
                other.isDisbursed == isDisbursed) &&
            (identical(other.isRejected, isRejected) ||
                other.isRejected == isRejected) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.appLoanStatus, appLoanStatus) ||
                other.appLoanStatus == appLoanStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      loanNo,
      customerName,
      mobileNumber,
      proofTypeNumber,
      loanAmount,
      isPreApproved,
      isDisbursed,
      isRejected,
      createdAt,
      rejectReason,
      appLoanStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoanDtoCopyWith<_$_LoanDto> get copyWith =>
      __$$_LoanDtoCopyWithImpl<_$_LoanDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoanDtoToJson(
      this,
    );
  }
}

abstract class _LoanDto extends LoanDto {
  const factory _LoanDto(
      {required final String id,
      @JsonKey(name: 'loanno')
          required final String loanNo,
      @JsonKey(name: 'customername', defaultValue: '')
          required final String customerName,
      @JsonKey(name: 'mobilenumber')
          final String? mobileNumber,
      @JsonKey(name: 'prooftypenumber')
          final String? proofTypeNumber,
      @JsonKey(name: 'loanamount', defaultValue: 0)
          required final double loanAmount,
      @JsonKey(name: 'loanpreapproved', defaultValue: false)
          required final bool isPreApproved,
      @JsonKey(name: 'loandisburse', defaultValue: false)
          required final bool isDisbursed,
      @JsonKey(name: 'loanrejected', defaultValue: false)
          required final bool isRejected,
      @JsonKey(name: 'creationDate')
          required final String createdAt,
      @JsonKey(name: 'rejectreason')
          final String? rejectReason,
      @JsonKey(name: 'lDSApploanstatus')
          final String? appLoanStatus}) = _$_LoanDto;
  const _LoanDto._() : super._();

  factory _LoanDto.fromJson(Map<String, dynamic> json) = _$_LoanDto.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'loanno')
  String get loanNo;
  @override
  @JsonKey(name: 'customername', defaultValue: '')
  String get customerName;
  @override
  @JsonKey(name: 'mobilenumber')
  String? get mobileNumber;
  @override
  @JsonKey(name: 'prooftypenumber')
  String? get proofTypeNumber;
  @override
  @JsonKey(name: 'loanamount', defaultValue: 0)
  double get loanAmount;
  @override
  @JsonKey(name: 'loanpreapproved', defaultValue: false)
  bool get isPreApproved;
  @override
  @JsonKey(name: 'loandisburse', defaultValue: false)
  bool get isDisbursed;
  @override
  @JsonKey(name: 'loanrejected', defaultValue: false)
  bool get isRejected;
  @override
  @JsonKey(name: 'creationDate')
  String get createdAt;
  @override
  @JsonKey(name: 'rejectreason')
  String? get rejectReason;
  @override
  @JsonKey(name: 'lDSApploanstatus')
  String? get appLoanStatus;
  @override
  @JsonKey(ignore: true)
  _$$_LoanDtoCopyWith<_$_LoanDto> get copyWith =>
      throw _privateConstructorUsedError;
}
