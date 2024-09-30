// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInDto {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this SignInDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInDtoCopyWith<SignInDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInDtoCopyWith<$Res> {
  factory $SignInDtoCopyWith(SignInDto value, $Res Function(SignInDto) then) =
      _$SignInDtoCopyWithImpl<$Res, SignInDto>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$SignInDtoCopyWithImpl<$Res, $Val extends SignInDto>
    implements $SignInDtoCopyWith<$Res> {
  _$SignInDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInDtoImplCopyWith<$Res>
    implements $SignInDtoCopyWith<$Res> {
  factory _$$SignInDtoImplCopyWith(
          _$SignInDtoImpl value, $Res Function(_$SignInDtoImpl) then) =
      __$$SignInDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$SignInDtoImplCopyWithImpl<$Res>
    extends _$SignInDtoCopyWithImpl<$Res, _$SignInDtoImpl>
    implements _$$SignInDtoImplCopyWith<$Res> {
  __$$SignInDtoImplCopyWithImpl(
      _$SignInDtoImpl _value, $Res Function(_$SignInDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$SignInDtoImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$SignInDtoImpl implements _SignInDto {
  _$SignInDtoImpl({required this.username, required this.password});

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInDto(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInDtoImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of SignInDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInDtoImplCopyWith<_$SignInDtoImpl> get copyWith =>
      __$$SignInDtoImplCopyWithImpl<_$SignInDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInDtoImplToJson(
      this,
    );
  }
}

abstract class _SignInDto implements SignInDto {
  factory _SignInDto(
      {required final String username,
      required final String password}) = _$SignInDtoImpl;

  @override
  String get username;
  @override
  String get password;

  /// Create a copy of SignInDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInDtoImplCopyWith<_$SignInDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
