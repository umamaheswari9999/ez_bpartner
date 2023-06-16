import 'package:ez_flutter/features/loans/domain/entity/attachment.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'loan_attachments_cubit.freezed.dart';

@injectable
class LoanAttachmentsCubit extends Cubit<LoanAttachmentsState> {
  final LoanRepo repo;

  LoanAttachmentsCubit(this.repo) : super(const LoanAttachmentsState.initial());

  void fetchLoanAttachments(String recordId) async {
    emit(const LoanAttachmentsState.loading());
    try {
      final result = await repo.fetchLoanAttachments(recordId);

      emit(
        result.fold(
          (l) => LoanAttachmentsState.failure(l),
          (r) => LoanAttachmentsState.success(r),
        ),
      );
    } catch (e, st) {
      emit(LoanAttachmentsState.failure(Failure.unknownFailure()));
    }
  }
}

@freezed
abstract class LoanAttachmentsState with _$LoanAttachmentsState {
  const factory LoanAttachmentsState.initial() = _LoanAttachmentsInitial;

  const factory LoanAttachmentsState.loading() = _LoanAttachmentsLoading;

  const factory LoanAttachmentsState.success(List<Attachment> data) =
      _LoanAttachmentsSuccess;

  const factory LoanAttachmentsState.failure(Failure failure) =
      _LoanAttachmentsFailure;
}
