part of 'kyc_check_cubit.dart';

@freezed
class KycCheckState with _$KycCheckState {
  const factory KycCheckState.initial() = _KycCheckInitial;

  const factory KycCheckState.loading() = _KycCheckLoading;

  const factory KycCheckState.success(bool done) = _KycCheckSuccess;

  const factory KycCheckState.failure(Failure failure) =
  _KycCheckFailure;
}

