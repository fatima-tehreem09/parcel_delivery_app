// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      accessToken: json['accessToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'user': instance.user.toJson(),
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      totalEarning: (json['total_earning'] as num?)?.toInt(),
      vehicleModel: (json['vehicle_model'] as num?)?.toInt(),
      licensePlateNumber: (json['license_plate_number'] as num?)?.toInt(),
      status: json['status'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'email': instance.email,
    'phone': instance.phone,
    'role': instance.role,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total_earning', instance.totalEarning);
  writeNotNull('vehicle_model', instance.vehicleModel);
  writeNotNull('license_plate_number', instance.licensePlateNumber);
  val['status'] = instance.status;
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('__v', instance.v);
  writeNotNull('info', instance.info?.toJson());
  return val;
}

_$InfoImpl _$$InfoImplFromJson(Map<String, dynamic> json) => _$InfoImpl(
      iss: json['iss'] as String,
      aud: json['aud'] as String,
      authTime: (json['auth_time'] as num).toInt(),
      userId: json['user_id'] as String,
      sub: json['sub'] as String,
      iat: (json['iat'] as num).toInt(),
      exp: (json['exp'] as num).toInt(),
      email: json['email'] as String,
      emailVerified: json['email_verified'] as bool,
      firebase: Firebase.fromJson(json['firebase'] as Map<String, dynamic>),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$InfoImplToJson(_$InfoImpl instance) =>
    <String, dynamic>{
      'iss': instance.iss,
      'aud': instance.aud,
      'auth_time': instance.authTime,
      'user_id': instance.userId,
      'sub': instance.sub,
      'iat': instance.iat,
      'exp': instance.exp,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'firebase': instance.firebase.toJson(),
      'uid': instance.uid,
    };

_$FirebaseImpl _$$FirebaseImplFromJson(Map<String, dynamic> json) =>
    _$FirebaseImpl(
      identities:
          Identities.fromJson(json['identities'] as Map<String, dynamic>),
      signInProvider: json['sign_in_provider'] as String,
    );

Map<String, dynamic> _$$FirebaseImplToJson(_$FirebaseImpl instance) =>
    <String, dynamic>{
      'identities': instance.identities.toJson(),
      'sign_in_provider': instance.signInProvider,
    };

_$IdentitiesImpl _$$IdentitiesImplFromJson(Map<String, dynamic> json) =>
    _$IdentitiesImpl(
      email: (json['email'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$IdentitiesImplToJson(_$IdentitiesImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
