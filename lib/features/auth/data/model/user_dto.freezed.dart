// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get defaultRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultOrganization')
  String get defaultOrgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization\$_identifier')
  String get organizationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'client')
  String get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'client\$_identifier')
  String get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessPartner')
  String? get businessPartnerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessPartner\$_identifier')
  String? get businessPartnerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'partnerAddress')
  String? get partnerAddressId => throw _privateConstructorUsedError;
  @JsonKey(name: 'partnerAddress\$_identifier')
  String? get partnerAddressName => throw _privateConstructorUsedError;
  @JsonKey(name: 'samIsmanager')
  bool get isManager => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String username,
      String password,
      String defaultRole,
      @JsonKey(name: 'defaultOrganization')
          String defaultOrgId,
      @JsonKey(name: 'organization')
          String organizationId,
      @JsonKey(name: 'organization\$_identifier')
          String organizationName,
      @JsonKey(name: 'client')
          String clientId,
      @JsonKey(name: 'client\$_identifier')
          String clientName,
      @JsonKey(name: 'businessPartner')
          String? businessPartnerId,
      @JsonKey(name: 'businessPartner\$_identifier')
          String? businessPartnerName,
      @JsonKey(name: 'partnerAddress')
          String? partnerAddressId,
      @JsonKey(name: 'partnerAddress\$_identifier')
          String? partnerAddressName,
      @JsonKey(name: 'samIsmanager')
          bool isManager});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? password = null,
    Object? defaultRole = null,
    Object? defaultOrgId = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? businessPartnerId = freezed,
    Object? businessPartnerName = freezed,
    Object? partnerAddressId = freezed,
    Object? partnerAddressName = freezed,
    Object? isManager = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRole: null == defaultRole
          ? _value.defaultRole
          : defaultRole // ignore: cast_nullable_to_non_nullable
              as String,
      defaultOrgId: null == defaultOrgId
          ? _value.defaultOrgId
          : defaultOrgId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPartnerId: freezed == businessPartnerId
          ? _value.businessPartnerId
          : businessPartnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPartnerName: freezed == businessPartnerName
          ? _value.businessPartnerName
          : businessPartnerName // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerAddressId: freezed == partnerAddressId
          ? _value.partnerAddressId
          : partnerAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerAddressName: freezed == partnerAddressName
          ? _value.partnerAddressName
          : partnerAddressName // ignore: cast_nullable_to_non_nullable
              as String?,
      isManager: null == isManager
          ? _value.isManager
          : isManager // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$_UserDtoCopyWith(
          _$_UserDto value, $Res Function(_$_UserDto) then) =
      __$$_UserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String username,
      String password,
      String defaultRole,
      @JsonKey(name: 'defaultOrganization')
          String defaultOrgId,
      @JsonKey(name: 'organization')
          String organizationId,
      @JsonKey(name: 'organization\$_identifier')
          String organizationName,
      @JsonKey(name: 'client')
          String clientId,
      @JsonKey(name: 'client\$_identifier')
          String clientName,
      @JsonKey(name: 'businessPartner')
          String? businessPartnerId,
      @JsonKey(name: 'businessPartner\$_identifier')
          String? businessPartnerName,
      @JsonKey(name: 'partnerAddress')
          String? partnerAddressId,
      @JsonKey(name: 'partnerAddress\$_identifier')
          String? partnerAddressName,
      @JsonKey(name: 'samIsmanager')
          bool isManager});
}

/// @nodoc
class __$$_UserDtoCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$_UserDto>
    implements _$$_UserDtoCopyWith<$Res> {
  __$$_UserDtoCopyWithImpl(_$_UserDto _value, $Res Function(_$_UserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? password = null,
    Object? defaultRole = null,
    Object? defaultOrgId = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? clientId = null,
    Object? clientName = null,
    Object? businessPartnerId = freezed,
    Object? businessPartnerName = freezed,
    Object? partnerAddressId = freezed,
    Object? partnerAddressName = freezed,
    Object? isManager = null,
  }) {
    return _then(_$_UserDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRole: null == defaultRole
          ? _value.defaultRole
          : defaultRole // ignore: cast_nullable_to_non_nullable
              as String,
      defaultOrgId: null == defaultOrgId
          ? _value.defaultOrgId
          : defaultOrgId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      businessPartnerId: freezed == businessPartnerId
          ? _value.businessPartnerId
          : businessPartnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPartnerName: freezed == businessPartnerName
          ? _value.businessPartnerName
          : businessPartnerName // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerAddressId: freezed == partnerAddressId
          ? _value.partnerAddressId
          : partnerAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerAddressName: freezed == partnerAddressName
          ? _value.partnerAddressName
          : partnerAddressName // ignore: cast_nullable_to_non_nullable
              as String?,
      isManager: null == isManager
          ? _value.isManager
          : isManager // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {required this.id,
      required this.name,
      required this.username,
      required this.password,
      required this.defaultRole,
      @JsonKey(name: 'defaultOrganization')
          required this.defaultOrgId,
      @JsonKey(name: 'organization')
          required this.organizationId,
      @JsonKey(name: 'organization\$_identifier')
          required this.organizationName,
      @JsonKey(name: 'client')
          required this.clientId,
      @JsonKey(name: 'client\$_identifier')
          required this.clientName,
      @JsonKey(name: 'businessPartner')
          this.businessPartnerId,
      @JsonKey(name: 'businessPartner\$_identifier')
          this.businessPartnerName,
      @JsonKey(name: 'partnerAddress')
          this.partnerAddressId,
      @JsonKey(name: 'partnerAddress\$_identifier')
          this.partnerAddressName,
      @JsonKey(name: 'samIsmanager')
          required this.isManager})
      : super._();

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String password;
  @override
  final String defaultRole;
  @override
  @JsonKey(name: 'defaultOrganization')
  final String defaultOrgId;
  @override
  @JsonKey(name: 'organization')
  final String organizationId;
  @override
  @JsonKey(name: 'organization\$_identifier')
  final String organizationName;
  @override
  @JsonKey(name: 'client')
  final String clientId;
  @override
  @JsonKey(name: 'client\$_identifier')
  final String clientName;
  @override
  @JsonKey(name: 'businessPartner')
  final String? businessPartnerId;
  @override
  @JsonKey(name: 'businessPartner\$_identifier')
  final String? businessPartnerName;
  @override
  @JsonKey(name: 'partnerAddress')
  final String? partnerAddressId;
  @override
  @JsonKey(name: 'partnerAddress\$_identifier')
  final String? partnerAddressName;
  @override
  @JsonKey(name: 'samIsmanager')
  final bool isManager;

  @override
  String toString() {
    return 'UserDto(id: $id, name: $name, username: $username, password: $password, defaultRole: $defaultRole, defaultOrgId: $defaultOrgId, organizationId: $organizationId, organizationName: $organizationName, clientId: $clientId, clientName: $clientName, businessPartnerId: $businessPartnerId, businessPartnerName: $businessPartnerName, partnerAddressId: $partnerAddressId, partnerAddressName: $partnerAddressName, isManager: $isManager)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.defaultRole, defaultRole) ||
                other.defaultRole == defaultRole) &&
            (identical(other.defaultOrgId, defaultOrgId) ||
                other.defaultOrgId == defaultOrgId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.businessPartnerId, businessPartnerId) ||
                other.businessPartnerId == businessPartnerId) &&
            (identical(other.businessPartnerName, businessPartnerName) ||
                other.businessPartnerName == businessPartnerName) &&
            (identical(other.partnerAddressId, partnerAddressId) ||
                other.partnerAddressId == partnerAddressId) &&
            (identical(other.partnerAddressName, partnerAddressName) ||
                other.partnerAddressName == partnerAddressName) &&
            (identical(other.isManager, isManager) ||
                other.isManager == isManager));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      username,
      password,
      defaultRole,
      defaultOrgId,
      organizationId,
      organizationName,
      clientId,
      clientName,
      businessPartnerId,
      businessPartnerName,
      partnerAddressId,
      partnerAddressName,
      isManager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      __$$_UserDtoCopyWithImpl<_$_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDtoToJson(
      this,
    );
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {required final String id,
      required final String name,
      required final String username,
      required final String password,
      required final String defaultRole,
      @JsonKey(name: 'defaultOrganization')
          required final String defaultOrgId,
      @JsonKey(name: 'organization')
          required final String organizationId,
      @JsonKey(name: 'organization\$_identifier')
          required final String organizationName,
      @JsonKey(name: 'client')
          required final String clientId,
      @JsonKey(name: 'client\$_identifier')
          required final String clientName,
      @JsonKey(name: 'businessPartner')
          final String? businessPartnerId,
      @JsonKey(name: 'businessPartner\$_identifier')
          final String? businessPartnerName,
      @JsonKey(name: 'partnerAddress')
          final String? partnerAddressId,
      @JsonKey(name: 'partnerAddress\$_identifier')
          final String? partnerAddressName,
      @JsonKey(name: 'samIsmanager')
          required final bool isManager}) = _$_UserDto;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get password;
  @override
  String get defaultRole;
  @override
  @JsonKey(name: 'defaultOrganization')
  String get defaultOrgId;
  @override
  @JsonKey(name: 'organization')
  String get organizationId;
  @override
  @JsonKey(name: 'organization\$_identifier')
  String get organizationName;
  @override
  @JsonKey(name: 'client')
  String get clientId;
  @override
  @JsonKey(name: 'client\$_identifier')
  String get clientName;
  @override
  @JsonKey(name: 'businessPartner')
  String? get businessPartnerId;
  @override
  @JsonKey(name: 'businessPartner\$_identifier')
  String? get businessPartnerName;
  @override
  @JsonKey(name: 'partnerAddress')
  String? get partnerAddressId;
  @override
  @JsonKey(name: 'partnerAddress\$_identifier')
  String? get partnerAddressName;
  @override
  @JsonKey(name: 'samIsmanager')
  bool get isManager;
  @override
  @JsonKey(ignore: true)
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
