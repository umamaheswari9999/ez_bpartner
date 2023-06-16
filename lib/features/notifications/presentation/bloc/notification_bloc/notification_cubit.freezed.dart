// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notification> records, bool hasReachedMax)
        success,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notification> records, bool hasReachedMax)? success,
    TResult? Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notification> records, bool hasReachedMax)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoading value) loading,
    required TResult Function(_NotificationsSuccess value) success,
    required TResult Function(_NotificationsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoading value)? loading,
    TResult? Function(_NotificationsSuccess value)? success,
    TResult? Function(_NotificationsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoading value)? loading,
    TResult Function(_NotificationsSuccess value)? success,
    TResult Function(_NotificationsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NotificationsInitialCopyWith<$Res> {
  factory _$$_NotificationsInitialCopyWith(_$_NotificationsInitial value,
          $Res Function(_$_NotificationsInitial) then) =
      __$$_NotificationsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotificationsInitialCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsInitial>
    implements _$$_NotificationsInitialCopyWith<$Res> {
  __$$_NotificationsInitialCopyWithImpl(_$_NotificationsInitial _value,
      $Res Function(_$_NotificationsInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotificationsInitial implements _NotificationsInitial {
  const _$_NotificationsInitial();

  @override
  String toString() {
    return 'NotificationsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotificationsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notification> records, bool hasReachedMax)
        success,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notification> records, bool hasReachedMax)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notification> records, bool hasReachedMax)? success,
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
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoading value) loading,
    required TResult Function(_NotificationsSuccess value) success,
    required TResult Function(_NotificationsFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoading value)? loading,
    TResult? Function(_NotificationsSuccess value)? success,
    TResult? Function(_NotificationsFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoading value)? loading,
    TResult Function(_NotificationsSuccess value)? success,
    TResult Function(_NotificationsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _NotificationsInitial implements NotificationsState {
  const factory _NotificationsInitial() = _$_NotificationsInitial;
}

/// @nodoc
abstract class _$$_NotificationsLoadingCopyWith<$Res> {
  factory _$$_NotificationsLoadingCopyWith(_$_NotificationsLoading value,
          $Res Function(_$_NotificationsLoading) then) =
      __$$_NotificationsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotificationsLoadingCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsLoading>
    implements _$$_NotificationsLoadingCopyWith<$Res> {
  __$$_NotificationsLoadingCopyWithImpl(_$_NotificationsLoading _value,
      $Res Function(_$_NotificationsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotificationsLoading implements _NotificationsLoading {
  const _$_NotificationsLoading();

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotificationsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notification> records, bool hasReachedMax)
        success,
    required TResult Function(Failure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notification> records, bool hasReachedMax)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notification> records, bool hasReachedMax)? success,
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
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoading value) loading,
    required TResult Function(_NotificationsSuccess value) success,
    required TResult Function(_NotificationsFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoading value)? loading,
    TResult? Function(_NotificationsSuccess value)? success,
    TResult? Function(_NotificationsFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoading value)? loading,
    TResult Function(_NotificationsSuccess value)? success,
    TResult Function(_NotificationsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _NotificationsLoading implements NotificationsState {
  const factory _NotificationsLoading() = _$_NotificationsLoading;
}

/// @nodoc
abstract class _$$_NotificationsSuccessCopyWith<$Res> {
  factory _$$_NotificationsSuccessCopyWith(_$_NotificationsSuccess value,
          $Res Function(_$_NotificationsSuccess) then) =
      __$$_NotificationsSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Notification> records, bool hasReachedMax});
}

/// @nodoc
class __$$_NotificationsSuccessCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsSuccess>
    implements _$$_NotificationsSuccessCopyWith<$Res> {
  __$$_NotificationsSuccessCopyWithImpl(_$_NotificationsSuccess _value,
      $Res Function(_$_NotificationsSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_$_NotificationsSuccess(
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NotificationsSuccess implements _NotificationsSuccess {
  const _$_NotificationsSuccess(
      {required final List<Notification> records, required this.hasReachedMax})
      : _records = records;

  final List<Notification> _records;
  @override
  List<Notification> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  final bool hasReachedMax;

  @override
  String toString() {
    return 'NotificationsState.success(records: $records, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsSuccess &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_records), hasReachedMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsSuccessCopyWith<_$_NotificationsSuccess> get copyWith =>
      __$$_NotificationsSuccessCopyWithImpl<_$_NotificationsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notification> records, bool hasReachedMax)
        success,
    required TResult Function(Failure failure) failure,
  }) {
    return success(records, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notification> records, bool hasReachedMax)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return success?.call(records, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notification> records, bool hasReachedMax)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(records, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoading value) loading,
    required TResult Function(_NotificationsSuccess value) success,
    required TResult Function(_NotificationsFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoading value)? loading,
    TResult? Function(_NotificationsSuccess value)? success,
    TResult? Function(_NotificationsFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoading value)? loading,
    TResult Function(_NotificationsSuccess value)? success,
    TResult Function(_NotificationsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _NotificationsSuccess implements NotificationsState {
  const factory _NotificationsSuccess(
      {required final List<Notification> records,
      required final bool hasReachedMax}) = _$_NotificationsSuccess;

  List<Notification> get records;
  bool get hasReachedMax;
  @JsonKey(ignore: true)
  _$$_NotificationsSuccessCopyWith<_$_NotificationsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationsFailureCopyWith<$Res> {
  factory _$$_NotificationsFailureCopyWith(_$_NotificationsFailure value,
          $Res Function(_$_NotificationsFailure) then) =
      __$$_NotificationsFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_NotificationsFailureCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsFailure>
    implements _$$_NotificationsFailureCopyWith<$Res> {
  __$$_NotificationsFailureCopyWithImpl(_$_NotificationsFailure _value,
      $Res Function(_$_NotificationsFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_NotificationsFailure(
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

class _$_NotificationsFailure implements _NotificationsFailure {
  const _$_NotificationsFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'NotificationsState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsFailureCopyWith<_$_NotificationsFailure> get copyWith =>
      __$$_NotificationsFailureCopyWithImpl<_$_NotificationsFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Notification> records, bool hasReachedMax)
        success,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Notification> records, bool hasReachedMax)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Notification> records, bool hasReachedMax)? success,
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
    required TResult Function(_NotificationsInitial value) initial,
    required TResult Function(_NotificationsLoading value) loading,
    required TResult Function(_NotificationsSuccess value) success,
    required TResult Function(_NotificationsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationsInitial value)? initial,
    TResult? Function(_NotificationsLoading value)? loading,
    TResult? Function(_NotificationsSuccess value)? success,
    TResult? Function(_NotificationsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationsInitial value)? initial,
    TResult Function(_NotificationsLoading value)? loading,
    TResult Function(_NotificationsSuccess value)? success,
    TResult Function(_NotificationsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _NotificationsFailure implements NotificationsState {
  const factory _NotificationsFailure(final Failure failure) =
      _$_NotificationsFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_NotificationsFailureCopyWith<_$_NotificationsFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
