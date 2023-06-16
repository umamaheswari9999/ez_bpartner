import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_static_data.freezed.dart';
part 'app_static_data.g.dart';

@freezed
class AppStaticData with _$AppStaticData {
  const AppStaticData._();

  const factory AppStaticData({
    @JsonKey(name: 'panProofTypeId') required String panProofTypeId,
    @JsonKey(name: 'kycOtpLength') required int kycOtpLength,
    @JsonKey(name: 'contactUs') required String contactUsNumber,
    @JsonKey(name: 'contactUsEmail') required String contactUsEmail,
    @JsonKey(name: 'faqUrl') required String faqUrl,
    @JsonKey(name: 'tandcUrl') required String tandcUrl,
    @JsonKey(name: 'qr_baseurl') required String qrCodeBaseUrl,
    @JsonKey(name: 'bpDefaultLoanAccoountType') required String defaultLoanAccountType,
  }) = _AppStaticData;

  factory AppStaticData.fromJson(Map<String, dynamic> json) => _$AppStaticDataFromJson(json);
}
