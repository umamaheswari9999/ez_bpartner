import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple.freezed.dart';

@freezed
class Simple with _$Simple {
  const factory Simple({
    required String id,
    required String title,
  }) = _Simple;
}
