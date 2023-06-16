import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/auth/domain/repo/auth_repo.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthRepo repo;

  SignInCubit({
    required this.repo,
  }) : super(const SignInState.initial());

  void signIn(String username, String password) async {
    emit(const SignInState.loading());

    if (username.trim().isEmpty) {
      emit(SignInState.failure(Failure.invalidFieldValue('Username can not be empty')));
    } else if (password.isEmpty) {
      emit(SignInState.failure(Failure.invalidFieldValue('Password can not be empty')));
    } else {
      final result = await repo.signIn(username, password);
      result.fold(
        (l) => emit(SignInState.failure(l)),
        (r) async {
          if (locator.isRegistered<User>()) {
            locator.unregister<User>();
          }
          locator.registerSingleton<User>(r);

          if (!kIsWeb) {
            await OneSignal.shared.disablePush(false);
          }

          emit(const SignInState.goToHomePage());
        },
      );
    }
  }
}
