// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get accessToken => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({String accessToken, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? user = null,
  }) {
    return _then(_$UserModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({required this.accessToken, required this.user});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final User user;

  @override
  String toString() {
    return 'UserModel(accessToken: $accessToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, user);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String accessToken,
      required final User user}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  User get user;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_earning', includeIfNull: false)
  int? get totalEarning => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_model', includeIfNull: false)
  String? get vehicleModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_plate_number', includeIfNull: false)
  String? get licensePlateNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v', includeIfNull: false)
  int? get v => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  Info? get info => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String email,
      String phone,
      String role,
      @JsonKey(name: 'total_earning', includeIfNull: false) int? totalEarning,
      @JsonKey(name: 'vehicle_model', includeIfNull: false)
      String? vehicleModel,
      @JsonKey(name: 'license_plate_number', includeIfNull: false)
      String? licensePlateNumber,
      String status,
      @JsonKey(includeIfNull: false) DateTime? createdAt,
      @JsonKey(includeIfNull: false) DateTime? updatedAt,
      @JsonKey(name: '__v', includeIfNull: false) int? v,
      @JsonKey(includeIfNull: false) Info? info});

  $InfoCopyWith<$Res>? get info;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phone = null,
    Object? role = null,
    Object? totalEarning = freezed,
    Object? vehicleModel = freezed,
    Object? licensePlateNumber = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      totalEarning: freezed == totalEarning
          ? _value.totalEarning
          : totalEarning // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleModel: freezed == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlateNumber: freezed == licensePlateNumber
          ? _value.licensePlateNumber
          : licensePlateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info?,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoCopyWith<$Res>? get info {
    if (_value.info == null) {
      return null;
    }

    return $InfoCopyWith<$Res>(_value.info!, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String email,
      String phone,
      String role,
      @JsonKey(name: 'total_earning', includeIfNull: false) int? totalEarning,
      @JsonKey(name: 'vehicle_model', includeIfNull: false)
      String? vehicleModel,
      @JsonKey(name: 'license_plate_number', includeIfNull: false)
      String? licensePlateNumber,
      String status,
      @JsonKey(includeIfNull: false) DateTime? createdAt,
      @JsonKey(includeIfNull: false) DateTime? updatedAt,
      @JsonKey(name: '__v', includeIfNull: false) int? v,
      @JsonKey(includeIfNull: false) Info? info});

  @override
  $InfoCopyWith<$Res>? get info;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phone = null,
    Object? role = null,
    Object? totalEarning = freezed,
    Object? vehicleModel = freezed,
    Object? licensePlateNumber = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? info = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      totalEarning: freezed == totalEarning
          ? _value.totalEarning
          : totalEarning // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleModel: freezed == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlateNumber: freezed == licensePlateNumber
          ? _value.licensePlateNumber
          : licensePlateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.email,
      required this.phone,
      required this.role,
      @JsonKey(name: 'total_earning', includeIfNull: false) this.totalEarning,
      @JsonKey(name: 'vehicle_model', includeIfNull: false) this.vehicleModel,
      @JsonKey(name: 'license_plate_number', includeIfNull: false)
      this.licensePlateNumber,
      required this.status,
      @JsonKey(includeIfNull: false) this.createdAt,
      @JsonKey(includeIfNull: false) this.updatedAt,
      @JsonKey(name: '__v', includeIfNull: false) this.v,
      @JsonKey(includeIfNull: false) this.info});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String role;
  @override
  @JsonKey(name: 'total_earning', includeIfNull: false)
  final int? totalEarning;
  @override
  @JsonKey(name: 'vehicle_model', includeIfNull: false)
  final String? vehicleModel;
  @override
  @JsonKey(name: 'license_plate_number', includeIfNull: false)
  final String? licensePlateNumber;
  @override
  final String status;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;
  @override
  @JsonKey(name: '__v', includeIfNull: false)
  final int? v;
  @override
  @JsonKey(includeIfNull: false)
  final Info? info;

  @override
  String toString() {
    return 'User(id: $id, email: $email, phone: $phone, role: $role, totalEarning: $totalEarning, vehicleModel: $vehicleModel, licensePlateNumber: $licensePlateNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.totalEarning, totalEarning) ||
                other.totalEarning == totalEarning) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel) &&
            (identical(other.licensePlateNumber, licensePlateNumber) ||
                other.licensePlateNumber == licensePlateNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      phone,
      role,
      totalEarning,
      vehicleModel,
      licensePlateNumber,
      status,
      createdAt,
      updatedAt,
      v,
      info);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: '_id') required final String id,
      required final String email,
      required final String phone,
      required final String role,
      @JsonKey(name: 'total_earning', includeIfNull: false)
      final int? totalEarning,
      @JsonKey(name: 'vehicle_model', includeIfNull: false)
      final String? vehicleModel,
      @JsonKey(name: 'license_plate_number', includeIfNull: false)
      final String? licensePlateNumber,
      required final String status,
      @JsonKey(includeIfNull: false) final DateTime? createdAt,
      @JsonKey(includeIfNull: false) final DateTime? updatedAt,
      @JsonKey(name: '__v', includeIfNull: false) final int? v,
      @JsonKey(includeIfNull: false) final Info? info}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get role;
  @override
  @JsonKey(name: 'total_earning', includeIfNull: false)
  int? get totalEarning;
  @override
  @JsonKey(name: 'vehicle_model', includeIfNull: false)
  String? get vehicleModel;
  @override
  @JsonKey(name: 'license_plate_number', includeIfNull: false)
  String? get licensePlateNumber;
  @override
  String get status;
  @override
  @JsonKey(includeIfNull: false)
  DateTime? get createdAt;
  @override
  @JsonKey(includeIfNull: false)
  DateTime? get updatedAt;
  @override
  @JsonKey(name: '__v', includeIfNull: false)
  int? get v;
  @override
  @JsonKey(includeIfNull: false)
  Info? get info;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Info _$InfoFromJson(Map<String, dynamic> json) {
  return _Info.fromJson(json);
}

/// @nodoc
mixin _$Info {
  String get iss => throw _privateConstructorUsedError;
  String get aud => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_time')
  int get authTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get sub => throw _privateConstructorUsedError;
  int get iat => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  bool get emailVerified => throw _privateConstructorUsedError;
  Firebase get firebase => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  /// Serializes this Info to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Info
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoCopyWith<Info> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoCopyWith<$Res> {
  factory $InfoCopyWith(Info value, $Res Function(Info) then) =
      _$InfoCopyWithImpl<$Res, Info>;
  @useResult
  $Res call(
      {String iss,
      String aud,
      @JsonKey(name: 'auth_time') int authTime,
      @JsonKey(name: 'user_id') String userId,
      String sub,
      int iat,
      int exp,
      String email,
      @JsonKey(name: 'email_verified') bool emailVerified,
      Firebase firebase,
      String uid});

  $FirebaseCopyWith<$Res> get firebase;
}

/// @nodoc
class _$InfoCopyWithImpl<$Res, $Val extends Info>
    implements $InfoCopyWith<$Res> {
  _$InfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Info
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iss = null,
    Object? aud = null,
    Object? authTime = null,
    Object? userId = null,
    Object? sub = null,
    Object? iat = null,
    Object? exp = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? firebase = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      iss: null == iss
          ? _value.iss
          : iss // ignore: cast_nullable_to_non_nullable
              as String,
      aud: null == aud
          ? _value.aud
          : aud // ignore: cast_nullable_to_non_nullable
              as String,
      authTime: null == authTime
          ? _value.authTime
          : authTime // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      iat: null == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      firebase: null == firebase
          ? _value.firebase
          : firebase // ignore: cast_nullable_to_non_nullable
              as Firebase,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Info
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirebaseCopyWith<$Res> get firebase {
    return $FirebaseCopyWith<$Res>(_value.firebase, (value) {
      return _then(_value.copyWith(firebase: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InfoImplCopyWith<$Res> implements $InfoCopyWith<$Res> {
  factory _$$InfoImplCopyWith(
          _$InfoImpl value, $Res Function(_$InfoImpl) then) =
      __$$InfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String iss,
      String aud,
      @JsonKey(name: 'auth_time') int authTime,
      @JsonKey(name: 'user_id') String userId,
      String sub,
      int iat,
      int exp,
      String email,
      @JsonKey(name: 'email_verified') bool emailVerified,
      Firebase firebase,
      String uid});

  @override
  $FirebaseCopyWith<$Res> get firebase;
}

/// @nodoc
class __$$InfoImplCopyWithImpl<$Res>
    extends _$InfoCopyWithImpl<$Res, _$InfoImpl>
    implements _$$InfoImplCopyWith<$Res> {
  __$$InfoImplCopyWithImpl(_$InfoImpl _value, $Res Function(_$InfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Info
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iss = null,
    Object? aud = null,
    Object? authTime = null,
    Object? userId = null,
    Object? sub = null,
    Object? iat = null,
    Object? exp = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? firebase = null,
    Object? uid = null,
  }) {
    return _then(_$InfoImpl(
      iss: null == iss
          ? _value.iss
          : iss // ignore: cast_nullable_to_non_nullable
              as String,
      aud: null == aud
          ? _value.aud
          : aud // ignore: cast_nullable_to_non_nullable
              as String,
      authTime: null == authTime
          ? _value.authTime
          : authTime // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      iat: null == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      firebase: null == firebase
          ? _value.firebase
          : firebase // ignore: cast_nullable_to_non_nullable
              as Firebase,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoImpl implements _Info {
  const _$InfoImpl(
      {required this.iss,
      required this.aud,
      @JsonKey(name: 'auth_time') required this.authTime,
      @JsonKey(name: 'user_id') required this.userId,
      required this.sub,
      required this.iat,
      required this.exp,
      required this.email,
      @JsonKey(name: 'email_verified') required this.emailVerified,
      required this.firebase,
      required this.uid});

  factory _$InfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoImplFromJson(json);

  @override
  final String iss;
  @override
  final String aud;
  @override
  @JsonKey(name: 'auth_time')
  final int authTime;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String sub;
  @override
  final int iat;
  @override
  final int exp;
  @override
  final String email;
  @override
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @override
  final Firebase firebase;
  @override
  final String uid;

  @override
  String toString() {
    return 'Info(iss: $iss, aud: $aud, authTime: $authTime, userId: $userId, sub: $sub, iat: $iat, exp: $exp, email: $email, emailVerified: $emailVerified, firebase: $firebase, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoImpl &&
            (identical(other.iss, iss) || other.iss == iss) &&
            (identical(other.aud, aud) || other.aud == aud) &&
            (identical(other.authTime, authTime) ||
                other.authTime == authTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.iat, iat) || other.iat == iat) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.firebase, firebase) ||
                other.firebase == firebase) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, iss, aud, authTime, userId, sub,
      iat, exp, email, emailVerified, firebase, uid);

  /// Create a copy of Info
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoImplCopyWith<_$InfoImpl> get copyWith =>
      __$$InfoImplCopyWithImpl<_$InfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoImplToJson(
      this,
    );
  }
}

abstract class _Info implements Info {
  const factory _Info(
      {required final String iss,
      required final String aud,
      @JsonKey(name: 'auth_time') required final int authTime,
      @JsonKey(name: 'user_id') required final String userId,
      required final String sub,
      required final int iat,
      required final int exp,
      required final String email,
      @JsonKey(name: 'email_verified') required final bool emailVerified,
      required final Firebase firebase,
      required final String uid}) = _$InfoImpl;

  factory _Info.fromJson(Map<String, dynamic> json) = _$InfoImpl.fromJson;

  @override
  String get iss;
  @override
  String get aud;
  @override
  @JsonKey(name: 'auth_time')
  int get authTime;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get sub;
  @override
  int get iat;
  @override
  int get exp;
  @override
  String get email;
  @override
  @JsonKey(name: 'email_verified')
  bool get emailVerified;
  @override
  Firebase get firebase;
  @override
  String get uid;

  /// Create a copy of Info
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoImplCopyWith<_$InfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Firebase _$FirebaseFromJson(Map<String, dynamic> json) {
  return _Firebase.fromJson(json);
}

/// @nodoc
mixin _$Firebase {
  Identities get identities => throw _privateConstructorUsedError;
  @JsonKey(name: 'sign_in_provider')
  String get signInProvider => throw _privateConstructorUsedError;

  /// Serializes this Firebase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Firebase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirebaseCopyWith<Firebase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseCopyWith<$Res> {
  factory $FirebaseCopyWith(Firebase value, $Res Function(Firebase) then) =
      _$FirebaseCopyWithImpl<$Res, Firebase>;
  @useResult
  $Res call(
      {Identities identities,
      @JsonKey(name: 'sign_in_provider') String signInProvider});

  $IdentitiesCopyWith<$Res> get identities;
}

/// @nodoc
class _$FirebaseCopyWithImpl<$Res, $Val extends Firebase>
    implements $FirebaseCopyWith<$Res> {
  _$FirebaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Firebase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identities = null,
    Object? signInProvider = null,
  }) {
    return _then(_value.copyWith(
      identities: null == identities
          ? _value.identities
          : identities // ignore: cast_nullable_to_non_nullable
              as Identities,
      signInProvider: null == signInProvider
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Firebase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdentitiesCopyWith<$Res> get identities {
    return $IdentitiesCopyWith<$Res>(_value.identities, (value) {
      return _then(_value.copyWith(identities: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FirebaseImplCopyWith<$Res>
    implements $FirebaseCopyWith<$Res> {
  factory _$$FirebaseImplCopyWith(
          _$FirebaseImpl value, $Res Function(_$FirebaseImpl) then) =
      __$$FirebaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Identities identities,
      @JsonKey(name: 'sign_in_provider') String signInProvider});

  @override
  $IdentitiesCopyWith<$Res> get identities;
}

/// @nodoc
class __$$FirebaseImplCopyWithImpl<$Res>
    extends _$FirebaseCopyWithImpl<$Res, _$FirebaseImpl>
    implements _$$FirebaseImplCopyWith<$Res> {
  __$$FirebaseImplCopyWithImpl(
      _$FirebaseImpl _value, $Res Function(_$FirebaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Firebase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identities = null,
    Object? signInProvider = null,
  }) {
    return _then(_$FirebaseImpl(
      identities: null == identities
          ? _value.identities
          : identities // ignore: cast_nullable_to_non_nullable
              as Identities,
      signInProvider: null == signInProvider
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseImpl implements _Firebase {
  const _$FirebaseImpl(
      {required this.identities,
      @JsonKey(name: 'sign_in_provider') required this.signInProvider});

  factory _$FirebaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseImplFromJson(json);

  @override
  final Identities identities;
  @override
  @JsonKey(name: 'sign_in_provider')
  final String signInProvider;

  @override
  String toString() {
    return 'Firebase(identities: $identities, signInProvider: $signInProvider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseImpl &&
            (identical(other.identities, identities) ||
                other.identities == identities) &&
            (identical(other.signInProvider, signInProvider) ||
                other.signInProvider == signInProvider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, identities, signInProvider);

  /// Create a copy of Firebase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseImplCopyWith<_$FirebaseImpl> get copyWith =>
      __$$FirebaseImplCopyWithImpl<_$FirebaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseImplToJson(
      this,
    );
  }
}

abstract class _Firebase implements Firebase {
  const factory _Firebase(
      {required final Identities identities,
      @JsonKey(name: 'sign_in_provider')
      required final String signInProvider}) = _$FirebaseImpl;

  factory _Firebase.fromJson(Map<String, dynamic> json) =
      _$FirebaseImpl.fromJson;

  @override
  Identities get identities;
  @override
  @JsonKey(name: 'sign_in_provider')
  String get signInProvider;

  /// Create a copy of Firebase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseImplCopyWith<_$FirebaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Identities _$IdentitiesFromJson(Map<String, dynamic> json) {
  return _Identities.fromJson(json);
}

/// @nodoc
mixin _$Identities {
  List<String> get email => throw _privateConstructorUsedError;

  /// Serializes this Identities to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Identities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentitiesCopyWith<Identities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentitiesCopyWith<$Res> {
  factory $IdentitiesCopyWith(
          Identities value, $Res Function(Identities) then) =
      _$IdentitiesCopyWithImpl<$Res, Identities>;
  @useResult
  $Res call({List<String> email});
}

/// @nodoc
class _$IdentitiesCopyWithImpl<$Res, $Val extends Identities>
    implements $IdentitiesCopyWith<$Res> {
  _$IdentitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Identities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentitiesImplCopyWith<$Res>
    implements $IdentitiesCopyWith<$Res> {
  factory _$$IdentitiesImplCopyWith(
          _$IdentitiesImpl value, $Res Function(_$IdentitiesImpl) then) =
      __$$IdentitiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> email});
}

/// @nodoc
class __$$IdentitiesImplCopyWithImpl<$Res>
    extends _$IdentitiesCopyWithImpl<$Res, _$IdentitiesImpl>
    implements _$$IdentitiesImplCopyWith<$Res> {
  __$$IdentitiesImplCopyWithImpl(
      _$IdentitiesImpl _value, $Res Function(_$IdentitiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Identities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$IdentitiesImpl(
      email: null == email
          ? _value._email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentitiesImpl implements _Identities {
  const _$IdentitiesImpl({required final List<String> email}) : _email = email;

  factory _$IdentitiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentitiesImplFromJson(json);

  final List<String> _email;
  @override
  List<String> get email {
    if (_email is EqualUnmodifiableListView) return _email;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_email);
  }

  @override
  String toString() {
    return 'Identities(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentitiesImpl &&
            const DeepCollectionEquality().equals(other._email, _email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_email));

  /// Create a copy of Identities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentitiesImplCopyWith<_$IdentitiesImpl> get copyWith =>
      __$$IdentitiesImplCopyWithImpl<_$IdentitiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentitiesImplToJson(
      this,
    );
  }
}

abstract class _Identities implements Identities {
  const factory _Identities({required final List<String> email}) =
      _$IdentitiesImpl;

  factory _Identities.fromJson(Map<String, dynamic> json) =
      _$IdentitiesImpl.fromJson;

  @override
  List<String> get email;

  /// Create a copy of Identities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentitiesImplCopyWith<_$IdentitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
