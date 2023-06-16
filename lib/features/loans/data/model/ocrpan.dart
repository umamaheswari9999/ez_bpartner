import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocrpan.freezed.dart';
part 'ocrpan.g.dart';

@freezed
class OCRPan with _$OCRPan {
  const OCRPan._();
  factory OCRPan({
    required String name,
    String? dob,
    String? gender,
    @JsonKey(name: 'fathers_name', defaultValue: '') String? fathersName,
    @JsonKey(name: 'id_no', defaultValue: '') required String idNo,
    @JsonKey(name: 'id_type') required String idtype,
  }) = _OCRPan;

  factory OCRPan.fromJson(Map<String, dynamic> json) => _$OCRPanFromJson(json);
}

extension OCRPanEXT on OCRPan {
  bool get isPAN => idtype.toLowerCase() == 'pan';

  String getGender() {
    if (gender == null) {
      return '';
    } else if (gender?.trim().toLowerCase() == 'male') {
      return 'M';
    } else if (gender?.trim().toLowerCase() == 'female') {
      return 'F';
    } else {
      return 'T';
    }
  }
}
