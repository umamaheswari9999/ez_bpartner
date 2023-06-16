// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'states_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Simple> records) success,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Simple> records)? success,
    TResult? Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Simple> records)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatesInitial value) initial,
    required TResult Function(_StatesLoading value) loading,
    required TResult Function(_StatesSuccess value) success,
    required TResult Function(_StatesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatesInitial value)? initial,
    TResult? Function(_StatesLoading value)? loading,
    TResult? Function(_StatesSuccess value)? success,
    TResult? Function(_StatesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatesInitial value)? initial,
    TResult Function(_StatesLoading value)? loading,
    TResult Function(_StatesSuccess value)? success,
    TResult Function(_StatesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatesStateCopyWith<$Res> {
  factory $StatesStateCopyWith(
          StatesState value, $Res Function(StatesState) then) =
      _$StatesStateCopyWithImpl<$Res, StatesState>;
}

/// @nodoc
class _$StatesStateCopyWithImpl<$Res, $Val extends StatesState>
    implements $StatesStateCopyWith<$Res> {
  _$StatesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StatesInitialCopyWith<$Res> {
  factory _$$_StatesInitialCopyWith(
          _$_StatesInitial value, $Res Function(_$_StatesInitial) then) =
      __$$_StatesInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StatesInitialCopyWithImpl<$Res>
    extends _$StatesStateCopyWithImpl<$Res, _$_StatesInitial>
    implements _$$_StatesInitialCopyWith<$Res> {
  __$$_StatesInitialCopyWithImpl(
      _$_StatesInitial _value, $Res Function(_$_StatesInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StatesInitial implements _StatesInitial {
  const _$_StatesInitial();

  @override
  String toString() {
    return 'StatesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StatesInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Simple> records) success,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Simple> records)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Simple> records)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatesInitial value) initial,
    required TResult Function(_StatesLoading value) loading,
    required TResult Function(_StatesSuccess value) success,
    required TResult Function(_StatesFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatesInitial value)? initial,
    TResult? Function(_StatesLoading value)? loading,
    TResult? Function(_StatesSuccess value)? success,
    TResult? Function(_StatesFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatesInitial value)? initial,
    TResult Function(_StatesLoading value)? loading,
    TResult Function(_StatesSuccess value)? success,
    TResult Function(_StatesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _StatesInitial implements StatesState {
  const factory _StatesInitial() = _$_StatesInitial;
}

/// @nodoc
abstract class _$$_StatesLoadingCopyWith<$Res> {
  factory _$$_StatesLoadingCopyWith(
          _$_StatesLoading value, $Res Function(_$_StatesLoading) then) =
      __$$_StatesLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StatesLoadingCopyWithImpl<$Res>
    extends _$StatesStateCopyWithImpl<$Res, _$_StatesLoading>
    implements _$$_StatesLoadingCopyWith<$Res> {
  __$$_StatesLoadingCopyWithImpl(
      _$_StatesLoading _value, $Res Function(_$_StatesLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StatesLoading implements _StatesLoading {
  const _$_StatesLoading();

  @override
  String toString() {
    return 'StatesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StatesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Simple> records) success,
    required TResult Function(Failure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Simple> records)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Simple> records)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatesInitial value) initial,
    required TResult Function(_StatesLoading value) loading,
    required TResult Function(_StatesSuccess value) success,
    required TResult Function(_StatesFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatesInitial value)? initial,
    TResult? Function(_StatesLoading value)? loading,
    TResult? Function(_StatesSuccess value)? success,
    TResult? Function(_StatesFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatesInitial value)? initial,
    TResult Function(_StatesLoading value)? loading,
    TResult Function(_StatesSuccess value)? success,
    TResult Function(_StatesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _StatesLoading implements StatesState {
  const factory _StatesLoading() = _$_StatesLoading;
}

/// @nodoc
abstract class _$$_StatesSuccessCopyWith<$Res> {
  factory _$$_StatesSuccessCopyWith(
          _$_StatesSuccess value, $Res Function(_$_StatesSuccess) then) =
      __$$_StatesSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Simple> records});
}

/// @nodoc
class __$$_StatesSuccessCopyWithImpl<$Res>
    extends _$StatesStateCopyWithImpl<$Res, _$_StatesSuccess>
    implements _$$_StatesSuccessCopyWith<$Res> {
  __$$_StatesSuccessCopyWithImpl(
      _$_StatesSuccess _value, $Res Function(_$_StatesSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
  }) {
    return _then(_$_StatesSuccess(
      null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<Simple>,
    ));
  }
}

/// @nodoc

class _$_StatesSuccess implements _StatesSuccess {
  const _$_StatesSuccess(final List<Simple> records) : _records = records;

  final List<Simple> _records;
  @override
  List<Simple> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'StatesState.success(records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatesSuccess &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_records));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatesSuccessCopyWith<_$_StatesSuccess> get copyWith =>
      __$$_StatesSuccessCopyWithImpl<_$_StatesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Simple> records) success,
    required TResult Function(Failure failure) failure,
  }) {
    return success(records);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Simple> records)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return success?.call(records);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Simple> records)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(records);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatesInitial value) initial,
    required TResult Function(_StatesLoading value) loading,
    required TResult Function(_StatesSuccess value) success,
    required TResult Function(_StatesFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatesInitial value)? initial,
    TResult? Function(_StatesLoading value)? loading,
    TResult? Function(_StatesSuccess value)? success,
    TResult? Function(_StatesFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatesInitial value)? initial,
    TResult Function(_StatesLoading value)? loading,
    TResult Function(_StatesSuccess value)? success,
    TResult Function(_StatesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _StatesSuccess implements StatesState {
  const factory _StatesSuccess(final List<Simple> records) = _$_StatesSuccess;

  List<Simple> get records;
  @JsonKey(ignore: true)
  _$$_StatesSuccessCopyWith<_$_StatesSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StatesFailureCopyWith<$Res> {
  factory _$$_StatesFailureCopyWith(
          _$_StatesFailure value, $Res Function(_$_StatesFailure) then) =
      __$$_StatesFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_StatesFailureCopyWithImpl<$Res>
    extends _$StatesStateCopyWithImpl<$Res, _$_StatesFailure>
    implements _$$_StatesFailureCopyWith<$Res> {
  __$$_StatesFailureCopyWithImpl(
      _$_StatesFailure _value, $Res Function(_$_StatesFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_StatesFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_StatesFailure implements _StatesFailure {
  const _$_StatesFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'StatesState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatesFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatesFailureCopyWith<_$_StatesFailure> get copyWith =>
      __$$_StatesFailureCopyWithImpl<_$_StatesFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Simple> records) success,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Simple> records)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Simple> records)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatesInitial value) initial,
    required TResult Function(_StatesLoading value) loading,
    required TResult Function(_StatesSuccess value) success,
    required TResult Function(_StatesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatesInitial value)? initial,
    TResult? Function(_StatesLoading value)? loading,
    TResult? Function(_StatesSuccess value)? success,
    TResult? Function(_StatesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatesInitial value)? initial,
    TResult Function(_StatesLoading value)? loading,
    TResult Function(_StatesSuccess value)? success,
    TResult Function(_StatesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _StatesFailure implements StatesState {
  const factory _StatesFailure(final Failure failure) = _$_StatesFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_StatesFailureCopyWith<_$_StatesFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
