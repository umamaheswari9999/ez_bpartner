import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final locator = GetIt.instance;

@injectableInit

void configureInjection(String env) => locator.init(environment: env);

extension ContextExtension on BuildContext {
  User user() => locator.get<User>();
}