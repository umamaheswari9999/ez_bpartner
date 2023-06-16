part of 'add_note_cubit.dart';

@freezed
class AddNoteState with _$AddNoteState {
  const factory AddNoteState.initial() = _AddNoteInitial;

  const factory AddNoteState.loading() = _AddNoteLoading;

  const factory AddNoteState.success(Note note) = _AddNoteSuccess;

  const factory AddNoteState.failure(Failure failure) =
  _AddNoteFailure;
}
