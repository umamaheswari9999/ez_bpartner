import 'package:dartz/dartz.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/shared/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> isUserLoggedIn();
  Future<Either<Failure, User>> getLoggedInUser();
  Future<Either<Failure, User>> signIn(String username, String password);
  Future<Either<Failure, bool>> signOut();
  
  /// Actions releated to LostUserID
  Future<Either<Failure, bool>> sendOTP(String phonenumber);
  Future<Either<Failure, bool>> valdateOTP(String mobileNumber, String otp);
  Future<Either<Failure, List<String>>> fetchUserNames(String mobileNumber);

  /// Actions related to ForgotPassword
  Future<Either<Failure, Tuple2<String?,String?>>> checkIsUserExists(String username);

  Future<Either<Failure, bool>> updatePassword(String userid, String cnfpswd);
}
