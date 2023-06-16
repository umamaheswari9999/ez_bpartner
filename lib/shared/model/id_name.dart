import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_name.freezed.dart';
part 'id_name.g.dart';

@freezed 
class IdName with _$IdName {
  const factory IdName({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
  }) = _IdName;

  const IdName._();

  factory IdName.fromJson(Map<String, dynamic> json) => _$IdNameFromJson(json);
}
