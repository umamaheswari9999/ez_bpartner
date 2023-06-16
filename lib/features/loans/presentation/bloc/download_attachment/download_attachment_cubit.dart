import 'dart:typed_data';

import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'download_attachment_cubit.freezed.dart';

@injectable
class DownloadAttachmentCubit extends Cubit<DownloadAttachmentState> {
  final LoanRepo repo;

  DownloadAttachmentCubit(this.repo)
      : super(const DownloadAttachmentState.initial());

  void fetchDownloadAttachment(
      String recordId, String fileName, String entityName) async {
    emit(const DownloadAttachmentState.loading());
    try {
      final result = await repo.fetchAttachment(recordId, fileName, entityName);

      emit(
        result.fold(
          (l) => DownloadAttachmentState.failure(l),
          (r) => DownloadAttachmentState.success(r, fileName),
        ),
      );
    } catch (e, st) {
      emit(
        DownloadAttachmentState.failure(Failure.unknownFailure()),
      );
    }
  }
}

@freezed
abstract class DownloadAttachmentState with _$DownloadAttachmentState {
  const factory DownloadAttachmentState.initial() = _DownloadAttachmentInitial;

  const factory DownloadAttachmentState.loading() = _DownloadAttachmentLoading;

  const factory DownloadAttachmentState.success(Uint8List data, String name) =
      _DownloadAttachmentSuccess;

  const factory DownloadAttachmentState.failure(Failure failure) =
      _DownloadAttachmentFailure;
}
