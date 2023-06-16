import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum AppScreen {
  home,
  loans,
  reports
}

@injectable
class AppScreenCubit extends Cubit<AppScreen> {
  AppScreenCubit() : super(AppScreen.home);

  void onScreenChanged(AppScreen screen) {
    emit(screen);
  }

  void emitHomeScreen() => emit(AppScreen.home);
}

extension AppScreenExt on AppScreen {
  static User user() => locator.get<User>();
  int get getIndex {
    if (user().isManager) {
      if (this == AppScreen.home) {
        return 0;
      } else if (this == AppScreen.reports) {
        return 1;
      }
      return 2;
    } else {
      if (this == AppScreen.home) {
        return 0;
      }
      return 1;
    }
  }
}
