import 'package:ez_flutter/features/auth/domain/repo/auth_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forgot_pswd.freezed.dart';

@injectable
class ForgotPswdCubit extends Cubit<ForgotPswd> {
  final AuthRepo repo;
  ForgotPswdCubit(this.repo)
      : super(const ForgotPswd(username: '', isloading: false));

//(state.isValidUser == false || state.isOTPSent == false
  void emitUserIdScrn() =>
      emit(state.copyWith(isValidUser: null, isOTPSent: null));
  
  void emitOTPScrn() =>
      emit(state.copyWith(isOTPVerified: null));

  bool validPswd(String pswd, String cnfpswd) =>
      pswd.toLowerCase() == cnfpswd.toLowerCase();

  void checkIsUserExists(String username) async {
    if (username.trim().isEmpty) {
      final failure = Failure.invalidFieldValue('Please enter your User ID');
      emit(state.copyWith(failure: failure));
      _clearState();
    } else {
      try {
        emit(state.copyWith(isloading: true));
        final res = await repo.checkIsUserExists(username);
        res.fold(
          (l) {
            emit(state.copyWith(isloading: false, failure: l, hideOverlay: true));
            _clearState();
          },
          (r) async {
            if (r.value1 == null) {
              emit(
                state.copyWith(
                  username: username,
                  isloading: false,
                  isValidUser: false,
                  hideOverlay: true,
                ),
              );
              _clearState();
            } else if (r.value1 != null && r.value2 == null) {
              emit(
                state.copyWith(
                  isloading: false,
                  username: username,
                  isValidUser: true,
                  hideOverlay: true,
                  isOTPSent: false,
                ),
              );
              _clearState();
            } else {
              final otpres = await repo.sendOTP(r.value2!);
              otpres.fold(
                (lo) => emit(state.copyWith(isloading: false, failure: lo)),
                (ro) {
                  emit(
                    state.copyWith(
                      isloading: false,
                      isOTPSent: true,
                      isValidUser: true,
                      userid: r.value1,
                      username: username,
                      phonenumber: r.value2,
                      hideOverlay: true,
                    ),
                  );
                  _clearState();
                },
              );
            }
          },
        );
      } catch (e, st) {
        logError(e, st);
        final failure = Failure.apiFailure('Can\'t able to validate userid.');
        emit(state.copyWith(failure: failure));
        _clearState();
      }
    }
  }

  void validateOTP(String otp) async {
    try {
      if (otp.trim().isEmpty) {
        final failure = Failure.invalidFieldValue('Please enter OTP..!');
        emit(state.copyWith(isloading: false, failure: failure));
        _clearState();
      } else if (otp.length < 6) {
        final failure = Failure.invalidFieldValue('Please enter valid OTP..!');
        emit(state.copyWith(isloading: false, failure: failure));
        _clearState();
      } else {
        emit(state.copyWith(isloading: true));
        final res = await repo.valdateOTP(state.phonenumber!, otp);
        res.fold(
          (l) {
            emit(state.copyWith(
                isloading: false, failure: l, hideOverlay: true));
            _clearState();
          },
          (r) async {
            if (r) {
              emit(state.copyWith(
                  isloading: false, isOTPVerified: true, hideOverlay: true));
              _clearState();
            } else {
              final failure = Failure.unAuthorized();
              emit(
                state.copyWith(
                  isloading: false,
                  failure: failure,
                  hideOverlay: true,
                  isOTPVerified: false,
                ),
              );
              _clearState();
            }
          },
        );
      }
    } catch (er, st) {
      logError(er, st, '[bloc] Could not validate OTP');
      Failure failure = Failure.apiFailure(er.toString());
      emit(state.copyWith(isloading: false, failure: failure));
      _clearState();
    }
  }

  void changePSWD(String pswd, String cnfpswd) async {
    if (pswd.trim().isEmpty) {
      final failure = Failure.invalidFieldValue('Please enter Password');
      emit(state.copyWith(failure: failure));
      _clearState();
    } else if (cnfpswd.trim().isEmpty) {
      final failure =
          Failure.invalidFieldValue('Please enter Confirm Password');
      emit(state.copyWith(failure: failure));
      _clearState();
    } else if (!validPswd(pswd, cnfpswd)) {
      final failure = Failure.invalidFieldValue(
          'Password & Confirm Password are not matching');
      emit(state.copyWith(failure: failure));
      _clearState();
    } else {
      emit(state.copyWith(isloading: true));
      try {
        final res = await repo.updatePassword(state.username, cnfpswd);
        res.fold(
          (l) {
            emit(state.copyWith(
                isloading: false, isSuccess: false, hideOverlay: true));
            _clearState();
          },
          (r) => emit(state.copyWith(
              isloading: false, isSuccess: true, hideOverlay: true)),
        );
      } catch (e, st) {
        logError(e, st, '[bloc] Could not update password');
        Failure failure = Failure.apiFailure(e.toString());
        emit(state.copyWith(isloading: false, failure: failure));
        _clearState();
      }
    }
  }

  void _clearState() => emit(state.copyWith(failure: null, hideOverlay: null));
}

@freezed
abstract class ForgotPswd with _$ForgotPswd {
  const factory ForgotPswd({
    required String username,
    String? userid,
    Failure? failure,
    required bool isloading,
    bool? isValidUser,
    bool? isOTPSent,
    String? phonenumber,
    bool? isOTPVerified,
    bool? isSuccess,
    bool? hideOverlay,
  }) = _ForgotPswd;
}
