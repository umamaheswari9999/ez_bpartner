import 'package:ez_flutter/features/loans/data/model/ocrpan.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ocr_pan_validation_cubit.freezed.dart';

@injectable
class OcrPanValidationCubit extends Cubit<OcrPanValidationState> {
  final LoanRepo repo;
  OcrPanValidationCubit(this.repo) : super(const OcrPanValidationState.initial());
  void ocrPANValidation(PlatformFile file) async {
    emit(const OcrPanValidationState.loading());
    try {
      var res = await repo.ocrPANValidation(file);
      res.fold((l) => emit(OcrPanValidationState.failure(l)),
          (r) => emit(OcrPanValidationState.success(r)));
    } catch (e, st) {
      logError(e, st, '[bloc] Could not fetch PAN data');
      emit(OcrPanValidationState.failure(Failure.unknownFailure()));
    }
  }
}

@freezed
class OcrPanValidationState with _$OcrPanValidationState {
  const factory OcrPanValidationState.initial() = _Initial;
  const factory OcrPanValidationState.loading() = _Loading;
  const factory OcrPanValidationState.success(OCRPan pandetails) = _Success;
  const factory OcrPanValidationState.failure(Failure failure) = _Failure;
}
