import 'package:ez_flutter/features/loans/domain/entity/attachment.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_dto.freezed.dart';

part 'attachment_dto.g.dart';

@freezed
class AttachmentDto with _$AttachmentDto, BaseDto<AttachmentDto, Attachment> {
  const AttachmentDto._();

  const factory AttachmentDto({
    required String id,
    required String name,
    @JsonKey(defaultValue: '') required String description,
  }) = _AttachmentDto;

  factory AttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDtoFromJson(json);

  @override
  AttachmentDto fromJson(Map<String, dynamic> json) =>
      AttachmentDto.fromJson(json);

  @override
  Attachment toDomain() {
    return Attachment(
      id: id,
      name: name,
      description: description,
    );
  }
}