import 'package:ez_flutter/features/loans/domain/entity/note.dart';
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'kyc_check_cubit.freezed.dart';

part 'kyc_check_state.dart';

@injectable
class KycCheckCubit extends Cubit<KycCheckState> {
  KycCheckCubit(this.repo) : super(const KycCheckState.initial());

  final LoanRepo repo;

  void checkKycStatus(String pan) async {
    try {
      const KycCheckState.loading();

      final result = await repo.checkIfKycDone(pan);
      result.fold(
            (l) => emit(KycCheckState.failure(l)),
            (r) => emit(KycCheckState.success(r)),
      );
    } catch (e, st) {
      logError(e, st, '[bloc] could not check for kyc status');
      emit(KycCheckState.failure(Failure.unknownFailure()));
    }
  }
}
