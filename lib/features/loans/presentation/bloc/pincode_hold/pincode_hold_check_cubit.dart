import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pincode_hold_check_cubit.freezed.dart';

@injectable
class PincodeHoldCheckCubit extends Cubit<PincodeHoldCheckState> {
  final LoanRepo repo;

  PincodeHoldCheckCubit(this.repo)
      : super(const PincodeHoldCheckState.initial());

  void checkIfOnHold(String pincode) async {
    try {
      if (pincode.isNotEmpty) {
        emit(const PincodeHoldCheckState.loading());

        final result = await repo.checkIfPincodeIsOnHold(pincode);
        emit(
          result.fold(
            (l) => PincodeHoldCheckState.failure(l),
            (r) => PincodeHoldCheckState.success(r),
          ),
        );
      }
    } catch (e, st) {
      emit(PincodeHoldCheckState.failure(Failure.unknownFailure()));
    }
  }
}

@freezed
abstract class PincodeHoldCheckState with _$PincodeHoldCheckState {
  const factory PincodeHoldCheckState.initial() = _PincodeHoldCheckInitial;

  const factory PincodeHoldCheckState.loading() = _PincodeHoldCheckLoading;

  const factory PincodeHoldCheckState.success(bool isOnHold) =
      _PincodeHoldCheckSuccess;

  const factory PincodeHoldCheckState.failure(Failure failure) =
      _PincodeHoldCheckFailure;
}
