import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';

User getLoggedInUser() => locator.get<User>();