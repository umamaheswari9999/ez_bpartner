import 'package:ez_flutter/features/notifications/domain/entity/notification.dart';
import 'package:ez_flutter/features/notifications/domain/repository/notification_repository.dart';
import 'package:ez_flutter/shared/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'notification_cubit.freezed.dart';

part 'notification_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.repo) : super(const NotificationsState.initial());

  final NotificationRepository repo;
  final pageLength = 20;

  void fetchInitial() async {
    emit(const NotificationsState.loading());

    var result = await repo.fetchNotifications(0, pageLength);
    result.fold(
      (l) => emit(NotificationsState.failure(l)),
      (r) => emit(
        NotificationsState.success(
          records: r,
          hasReachedMax: r.length < pageLength,
        ),
      ),
    );
  }

  void fetchMore() async {
    state.maybeWhen(
      success: (oldRecord, hasReachedMax) async {
        if (!hasReachedMax) {
          final result = await repo.fetchNotifications(
            oldRecord.length,
            oldRecord.length + pageLength,
          );
          result.fold(
                (f) => emit(NotificationsState.failure(f)),
                (r) => emit(
              NotificationsState.success(
                records: oldRecord + r,
                hasReachedMax: r.length < pageLength,
              ),
            ),
          );
        }
      },
      orElse: () {}
    );
  }
}
