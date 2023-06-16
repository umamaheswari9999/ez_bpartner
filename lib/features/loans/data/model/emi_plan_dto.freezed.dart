// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emi_plan_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmiPlanDto _$EmiPlanDtoFromJson(Map<String, dynamic> json) {
  return _EmiPlanDto.fromJson(json);
}

/// @nodoc
mixin _$EmiPlanDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'plan_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'toalemis')
  int get totalemis => throw _privateConstructorUsedError;
  String get interestrate => throw _privateConstructorUsedError;
  int get advemi => throw _privateConstructorUsedError;
  @JsonKey(name: 'downPaymentAmount')
  String get downPayment => throw _privateConstructorUsedError;
  String get emiAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmiPlanDtoCopyWith<EmiPlanDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiPlanDtoCopyWith<$Res> {
  factory $EmiPlanDtoCopyWith(
          EmiPlanDto value, $Res Function(EmiPlanDto) then) =
      _$EmiPlanDtoCopyWithImpl<$Res, EmiPlanDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'plan_name') String name,
      @JsonKey(name: 'toalemis') int totalemis,
      String interestrate,
      int advemi,
      @JsonKey(name: 'downPaymentAmount') String downPayment,
      String emiAmount});
}

/// @nodoc
class _$EmiPlanDtoCopyWithImpl<$Res, $Val extends EmiPlanDto>
    implements $EmiPlanDtoCopyWith<$Res> {
  _$EmiPlanDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalemis = null,
    Object? interestrate = null,
    Object? advemi = null,
    Object? downPayment = null,
    Object? emiAmount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalemis: null == totalemis
          ? _value.totalemis
          : totalemis // ignore: cast_nullable_to_non_nullable
              as int,
      interestrate: null == interestrate
          ? _value.interestrate
          : interestrate // ignore: cast_nullable_to_non_nullable
              as String,
      advemi: null == advemi
          ? _value.advemi
          : advemi // ignore: cast_nullable_to_non_nullable
              as int,
      downPayment: null == downPayment
          ? _value.downPayment
          : downPayment // ignore: cast_nullable_to_non_nullable
              as String,
      emiAmount: null == emiAmount
          ? _value.emiAmount
          : emiAmount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmiPlanDtoCopyWith<$Res>
    implements $EmiPlanDtoCopyWith<$Res> {
  factory _$$_EmiPlanDtoCopyWith(
          _$_EmiPlanDto value, $Res Function(_$_EmiPlanDto) then) =
      __$$_EmiPlanDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'plan_name') String name,
      @JsonKey(name: 'toalemis') int totalemis,
      String interestrate,
      int advemi,
      @JsonKey(name: 'downPaymentAmount') String downPayment,
      String emiAmount});
}

/// @nodoc
class __$$_EmiPlanDtoCopyWithImpl<$Res>
    extends _$EmiPlanDtoCopyWithImpl<$Res, _$_EmiPlanDto>
    implements _$$_EmiPlanDtoCopyWith<$Res> {
  __$$_EmiPlanDtoCopyWithImpl(
      _$_EmiPlanDto _value, $Res Function(_$_EmiPlanDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalemis = null,
    Object? interestrate = null,
    Object? advemi = null,
    Object? downPayment = null,
    Object? emiAmount = null,
  }) {
    return _then(_$_EmiPlanDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalemis: null == totalemis
          ? _value.totalemis
          : totalemis // ignore: cast_nullable_to_non_nullable
              as int,
      interestrate: null == interestrate
          ? _value.interestrate
          : interestrate // ignore: cast_nullable_to_non_nullable
              as String,
      advemi: null == advemi
          ? _value.advemi
          : advemi // ignore: cast_nullable_to_non_nullable
              as int,
      downPayment: null == downPayment
          ? _value.downPayment
          : downPayment // ignore: cast_nullable_to_non_nullable
              as String,
      emiAmount: null == emiAmount
          ? _value.emiAmount
          : emiAmount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmiPlanDto extends _EmiPlanDto {
  const _$_EmiPlanDto(
      {required this.id,
      @JsonKey(name: 'plan_name') required this.name,
      @JsonKey(name: 'toalemis') required this.totalemis,
      required this.interestrate,
      required this.advemi,
      @JsonKey(name: 'downPaymentAmount') required this.downPayment,
      required this.emiAmount})
      : super._();

  factory _$_EmiPlanDto.fromJson(Map<String, dynamic> json) =>
      _$$_EmiPlanDtoFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'plan_name')
  final String name;
  @override
  @JsonKey(name: 'toalemis')
  final int totalemis;
  @override
  final String interestrate;
  @override
  final int advemi;
  @override
  @JsonKey(name: 'downPaymentAmount')
  final String downPayment;
  @override
  final String emiAmount;

  @override
  String toString() {
    return 'EmiPlanDto(id: $id, name: $name, totalemis: $totalemis, interestrate: $interestrate, advemi: $advemi, downPayment: $downPayment, emiAmount: $emiAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmiPlanDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalemis, totalemis) ||
                other.totalemis == totalemis) &&
            (identical(other.interestrate, interestrate) ||
                other.interestrate == interestrate) &&
            (identical(other.advemi, advemi) || other.advemi == advemi) &&
            (identical(other.downPayment, downPayment) ||
                other.downPayment == downPayment) &&
            (identical(other.emiAmount, emiAmount) ||
                other.emiAmount == emiAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, totalemis,
      interestrate, advemi, downPayment, emiAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmiPlanDtoCopyWith<_$_EmiPlanDto> get copyWith =>
      __$$_EmiPlanDtoCopyWithImpl<_$_EmiPlanDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmiPlanDtoToJson(
      this,
    );
  }
}

abstract class _EmiPlanDto extends EmiPlanDto {
  const factory _EmiPlanDto(
      {required final String id,
      @JsonKey(name: 'plan_name') required final String name,
      @JsonKey(name: 'toalemis') required final int totalemis,
      required final String interestrate,
      required final int advemi,
      @JsonKey(name: 'downPaymentAmount') required final String downPayment,
      required final String emiAmount}) = _$_EmiPlanDto;
  const _EmiPlanDto._() : super._();

  factory _EmiPlanDto.fromJson(Map<String, dynamic> json) =
      _$_EmiPlanDto.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'plan_name')
  String get name;
  @override
  @JsonKey(name: 'toalemis')
  int get totalemis;
  @override
  String get interestrate;
  @override
  int get advemi;
  @override
  @JsonKey(name: 'downPaymentAmount')
  String get downPayment;
  @override
  String get emiAmount;
  @override
  @JsonKey(ignore: true)
  _$$_EmiPlanDtoCopyWith<_$_EmiPlanDto> get copyWith =>
      throw _privateConstructorUsedError;
}
