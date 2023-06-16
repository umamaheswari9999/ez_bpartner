import 'package:ez_flutter/features/loans/domain/entity/note.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_dto.g.dart';

part 'note_dto.freezed.dart';

@freezed
class NoteDto with _$NoteDto, BaseDto<NoteDto, Note> {
  const NoteDto._();

  const factory NoteDto({
    required String note,
    @JsonKey(name: 'creationDate') required String createdAt,
    @JsonKey(name: 'createdBy\$_identifier') required String createdBy,
    @JsonKey(name: 'createdBy') required String createdById,
  }) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  @override
  NoteDto fromJson(Map<String, dynamic> json) => NoteDto.fromJson(json);

  @override
  Note toDomain() {
    return Note(
      note: note,
      createdAt: createdAt,
      createdBy: createdBy,
      createdById: createdById,
    );
  }
}