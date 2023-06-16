import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'attachment_doc_types_cubit.freezed.dart';

@injectable
class AttachmentDocTypesCubit extends Cubit<AttachmentDocTypesState> {
  final LoanRepo repo;

  AttachmentDocTypesCubit(this.repo)
      : super(const AttachmentDocTypesState.initial());

  void fetchAttachmentDocTypes() async {
    emit(const AttachmentDocTypesState.loading());
    try {
      final result = await repo.fetchAttachmentDocTypes();
      emit(
        result.fold(
              (l) => AttachmentDocTypesState.failure(l),
              (r) => AttachmentDocTypesState.success(r),
        ),
      );
    } catch (e, st) {
      emit(
        AttachmentDocTypesState.failure(
          Failure.unknownFailure(),
        ),
      );
    }
  }
}

@freezed
abstract class AttachmentDocTypesState with _$AttachmentDocTypesState {
  const factory AttachmentDocTypesState.initial() = _AttachmentDocTypesInitial;

  const factory AttachmentDocTypesState.loading() = _AttachmentDocTypesLoading;

  const factory AttachmentDocTypesState.success(List<Simple> types) =
  _AttachmentDocTypesSuccess;

  const factory AttachmentDocTypesState.failure(Failure failure) = _AttachmentDocTypesFailure;
}