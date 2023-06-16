import 'package:dartz/dartz.dart';
import 'package:ez_flutter/features/notifications/domain/entity/notification.dart';
import 'package:ez_flutter/shared/failure.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> fetchNotifications(int start, int end);
  Future<Either<Failure, bool>> subscribeForPushNotifications(String deviceId);
  Future<Either<Failure, bool>> unSubscribeFromPushNotifications(String deviceId);
}
