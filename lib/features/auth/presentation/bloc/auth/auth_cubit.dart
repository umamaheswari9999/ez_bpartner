import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/auth/domain/repo/auth_repo.dart';
import 'package:ez_flutter/local/db/hive_helper.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/usecases/check_user_credentails_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repository;
  final CheckUserCredentialsUseCase checkUserCredentialsUseCase;

  AuthCubit({
    required this.repository,
    required this.checkUserCredentialsUseCase,
  }) : super(const AuthState.initial());

  void checkUserSession() async {
    try {
      final loggedIn = await repository.isUserLoggedIn();
      loggedIn.fold(
        (l) => emit(const AuthState.unAuthenticated()),
        (r) async {
          if (r == false) {
            emit(const AuthState.unAuthenticated());
          } else {
            final result = await repository.getLoggedInUser();
            emit(
              await result.fold(
                (l) => const AuthState.unAuthenticated(),
                (r) async {
                  try {
                    if (locator.isRegistered<User>()) {
                      locator.unregister<User>();
                    }
                    locator.registerSingleton<User>(r);

                    final appStaticData = HiveHelper.getAppStaticData();
                    if (appStaticData == null) {
                      await repository.signOut();
                      return const AuthState.unAuthenticated();
                    }
                    locator.registerSingleton<AppStaticData>(appStaticData);

                    final either = await checkUserCredentialsUseCase.isUserCredentialsAreStillValid();
                    if (either.isLeft()) {
                      await repository.signOut();
                      return const AuthState.unAuthenticated();
                    } else {
                      return const AuthState.authenticated();
                    }
                  } catch (e, st) {
                    await repository.signOut();
                    return const AuthState.unAuthenticated();
                  }
                },
              ),
            );
          }
        },
      );
    } catch (e, st) {
      logError(e, st, '[bloc] authCheckRequested');
      await repository.signOut();
      emit(const AuthState.unAuthenticated());
    }
  }

  void loggedOut() async {
    try {
      await locator.unregister<AppStaticData>();
      await repository.signOut();
      emit(const AuthState.unAuthenticated());
    } catch (e, st) {
      logError(e, st, '[bloc] signedOut');
      emit(const AuthState.unAuthenticated());
    }
  }
}
