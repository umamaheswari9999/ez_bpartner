import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/notifications/data/modal/notification_dto.dart';
import 'package:ez_flutter/features/notifications/domain/entity/notification.dart';
import 'package:ez_flutter/features/notifications/domain/repository/notification_repository.dart';
import 'package:ez_flutter/network/api_helper.dart';
import 'package:ez_flutter/constants/constants.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:ez_flutter/shared/locator.dart';
import 'package:ez_flutter/shared/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:ez_flutter/utils/list_ext.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepoImpl implements NotificationRepository {
  final ApiHelper api;

  static const subscribe = "device.subscribe";
  static const unSubscribe = "device.unsubscribe";

  NotificationRepoImpl(this.api);

  @override
  Future<Either<Failure, List<Notification>>> fetchNotifications(int start, int end) async {
    const defErrMsg = 'could not fetch notifications';
    try {
      final user = getLoggedInUser();
      const entityName = Entities.pushNotification;
      final url =
          "${Constants.baseDefaultApiUrl}/$entityName?_where=user='${user.id}'&_sortBy=creationDate desc&_startRow=$start&_endRow=$end";

      final result = await api.get(url, defErrMsg);

      return result.fold(
        (l) => left(l),
        (r) {
          final dtos = r.parseJsonList(NotificationDto.fromJson);
          final domainList =
              DtoListToDomainList<NotificationDto, Notification>(dtos)
                  .toDomainList();
          return right(domainList);
        },
      );
    } catch (e, st) {
      logError(e, st, defErrMsg);
      return left(Failure.unknownFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> subscribeForPushNotifications(
          String deviceId) =>
      subscribeOrUnsubscribe(deviceId, subscribe);

  @override
  Future<Either<Failure, bool>> unSubscribeFromPushNotifications(
          String deviceId) =>
      subscribeOrUnsubscribe(deviceId, unSubscribe);

  Future<Either<Failure, bool>> subscribeOrUnsubscribe(String userId, String action) async {
    final defErrMsg = 'Could not complete action: $action';
    try {
      final loggedInUser = locator.get<User>();

      final reqBodyProfile = json.encode({
        "data": {
          "action": action,
          "user_id": loggedInUser.id,
          "device_token": userId
        }
      });

      const url = "${Constants.baseCustomApiUrl}/${CustomWebServices.pushNotification}";
      final result = await api.post(url, reqBodyProfile, defErrMsg);
      return result.fold((l) => left(l), (r) => right(true));
    } catch (e, st) {
      logError(e, st, 'could not complete push action: $action');
    }
    return left(Failure.serverFailure(Constants.repoException, defErrMsg));
  }
}
