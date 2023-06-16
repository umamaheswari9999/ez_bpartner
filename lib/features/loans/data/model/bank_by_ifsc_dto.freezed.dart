// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_by_ifsc_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankByIfscDto _$BankByIfscDtoFromJson(Map<String, dynamic> json) {
  return _BankByIfscDto.fromJson(json);
}

/// @nodoc
mixin _$BankByIfscDto {
  @JsonKey(name: 'inpifsccode')
  String get ifscCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'inpbankbranch')
  String get bankBranchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'inpbanknameId')
  String get bankBranchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'inpmicr')
  String get micr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankByIfscDtoCopyWith<BankByIfscDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankByIfscDtoCopyWith<$Res> {
  factory $BankByIfscDtoCopyWith(
          BankByIfscDto value, $Res Function(BankByIfscDto) then) =
      _$BankByIfscDtoCopyWithImpl<$Res, BankByIfscDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'inpifsccode') String ifscCode,
      @JsonKey(name: 'inpbankbranch') String bankBranchName,
      @JsonKey(name: 'inpbanknameId') String bankBranchId,
      @JsonKey(name: 'inpmicr') String micr});
}

/// @nodoc
class _$BankByIfscDtoCopyWithImpl<$Res, $Val extends BankByIfscDto>
    implements $BankByIfscDtoCopyWith<$Res> {
  _$BankByIfscDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ifscCode = null,
    Object? bankBranchName = null,
    Object? bankBranchId = null,
    Object? micr = null,
  }) {
    return _then(_value.copyWith(
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchName: null == bankBranchName
          ? _value.bankBranchName
          : bankBranchName // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchId: null == bankBranchId
          ? _value.bankBranchId
          : bankBranchId // ignore: cast_nullable_to_non_nullable
              as String,
      micr: null == micr
          ? _value.micr
          : micr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankByIfscDtoCopyWith<$Res>
    implements $BankByIfscDtoCopyWith<$Res> {
  factory _$$_BankByIfscDtoCopyWith(
          _$_BankByIfscDto value, $Res Function(_$_BankByIfscDto) then) =
      __$$_BankByIfscDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'inpifsccode') String ifscCode,
      @JsonKey(name: 'inpbankbranch') String bankBranchName,
      @JsonKey(name: 'inpbanknameId') String bankBranchId,
      @JsonKey(name: 'inpmicr') String micr});
}

/// @nodoc
class __$$_BankByIfscDtoCopyWithImpl<$Res>
    extends _$BankByIfscDtoCopyWithImpl<$Res, _$_BankByIfscDto>
    implements _$$_BankByIfscDtoCopyWith<$Res> {
  __$$_BankByIfscDtoCopyWithImpl(
      _$_BankByIfscDto _value, $Res Function(_$_BankByIfscDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ifscCode = null,
    Object? bankBranchName = null,
    Object? bankBranchId = null,
    Object? micr = null,
  }) {
    return _then(_$_BankByIfscDto(
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchName: null == bankBranchName
          ? _value.bankBranchName
          : bankBranchName // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranchId: null == bankBranchId
          ? _value.bankBranchId
          : bankBranchId // ignore: cast_nullable_to_non_nullable
              as String,
      micr: null == micr
          ? _value.micr
          : micr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankByIfscDto extends _BankByIfscDto {
  const _$_BankByIfscDto(
      {@JsonKey(name: 'inpifsccode') required this.ifscCode,
      @JsonKey(name: 'inpbankbranch') required this.bankBranchName,
      @JsonKey(name: 'inpbanknameId') required this.bankBranchId,
      @JsonKey(name: 'inpmicr') required this.micr})
      : super._();

  factory _$_BankByIfscDto.fromJson(Map<String, dynamic> json) =>
      _$$_BankByIfscDtoFromJson(json);

  @override
  @JsonKey(name: 'inpifsccode')
  final String ifscCode;
  @override
  @JsonKey(name: 'inpbankbranch')
  final String bankBranchName;
  @override
  @JsonKey(name: 'inpbanknameId')
  final String bankBranchId;
  @override
  @JsonKey(name: 'inpmicr')
  final String micr;

  @override
  String toString() {
    return 'BankByIfscDto(ifscCode: $ifscCode, bankBranchName: $bankBranchName, bankBranchId: $bankBranchId, micr: $micr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankByIfscDto &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.bankBranchName, bankBranchName) ||
                other.bankBranchName == bankBranchName) &&
            (identical(other.bankBranchId, bankBranchId) ||
                other.bankBranchId == bankBranchId) &&
            (identical(other.micr, micr) || other.micr == micr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ifscCode, bankBranchName, bankBranchId, micr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankByIfscDtoCopyWith<_$_BankByIfscDto> get copyWith =>
      __$$_BankByIfscDtoCopyWithImpl<_$_BankByIfscDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankByIfscDtoToJson(
      this,
    );
  }
}

abstract class _BankByIfscDto extends BankByIfscDto {
  const factory _BankByIfscDto(
      {@JsonKey(name: 'inpifsccode') required final String ifscCode,
      @JsonKey(name: 'inpbankbranch') required final String bankBranchName,
      @JsonKey(name: 'inpbanknameId') required final String bankBranchId,
      @JsonKey(name: 'inpmicr') required final String micr}) = _$_BankByIfscDto;
  const _BankByIfscDto._() : super._();

  factory _BankByIfscDto.fromJson(Map<String, dynamic> json) =
      _$_BankByIfscDto.fromJson;

  @override
  @JsonKey(name: 'inpifsccode')
  String get ifscCode;
  @override
  @JsonKey(name: 'inpbankbranch')
  String get bankBranchName;
  @override
  @JsonKey(name: 'inpbanknameId')
  String get bankBranchId;
  @override
  @JsonKey(name: 'inpmicr')
  String get micr;
  @override
  @JsonKey(ignore: true)
  _$$_BankByIfscDtoCopyWith<_$_BankByIfscDto> get copyWith =>
      throw _privateConstructorUsedError;
}
