import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/utils/base_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto, BaseDto<UserDto, User> {
  const UserDto._();

  const factory UserDto({
    required String id,
    required String name,
    required String username,
    required String password,
    required String defaultRole,
    @JsonKey(name: 'defaultOrganization') required String defaultOrgId,
    @JsonKey(name: 'organization') required String organizationId,
    @JsonKey(name: 'organization\$_identifier') required String organizationName,
    @JsonKey(name: 'client') required String clientId,
    @JsonKey(name: 'client\$_identifier') required String clientName,
    @JsonKey(name: 'businessPartner') String? businessPartnerId,
    @JsonKey(name: 'businessPartner\$_identifier') String? businessPartnerName,
    @JsonKey(name: 'partnerAddress') String? partnerAddressId,
    @JsonKey(name: 'partnerAddress\$_identifier') String? partnerAddressName,
    @JsonKey(name: 'samIsmanager') required bool isManager,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  @override
  UserDto fromJson(Map<String, dynamic> json) => UserDto.fromJson(json);

  @override
  User toDomain() {
    return User(
      id: id,
      name: name,
      username: username,
      password: password,
      defaultRole: defaultRole,
      defaultOrgId: defaultOrgId,
      organizationId: organizationId,
      organizationName: organizationName,
      businessPartnerId: businessPartnerId,
      businessPartnerName: businessPartnerName,
      clientId: clientId,
      clientName: clientName,
      businessPartnerAddressId: partnerAddressId,
      businessPartnerAddressName: partnerAddressName,
      isManager: isManager,
    );
  }
}