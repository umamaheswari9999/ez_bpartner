part of 'notification_cubit.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _NotificationsInitial;

  const factory NotificationsState.loading() = _NotificationsLoading;

  const factory NotificationsState.success({
    required List<Notification> records,
    required bool hasReachedMax,
  }) = _NotificationsSuccess;

  const factory NotificationsState.failure(Failure failure) =
      _NotificationsFailure;
}
