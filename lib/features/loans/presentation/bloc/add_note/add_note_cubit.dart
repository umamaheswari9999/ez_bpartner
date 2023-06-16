import 'package:ez_flutter/features/loans/domain/entity/note.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_note_cubit.freezed.dart';

part 'add_note_state.dart';

@injectable
class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.repo) : super(const AddNoteState.initial());

  final LoanRepo repo;

  void addNote(String recordId, String note) async {
    try {
      const AddNoteState.loading();

      final result = await repo.insertNote(recordId, note);
      result.fold(
        (l) => emit(AddNoteState.failure(l)),
        (r) => emit(AddNoteState.success(r)),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not add note');
      emit(AddNoteState.failure(Failure.unknownFailure()));
    }
  }
}
