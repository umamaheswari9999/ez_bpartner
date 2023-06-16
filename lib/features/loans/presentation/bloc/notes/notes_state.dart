part of 'notes_cubit.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.initial() = _NotesInitial;

  const factory NotesState.loading() = _NotesLoading;

  const factory NotesState.success({
    required List<Note> records,
    required bool hasReachedMax,
  }) = _NotesSuccess;

  const factory NotesState.failure(Failure failure) =
  _NotesFailure;
}
