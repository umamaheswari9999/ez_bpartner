import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_count.freezed.dart';
part 'status_count.g.dart';

@freezed
class StatusCount with _$StatusCount {
  const StatusCount._();
  factory StatusCount({
    required String count,
    required String status,
  }) = _GraphData;

  factory StatusCount.fromJson(Map<String, dynamic> json) =>
      _$StatusCountFromJson(json);
}
