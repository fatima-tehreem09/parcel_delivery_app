// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpDto {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get confirmPassword => throw _privateConstructorUsedError;

  /// Serializes this SignUpDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpDtoCopyWith<SignUpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDtoCopyWith<$Res> {
  factory $SignUpDtoCopyWith(SignUpDto value, $Res Function(SignUpDto) then) =
      _$SignUpDtoCopyWithImpl<$Res, SignUpDto>;
  @useResult
  $Res call(
      {String email,
      String name,
      String phone,
      @JsonKey(includeIfNull: false) String? password,
      @JsonKey(includeIfNull: false) String? confirmPassword});
}

/// @nodoc
class _$SignUpDtoCopyWithImpl<$Res, $Val extends SignUpDto>
    implements $SignUpDtoCopyWith<$Res> {
  _$SignUpDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpDtoImplCopyWith<$Res>
    implements $SignUpDtoCopyWith<$Res> {
  factory _$$SignUpDtoImplCopyWith(
          _$SignUpDtoImpl value, $Res Function(_$SignUpDtoImpl) then) =
      __$$SignUpDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String name,
      String phone,
      @JsonKey(includeIfNull: false) String? password,
      @JsonKey(includeIfNull: false) String? confirmPassword});
}

/// @nodoc
class __$$SignUpDtoImplCopyWithImpl<$Res>
    extends _$SignUpDtoCopyWithImpl<$Res, _$SignUpDtoImpl>
    implements _$$SignUpDtoImplCopyWith<$Res> {
  __$$SignUpDtoImplCopyWithImpl(
      _$SignUpDtoImpl _value, $Res Function(_$SignUpDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_$SignUpDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$SignUpDtoImpl implements _SignUpDto {
  _$SignUpDtoImpl(
      {required this.email,
      required this.name,
      required this.phone,
      @JsonKey(includeIfNull: false) this.password,
      @JsonKey(includeIfNull: false) this.confirmPassword});

  @override
  final String email;
  @override
  final String name;
  @override
  final String phone;
  @override
  @JsonKey(includeIfNull: false)
  final String? password;
  @override
  @JsonKey(includeIfNull: false)
  final String? confirmPassword;

  @override
  String toString() {
    return 'SignUpDto(email: $email, name: $name, phone: $phone, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, phone, password, confirmPassword);

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpDtoImplCopyWith<_$SignUpDtoImpl> get copyWith =>
      __$$SignUpDtoImplCopyWithImpl<_$SignUpDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpDtoImplToJson(
      this,
    );
  }
}

abstract class _SignUpDto implements SignUpDto {
  factory _SignUpDto(
          {required final String email,
          required final String name,
          required final String phone,
          @JsonKey(includeIfNull: false) final String? password,
          @JsonKey(includeIfNull: false) final String? confirmPassword}) =
      _$SignUpDtoImpl;

  @override
  String get email;
  @override
  String get name;
  @override
  String get phone;
  @override
  @JsonKey(includeIfNull: false)
  String? get password;
  @override
  @JsonKey(includeIfNull: false)
  String? get confirmPassword;

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpDtoImplCopyWith<_$SignUpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
