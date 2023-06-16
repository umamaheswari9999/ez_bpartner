// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emi_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmiPlan _$EmiPlanFromJson(Map<String, dynamic> json) {
  return _EmiPlan.fromJson(json);
}

/// @nodoc
mixin _$EmiPlan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get totalemis => throw _privateConstructorUsedError;
  String get interestrate => throw _privateConstructorUsedError;
  int get advemi => throw _privateConstructorUsedError;
  String get downPayment => throw _privateConstructorUsedError;
  String get emiAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmiPlanCopyWith<EmiPlan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiPlanCopyWith<$Res> {
  factory $EmiPlanCopyWith(EmiPlan value, $Res Function(EmiPlan) then) =
      _$EmiPlanCopyWithImpl<$Res, EmiPlan>;
  @useResult
  $Res call(
      {String id,
      String name,
      int totalemis,
      String interestrate,
      int advemi,
      String downPayment,
      String emiAmount});
}

/// @nodoc
class _$EmiPlanCopyWithImpl<$Res, $Val extends EmiPlan>
    implements $EmiPlanCopyWith<$Res> {
  _$EmiPlanCopyWithImpl(this._value, this._then);

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
abstract class _$$_EmiPlanCopyWith<$Res> implements $EmiPlanCopyWith<$Res> {
  factory _$$_EmiPlanCopyWith(
          _$_EmiPlan value, $Res Function(_$_EmiPlan) then) =
      __$$_EmiPlanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int totalemis,
      String interestrate,
      int advemi,
      String downPayment,
      String emiAmount});
}

/// @nodoc
class __$$_EmiPlanCopyWithImpl<$Res>
    extends _$EmiPlanCopyWithImpl<$Res, _$_EmiPlan>
    implements _$$_EmiPlanCopyWith<$Res> {
  __$$_EmiPlanCopyWithImpl(_$_EmiPlan _value, $Res Function(_$_EmiPlan) _then)
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
    return _then(_$_EmiPlan(
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
class _$_EmiPlan extends _EmiPlan {
  _$_EmiPlan(
      {required this.id,
      required this.name,
      required this.totalemis,
      required this.interestrate,
      required this.advemi,
      required this.downPayment,
      required this.emiAmount})
      : super._();

  factory _$_EmiPlan.fromJson(Map<String, dynamic> json) =>
      _$$_EmiPlanFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int totalemis;
  @override
  final String interestrate;
  @override
  final int advemi;
  @override
  final String downPayment;
  @override
  final String emiAmount;

  @override
  String toString() {
    return 'EmiPlan(id: $id, name: $name, totalemis: $totalemis, interestrate: $interestrate, advemi: $advemi, downPayment: $downPayment, emiAmount: $emiAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmiPlan &&
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
  _$$_EmiPlanCopyWith<_$_EmiPlan> get copyWith =>
      __$$_EmiPlanCopyWithImpl<_$_EmiPlan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmiPlanToJson(
      this,
    );
  }
}

abstract class _EmiPlan extends EmiPlan {
  factory _EmiPlan(
      {required final String id,
      required final String name,
      required final int totalemis,
      required final String interestrate,
      required final int advemi,
      required final String downPayment,
      required final String emiAmount}) = _$_EmiPlan;
  _EmiPlan._() : super._();

  factory _EmiPlan.fromJson(Map<String, dynamic> json) = _$_EmiPlan.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get totalemis;
  @override
  String get interestrate;
  @override
  int get advemi;
  @override
  String get downPayment;
  @override
  String get emiAmount;
  @override
  @JsonKey(ignore: true)
  _$$_EmiPlanCopyWith<_$_EmiPlan> get copyWith =>
      throw _privateConstructorUsedError;
}
