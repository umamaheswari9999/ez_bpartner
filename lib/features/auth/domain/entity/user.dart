import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  @Assert('name.isNotEmpty', 'name cannot be empty')
  @Assert('password.isNotEmpty', 'password cannot be empty')
  @Assert('defaultRole.isNotEmpty', 'default role cannot be empty')
  @Assert('defaultOrgId.isNotEmpty', 'default organization cannot be empty')
  @Assert('organizationId.isNotEmpty', 'organization id cannot be empty')
  @Assert('organizationName.isNotEmpty', 'organization name cannot be empty')
  // @Assert('businessPartnerId.isNotEmpty', 'business partner id cannot be empty')
  // @Assert('businessPartnerName.isNotEmpty', 'business partner name cannot be empty')
  factory User({
    required String id,
    required String name,
    required String username,
    required String password,
    required String defaultRole,
    required String defaultOrgId,
    required String organizationId,
    required String organizationName,
    required String clientId,
    required String clientName,
    String? businessPartnerId,
    String? businessPartnerName,
    String? businessPartnerAddressId,
    String? businessPartnerAddressName,
    required bool isManager,
  }) = _User;
}

extension UserExtension on User {
  bool get isBPAdmin => isManager;
}
