// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) {
  return _CustomerDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerDto {
  @JsonKey(name: 'ClientMaster_Header')
  ClientMasterDto get master => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientMaster_Locations')
  List<CustomerLocationDto> get locations => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientMaster_Bank')
  List<CustomerBankDto> get banks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientMaster_Mandates')
  List<CustomerMandateDto> get mandates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDtoCopyWith<CustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDtoCopyWith<$Res> {
  factory $CustomerDtoCopyWith(
          CustomerDto value, $Res Function(CustomerDto) then) =
      _$CustomerDtoCopyWithImpl<$Res, CustomerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientMaster_Header')
          ClientMasterDto master,
      @JsonKey(name: 'ClientMaster_Locations')
          List<CustomerLocationDto> locations,
      @JsonKey(name: 'ClientMaster_Bank')
          List<CustomerBankDto> banks,
      @JsonKey(name: 'ClientMaster_Mandates')
          List<CustomerMandateDto> mandates});

  $ClientMasterDtoCopyWith<$Res> get master;
}

/// @nodoc
class _$CustomerDtoCopyWithImpl<$Res, $Val extends CustomerDto>
    implements $CustomerDtoCopyWith<$Res> {
  _$CustomerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? master = null,
    Object? locations = null,
    Object? banks = null,
    Object? mandates = null,
  }) {
    return _then(_value.copyWith(
      master: null == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as ClientMasterDto,
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<CustomerLocationDto>,
      banks: null == banks
          ? _value.banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<CustomerBankDto>,
      mandates: null == mandates
          ? _value.mandates
          : mandates // ignore: cast_nullable_to_non_nullable
              as List<CustomerMandateDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientMasterDtoCopyWith<$Res> get master {
    return $ClientMasterDtoCopyWith<$Res>(_value.master, (value) {
      return _then(_value.copyWith(master: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerDtoCopyWith<$Res>
    implements $CustomerDtoCopyWith<$Res> {
  factory _$$_CustomerDtoCopyWith(
          _$_CustomerDto value, $Res Function(_$_CustomerDto) then) =
      __$$_CustomerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientMaster_Header')
          ClientMasterDto master,
      @JsonKey(name: 'ClientMaster_Locations')
          List<CustomerLocationDto> locations,
      @JsonKey(name: 'ClientMaster_Bank')
          List<CustomerBankDto> banks,
      @JsonKey(name: 'ClientMaster_Mandates')
          List<CustomerMandateDto> mandates});

  @override
  $ClientMasterDtoCopyWith<$Res> get master;
}

/// @nodoc
class __$$_CustomerDtoCopyWithImpl<$Res>
    extends _$CustomerDtoCopyWithImpl<$Res, _$_CustomerDto>
    implements _$$_CustomerDtoCopyWith<$Res> {
  __$$_CustomerDtoCopyWithImpl(
      _$_CustomerDto _value, $Res Function(_$_CustomerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? master = null,
    Object? locations = null,
    Object? banks = null,
    Object? mandates = null,
  }) {
    return _then(_$_CustomerDto(
      master: null == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as ClientMasterDto,
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<CustomerLocationDto>,
      banks: null == banks
          ? _value._banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<CustomerBankDto>,
      mandates: null == mandates
          ? _value._mandates
          : mandates // ignore: cast_nullable_to_non_nullable
              as List<CustomerMandateDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerDto extends _CustomerDto {
  const _$_CustomerDto(
      {@JsonKey(name: 'ClientMaster_Header')
          required this.master,
      @JsonKey(name: 'ClientMaster_Locations')
          required final List<CustomerLocationDto> locations,
      @JsonKey(name: 'ClientMaster_Bank')
          required final List<CustomerBankDto> banks,
      @JsonKey(name: 'ClientMaster_Mandates')
          required final List<CustomerMandateDto> mandates})
      : _locations = locations,
        _banks = banks,
        _mandates = mandates,
        super._();

  factory _$_CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerDtoFromJson(json);

  @override
  @JsonKey(name: 'ClientMaster_Header')
  final ClientMasterDto master;
  final List<CustomerLocationDto> _locations;
  @override
  @JsonKey(name: 'ClientMaster_Locations')
  List<CustomerLocationDto> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<CustomerBankDto> _banks;
  @override
  @JsonKey(name: 'ClientMaster_Bank')
  List<CustomerBankDto> get banks {
    if (_banks is EqualUnmodifiableListView) return _banks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banks);
  }

  final List<CustomerMandateDto> _mandates;
  @override
  @JsonKey(name: 'ClientMaster_Mandates')
  List<CustomerMandateDto> get mandates {
    if (_mandates is EqualUnmodifiableListView) return _mandates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mandates);
  }

  @override
  String toString() {
    return 'CustomerDto(master: $master, locations: $locations, banks: $banks, mandates: $mandates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerDto &&
            (identical(other.master, master) || other.master == master) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            const DeepCollectionEquality().equals(other._banks, _banks) &&
            const DeepCollectionEquality().equals(other._mandates, _mandates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      master,
      const DeepCollectionEquality().hash(_locations),
      const DeepCollectionEquality().hash(_banks),
      const DeepCollectionEquality().hash(_mandates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerDtoCopyWith<_$_CustomerDto> get copyWith =>
      __$$_CustomerDtoCopyWithImpl<_$_CustomerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerDtoToJson(
      this,
    );
  }
}

abstract class _CustomerDto extends CustomerDto {
  const factory _CustomerDto(
      {@JsonKey(name: 'ClientMaster_Header')
          required final ClientMasterDto master,
      @JsonKey(name: 'ClientMaster_Locations')
          required final List<CustomerLocationDto> locations,
      @JsonKey(name: 'ClientMaster_Bank')
          required final List<CustomerBankDto> banks,
      @JsonKey(name: 'ClientMaster_Mandates')
          required final List<CustomerMandateDto> mandates}) = _$_CustomerDto;
  const _CustomerDto._() : super._();

  factory _CustomerDto.fromJson(Map<String, dynamic> json) =
      _$_CustomerDto.fromJson;

  @override
  @JsonKey(name: 'ClientMaster_Header')
  ClientMasterDto get master;
  @override
  @JsonKey(name: 'ClientMaster_Locations')
  List<CustomerLocationDto> get locations;
  @override
  @JsonKey(name: 'ClientMaster_Bank')
  List<CustomerBankDto> get banks;
  @override
  @JsonKey(name: 'ClientMaster_Mandates')
  List<CustomerMandateDto> get mandates;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerDtoCopyWith<_$_CustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
