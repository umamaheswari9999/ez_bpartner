import 'package:ez_flutter/features/loans/domain/entity/note.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'notes_cubit.freezed.dart';

part 'notes_state.dart';

@injectable
class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.repo) : super(const NotesState.initial());

  final LoanRepo repo;
  final pageLength = 20;

  void fetchInitial(String recordId) async {
    emit(const NotesState.loading());

    var result = await repo.fetchNotes(recordId, 0, pageLength);
    result.fold(
          (l) => emit(NotesState.failure(l)),
          (r) => emit(
        NotesState.success(
          records: r,
          hasReachedMax: r.length < pageLength,
        ),
      ),
    );
  }

  void fetchMore(String recordId) async {
    state.maybeWhen(
        success: (oldRecord, hasReachedMax) async {
          if (!hasReachedMax) {
            final result = await repo.fetchNotes(
              recordId,
              oldRecord.length,
              oldRecord.length + pageLength,
            );
            result.fold(
                  (f) => emit(NotesState.failure(f)),
                  (r) => emit(
                NotesState.success(
                  records: oldRecord + r,
                  hasReachedMax: r.length < pageLength,
                ),
              ),
            );
          }
        },
        orElse: () {}
    );
  }
}
