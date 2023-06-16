// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_note_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddNoteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) success,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Note note)? success,
    TResult? Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddNoteInitial value) initial,
    required TResult Function(_AddNoteLoading value) loading,
    required TResult Function(_AddNoteSuccess value) success,
    required TResult Function(_AddNoteFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddNoteInitial value)? initial,
    TResult? Function(_AddNoteLoading value)? loading,
    TResult? Function(_AddNoteSuccess value)? success,
    TResult? Function(_AddNoteFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNoteInitial value)? initial,
    TResult Function(_AddNoteLoading value)? loading,
    TResult Function(_AddNoteSuccess value)? success,
    TResult Function(_AddNoteFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNoteStateCopyWith<$Res> {
  factory $AddNoteStateCopyWith(
          AddNoteState value, $Res Function(AddNoteState) then) =
      _$AddNoteStateCopyWithImpl<$Res, AddNoteState>;
}

/// @nodoc
class _$AddNoteStateCopyWithImpl<$Res, $Val extends AddNoteState>
    implements $AddNoteStateCopyWith<$Res> {
  _$AddNoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AddNoteInitialCopyWith<$Res> {
  factory _$$_AddNoteInitialCopyWith(
          _$_AddNoteInitial value, $Res Function(_$_AddNoteInitial) then) =
      __$$_AddNoteInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddNoteInitialCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_AddNoteInitial>
    implements _$$_AddNoteInitialCopyWith<$Res> {
  __$$_AddNoteInitialCopyWithImpl(
      _$_AddNoteInitial _value, $Res Function(_$_AddNoteInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AddNoteInitial implements _AddNoteInitial {
  const _$_AddNoteInitial();

  @override
  String toString() {
    return 'AddNoteState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddNoteInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) success,
    required TResult Function(Failure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Note note)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? success,
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
    required TResult Function(_AddNoteInitial value) initial,
    required TResult Function(_AddNoteLoading value) loading,
    required TResult Function(_AddNoteSuccess value) success,
    required TResult Function(_AddNoteFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddNoteInitial value)? initial,
    TResult? Function(_AddNoteLoading value)? loading,
    TResult? Function(_AddNoteSuccess value)? success,
    TResult? Function(_AddNoteFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNoteInitial value)? initial,
    TResult Function(_AddNoteLoading value)? loading,
    TResult Function(_AddNoteSuccess value)? success,
    TResult Function(_AddNoteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AddNoteInitial implements AddNoteState {
  const factory _AddNoteInitial() = _$_AddNoteInitial;
}

/// @nodoc
abstract class _$$_AddNoteLoadingCopyWith<$Res> {
  factory _$$_AddNoteLoadingCopyWith(
          _$_AddNoteLoading value, $Res Function(_$_AddNoteLoading) then) =
      __$$_AddNoteLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddNoteLoadingCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_AddNoteLoading>
    implements _$$_AddNoteLoadingCopyWith<$Res> {
  __$$_AddNoteLoadingCopyWithImpl(
      _$_AddNoteLoading _value, $Res Function(_$_AddNoteLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AddNoteLoading implements _AddNoteLoading {
  const _$_AddNoteLoading();

  @override
  String toString() {
    return 'AddNoteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddNoteLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) success,
    required TResult Function(Failure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Note note)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? success,
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
    required TResult Function(_AddNoteInitial value) initial,
    required TResult Function(_AddNoteLoading value) loading,
    required TResult Function(_AddNoteSuccess value) success,
    required TResult Function(_AddNoteFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddNoteInitial value)? initial,
    TResult? Function(_AddNoteLoading value)? loading,
    TResult? Function(_AddNoteSuccess value)? success,
    TResult? Function(_AddNoteFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNoteInitial value)? initial,
    TResult Function(_AddNoteLoading value)? loading,
    TResult Function(_AddNoteSuccess value)? success,
    TResult Function(_AddNoteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AddNoteLoading implements AddNoteState {
  const factory _AddNoteLoading() = _$_AddNoteLoading;
}

/// @nodoc
abstract class _$$_AddNoteSuccessCopyWith<$Res> {
  factory _$$_AddNoteSuccessCopyWith(
          _$_AddNoteSuccess value, $Res Function(_$_AddNoteSuccess) then) =
      __$$_AddNoteSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Note note});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$$_AddNoteSuccessCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_AddNoteSuccess>
    implements _$$_AddNoteSuccessCopyWith<$Res> {
  __$$_AddNoteSuccessCopyWithImpl(
      _$_AddNoteSuccess _value, $Res Function(_$_AddNoteSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
  }) {
    return _then(_$_AddNoteSuccess(
      null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$_AddNoteSuccess implements _AddNoteSuccess {
  const _$_AddNoteSuccess(this.note);

  @override
  final Note note;

  @override
  String toString() {
    return 'AddNoteState.success(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddNoteSuccess &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddNoteSuccessCopyWith<_$_AddNoteSuccess> get copyWith =>
      __$$_AddNoteSuccessCopyWithImpl<_$_AddNoteSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) success,
    required TResult Function(Failure failure) failure,
  }) {
    return success(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Note note)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return success?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddNoteInitial value) initial,
    required TResult Function(_AddNoteLoading value) loading,
    required TResult Function(_AddNoteSuccess value) success,
    required TResult Function(_AddNoteFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddNoteInitial value)? initial,
    TResult? Function(_AddNoteLoading value)? loading,
    TResult? Function(_AddNoteSuccess value)? success,
    TResult? Function(_AddNoteFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNoteInitial value)? initial,
    TResult Function(_AddNoteLoading value)? loading,
    TResult Function(_AddNoteSuccess value)? success,
    TResult Function(_AddNoteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _AddNoteSuccess implements AddNoteState {
  const factory _AddNoteSuccess(final Note note) = _$_AddNoteSuccess;

  Note get note;
  @JsonKey(ignore: true)
  _$$_AddNoteSuccessCopyWith<_$_AddNoteSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddNoteFailureCopyWith<$Res> {
  factory _$$_AddNoteFailureCopyWith(
          _$_AddNoteFailure value, $Res Function(_$_AddNoteFailure) then) =
      __$$_AddNoteFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_AddNoteFailureCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_AddNoteFailure>
    implements _$$_AddNoteFailureCopyWith<$Res> {
  __$$_AddNoteFailureCopyWithImpl(
      _$_AddNoteFailure _value, $Res Function(_$_AddNoteFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_AddNoteFailure(
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

class _$_AddNoteFailure implements _AddNoteFailure {
  const _$_AddNoteFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AddNoteState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddNoteFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddNoteFailureCopyWith<_$_AddNoteFailure> get copyWith =>
      __$$_AddNoteFailureCopyWithImpl<_$_AddNoteFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) success,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Note note)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? success,
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
    required TResult Function(_AddNoteInitial value) initial,
    required TResult Function(_AddNoteLoading value) loading,
    required TResult Function(_AddNoteSuccess value) success,
    required TResult Function(_AddNoteFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddNoteInitial value)? initial,
    TResult? Function(_AddNoteLoading value)? loading,
    TResult? Function(_AddNoteSuccess value)? success,
    TResult? Function(_AddNoteFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddNoteInitial value)? initial,
    TResult Function(_AddNoteLoading value)? loading,
    TResult Function(_AddNoteSuccess value)? success,
    TResult Function(_AddNoteFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AddNoteFailure implements AddNoteState {
  const factory _AddNoteFailure(final Failure failure) = _$_AddNoteFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_AddNoteFailureCopyWith<_$_AddNoteFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
