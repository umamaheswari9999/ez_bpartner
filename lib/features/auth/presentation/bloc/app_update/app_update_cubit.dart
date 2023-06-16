import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:ez_flutter/shared/usecases/app_version_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_update_cubit.freezed.dart';

@injectable
class AppUpdateCubit extends Cubit<AppUpdateState> {
  final AppVersionUseCase usecase;
  AppUpdateCubit(this.usecase) : super(const AppUpdateState.initial());

  void checkForAppupdate() async {
    emit(const AppUpdateState.loading());
    try {
      final updateAvailable = await usecase.isUpdateAvailable();
      if (kIsWeb) {
        emit(const AppUpdateState.noUpdateAvailable());
      } else {
        if (updateAvailable) {
          emit(const AppUpdateState.updateAvailable());
        } else {
          emit(const AppUpdateState.noUpdateAvailable());
        }
      }
    } catch (e, st) {
      logError(e, st, '[bloc] cant able to check for update');
      emit(const AppUpdateState.updateAvailable());
    }
  }
}

@freezed
class AppUpdateState with _$AppUpdateState {
  const factory AppUpdateState.initial() = _Initial;
  const factory AppUpdateState.loading() = _Loading;
  const factory AppUpdateState.updateAvailable() = _UpdateAvailable;
  const factory AppUpdateState.noUpdateAvailable() = _NOUpdateAvailable;
  const factory AppUpdateState.failure(Failure failure) = _Failure;
}
