import 'package:ez_flutter/features/auth/data/model/user_dto.dart';
import 'package:ez_flutter/features/notifications/domain/entity/notification.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
class NotificationDto with _$NotificationDto, BaseDto<NotificationDto, Notification> {
  const NotificationDto._();

  @JsonSerializable(explicitToJson: true)
  const factory NotificationDto({
    required String title,
    required String body,
    required String creationDate,
  }) = _NotificationDto;

  factory NotificationDto.fromDomain(Notification notification) {
    return NotificationDto(
      title: notification.title,
      body: notification.body,
      creationDate: notification.creationDate,
    );
  }

  @override
  Notification toDomain() {
    return Notification(
      title: title,
      body: body,
      creationDate: this.creationDate,
    );
  }

  factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => NotificationDto.fromJson(json);
}
