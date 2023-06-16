// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_loan_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewLoanState {
  int get currentStep => throw _privateConstructorUsedError;
  PreEnquiryForm? get form => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  PreEnquiryForm? get enquiryForm => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  bool? get ishold => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewLoanStateCopyWith<NewLoanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewLoanStateCopyWith<$Res> {
  factory $NewLoanStateCopyWith(
          NewLoanState value, $Res Function(NewLoanState) then) =
      _$NewLoanStateCopyWithImpl<$Res, NewLoanState>;
  @useResult
  $Res call(
      {int currentStep,
      PreEnquiryForm? form,
      Customer? customer,
      PreEnquiryForm? enquiryForm,
      bool isLoading,
      Failure? error,
      bool success,
      bool? ishold});

  $PreEnquiryFormCopyWith<$Res>? get form;
  $CustomerCopyWith<$Res>? get customer;
  $PreEnquiryFormCopyWith<$Res>? get enquiryForm;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$NewLoanStateCopyWithImpl<$Res, $Val extends NewLoanState>
    implements $NewLoanStateCopyWith<$Res> {
  _$NewLoanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? form = freezed,
    Object? customer = freezed,
    Object? enquiryForm = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? success = null,
    Object? ishold = freezed,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      form: freezed == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as PreEnquiryForm?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      enquiryForm: freezed == enquiryForm
          ? _value.enquiryForm
          : enquiryForm // ignore: cast_nullable_to_non_nullable
              as PreEnquiryForm?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      ishold: freezed == ishold
          ? _value.ishold
          : ishold // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PreEnquiryFormCopyWith<$Res>? get form {
    if (_value.form == null) {
      return null;
    }

    return $PreEnquiryFormCopyWith<$Res>(_value.form!, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PreEnquiryFormCopyWith<$Res>? get enquiryForm {
    if (_value.enquiryForm == null) {
      return null;
    }

    return $PreEnquiryFormCopyWith<$Res>(_value.enquiryForm!, (value) {
      return _then(_value.copyWith(enquiryForm: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewLoanStateCopyWith<$Res>
    implements $NewLoanStateCopyWith<$Res> {
  factory _$$_NewLoanStateCopyWith(
          _$_NewLoanState value, $Res Function(_$_NewLoanState) then) =
      __$$_NewLoanStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStep,
      PreEnquiryForm? form,
      Customer? customer,
      PreEnquiryForm? enquiryForm,
      bool isLoading,
      Failure? error,
      bool success,
      bool? ishold});

  @override
  $PreEnquiryFormCopyWith<$Res>? get form;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $PreEnquiryFormCopyWith<$Res>? get enquiryForm;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$_NewLoanStateCopyWithImpl<$Res>
    extends _$NewLoanStateCopyWithImpl<$Res, _$_NewLoanState>
    implements _$$_NewLoanStateCopyWith<$Res> {
  __$$_NewLoanStateCopyWithImpl(
      _$_NewLoanState _value, $Res Function(_$_NewLoanState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? form = freezed,
    Object? customer = freezed,
    Object? enquiryForm = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? success = null,
    Object? ishold = freezed,
  }) {
    return _then(_$_NewLoanState(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      form: freezed == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as PreEnquiryForm?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      enquiryForm: freezed == enquiryForm
          ? _value.enquiryForm
          : enquiryForm // ignore: cast_nullable_to_non_nullable
              as PreEnquiryForm?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      ishold: freezed == ishold
          ? _value.ishold
          : ishold // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_NewLoanState implements _NewLoanState {
  const _$_NewLoanState(
      {required this.currentStep,
      this.form,
      this.customer,
      this.enquiryForm,
      required this.isLoading,
      this.error,
      required this.success,
      this.ishold});

  @override
  final int currentStep;
  @override
  final PreEnquiryForm? form;
  @override
  final Customer? customer;
  @override
  final PreEnquiryForm? enquiryForm;
  @override
  final bool isLoading;
  @override
  final Failure? error;
  @override
  final bool success;
  @override
  final bool? ishold;

  @override
  String toString() {
    return 'NewLoanState(currentStep: $currentStep, form: $form, customer: $customer, enquiryForm: $enquiryForm, isLoading: $isLoading, error: $error, success: $success, ishold: $ishold)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewLoanState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.enquiryForm, enquiryForm) ||
                other.enquiryForm == enquiryForm) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.ishold, ishold) || other.ishold == ishold));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, form, customer,
      enquiryForm, isLoading, error, success, ishold);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewLoanStateCopyWith<_$_NewLoanState> get copyWith =>
      __$$_NewLoanStateCopyWithImpl<_$_NewLoanState>(this, _$identity);
}

abstract class _NewLoanState implements NewLoanState {
  const factory _NewLoanState(
      {required final int currentStep,
      final PreEnquiryForm? form,
      final Customer? customer,
      final PreEnquiryForm? enquiryForm,
      required final bool isLoading,
      final Failure? error,
      required final bool success,
      final bool? ishold}) = _$_NewLoanState;

  @override
  int get currentStep;
  @override
  PreEnquiryForm? get form;
  @override
  Customer? get customer;
  @override
  PreEnquiryForm? get enquiryForm;
  @override
  bool get isLoading;
  @override
  Failure? get error;
  @override
  bool get success;
  @override
  bool? get ishold;
  @override
  @JsonKey(ignore: true)
  _$$_NewLoanStateCopyWith<_$_NewLoanState> get copyWith =>
      throw _privateConstructorUsedError;
}
