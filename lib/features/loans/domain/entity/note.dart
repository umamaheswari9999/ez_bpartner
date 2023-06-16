import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required String note,
    required String createdAt,
    required String createdBy,
    required String createdById,
  }) = _Note;
}


extension NoteExt on Note {
  bool createdByMe() {
    var user = locator.get<User>();
    return user.id == createdById;
  }
}