import 'package:ez_flutter/features/auth/domain/repo/auth_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'lost_userid.freezed.dart';

@injectable
class LostUseridCubit extends Cubit<LostUserid> {
  final AuthRepo repo;
  LostUseridCubit(this.repo) : super(const LostUserid.initial());

  bool isValidNumber(String number) {
    if (number.length != 10) return false;
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    return numericRegex.hasMatch(number);
  }

  void sendOTP(String number) async {
    if (number.trim().isEmpty) {
      final failure = Failure.invalidFieldValue('Please enter your Mobile Number');
      emit(LostUserid.failure(failure));
    } else if (!isValidNumber(number)) {
      final failure = Failure.invalidFieldValue('Please enter valid Mobile Number');
      emit(LostUserid.failure(failure));
    } else {
      emit(const LostUserid.loading());
      try {
        final res = await repo.sendOTP(number);
        res.fold(
          (l) => emit(LostUserid.failure(l)),
          (r) => emit(LostUserid.sentOTP(number)),
        );
      } catch (e, st) {
        logError(e, st);
        emit(
          LostUserid.failure(
            Failure.apiFailure('cant able to send OTP. Please try again later'),
          ),
        );
      }
    }
  }

  void validateOTP(String mobileNumber, String otp) async {
    try {
      if (otp.trim().isEmpty) {
        final failure = Failure.invalidFieldValue('Please enter OTP..!');
        emit(LostUserid.failure(failure));
      } else if (otp.length < 6) {
        final failure = Failure.invalidFieldValue('Please enter valid OTP..!');
        emit(LostUserid.failure(failure));
      } else {
        emit(const LostUserid.loading());
        final res = await repo.valdateOTP(mobileNumber, otp);
        res.fold(
          (l) => emit(LostUserid.failure(l)),
          (r) async {
            if (r) {
              final userRes = await repo.fetchUserNames(mobileNumber);
              userRes.fold(
                (l) => emit(LostUserid.failure(l)),
                (names) => emit(LostUserid.verifiedOTP(names)),
              );
            } else {
              final failure = Failure.unAuthorized();
              emit(LostUserid.failure(failure));
            }
          },
        );
      }
    } catch (er, st) {
      logError(er, st, '[bloc] Could not validate OTP');
      Failure failure = Failure.apiFailure(er.toString());
      emit(LostUserid.failure(failure));
    }
  }
}

@freezed
class LostUserid with _$LostUserid {
  const factory LostUserid.initial() = _Initial;
  const factory LostUserid.loading() = _Loading;
  const factory LostUserid.sentOTP(String number) = _SendOTP;
  const factory LostUserid.verifiedOTP(List<String> usernames) = _Verified;
  const factory LostUserid.success() = _Success;
  const factory LostUserid.failure(Failure failure) = _Failure;
}
