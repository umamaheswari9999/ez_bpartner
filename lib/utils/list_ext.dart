import 'package:ez_flutter/utils/base_dto.dart';

extension ListParsing on List<dynamic> {
  List<T> parseJsonList<T>(T Function(Map<String, dynamic> json) fromJson) {
    List<T> result = [];
    for (final obj in this) {
      result.add(fromJson(obj as Map<String, dynamic>));
    }
    return result;
  }

  T parseSingle<T>(T Function(Map<String, dynamic> json) fromJson) {
    return parseJsonList(fromJson).first;
  }
}

extension DtoListToDomainList<T extends BaseDto, V> on List<T> {
  List<V> toDomainList() {
    List<V> result = [];
    for (final obj in this) {
      result.add(obj.toDomain() as V);
    }
    return result;
  }
}