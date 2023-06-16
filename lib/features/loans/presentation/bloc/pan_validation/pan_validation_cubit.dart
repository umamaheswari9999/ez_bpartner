import 'package:dartz/dartz.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pan_validation_cubit.freezed.dart';

@injectable
class PanValidationCubit extends Cubit<PanValidationState> {
  final LoanRepo repo;
  PanValidationCubit(this.repo) : super(const PanValidationState.initial());
  void isValidPANNumber(String panNumber) async {
    emit(const PanValidationState.loading());
    try {
      var res = await repo.validatePAN(panNumber);
      return res.fold((l) => emit(PanValidationState.failure(l)),
          (r) {
           return emit(PanValidationState.success(r));
          });
    } catch (e, st) {
      logError(e, st, '[bloc] Could not validate pan');
      return emit(PanValidationState.failure(Failure.unknownFailure()));
    }
  }
}

@freezed
class PanValidationState with _$PanValidationState {
  const factory PanValidationState.initial() = _Initial;
  const factory PanValidationState.loading() = _Loading;
  const factory PanValidationState.success(Tuple2<bool,String?> res) = _Success;
  const factory PanValidationState.failure(Failure failure) = _Failure;
}
