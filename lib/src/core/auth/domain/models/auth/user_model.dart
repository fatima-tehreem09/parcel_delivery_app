import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String accessToken,
    required User user,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id')   required String id,
    required String email,
    required String phone,
    required String role,
    @JsonKey(name: 'total_earning',includeIfNull: false)    int ?totalEarning,
    @JsonKey(name: 'vehicle_model',includeIfNull: false)    String? vehicleModel,
    @JsonKey(name: 'license_plate_number',includeIfNull: false)    String? licensePlateNumber,
    required String status,
    @JsonKey(includeIfNull: false)    DateTime? createdAt,
    @JsonKey(includeIfNull: false)    DateTime ?updatedAt,
    @JsonKey(name: '__v',includeIfNull: false)     int? v,
    @JsonKey(includeIfNull: false)   Info? info,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}


@freezed
class Info with _$Info {
  const factory Info({
    required String iss,
    required String aud,
    @JsonKey(name: 'auth_time')    required int authTime,
    @JsonKey(name: 'user_id')      required String userId,
    required String sub,
    required int iat,
    required int exp,
    required String email,
    @JsonKey(name: 'email_verified')     required bool emailVerified,
    required Firebase firebase,
    required String uid,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}

@freezed
class Firebase with _$Firebase {
  const factory Firebase({
    required Identities identities,
    @JsonKey(name: 'sign_in_provider')    required String signInProvider,
  }) = _Firebase;

  factory Firebase.fromJson(Map<String, dynamic> json) => _$FirebaseFromJson(json);
}

@freezed
class Identities with _$Identities {
  const factory Identities({
    required List<String> email,
  }) = _Identities;

  factory Identities.fromJson(Map<String, dynamic> json) => _$IdentitiesFromJson(json);
}
