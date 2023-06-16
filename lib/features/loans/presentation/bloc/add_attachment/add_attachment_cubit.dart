import 'package:file_picker/file_picker.dart';
import 'package:universal_io/io.dart' as io;

import 'package:ez_flutter/features/loans/domain/entity/attachment.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_attachment_cubit.freezed.dart';

@injectable
class AddAttachmentCubit extends Cubit<AddAttachmentState> {
  final LoanRepo repo;

  AddAttachmentCubit(this.repo)
      : super(const AddAttachmentState.initial());

  void addAttachment({String? recordId, Simple? docType, PlatformFile? file,String? filepath}) async {
    emit(const AddAttachmentState.loading());
    try {
      if (recordId == null) {
        emit(AddAttachmentState.failure(Failure.invalidFieldValue('record id not found')));
      } else if (docType == null) {
        emit(AddAttachmentState.failure(Failure.invalidFieldValue('Please select document type')));
      } else if (file == null) {
        emit(AddAttachmentState.failure(Failure.invalidFieldValue('Please select file')));
      } 
      // else if (file.existsSync() == false) {
      //   emit(AddAttachmentState.failure(Failure.invalidFieldValue('File does not exist')));
      // } 
      else {
        final result = await repo.uploadFile(recordId, docType, file,filepath!);
        emit(
          result.fold(
                (l) => AddAttachmentState.failure(l),
                (r) => AddAttachmentState.success(r),
          ),
        );
      }
    } catch (e, st) {
      emit(
        AddAttachmentState.failure(
          Failure.unknownFailure(),
        ),
      );
    }
  }
}

@freezed
abstract class AddAttachmentState with _$AddAttachmentState {
  const factory AddAttachmentState.initial() = _AddAttachmentInitial;

  const factory AddAttachmentState.loading() = _AddAttachmentLoading;

  const factory AddAttachmentState.success(Attachment attachment) =
  _AddAttachmentSuccess;

  const factory AddAttachmentState.failure(Failure failure) = _AddAttachmentFailure;
}