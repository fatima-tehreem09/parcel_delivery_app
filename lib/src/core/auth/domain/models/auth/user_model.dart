import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(toJson: true, fromJson: true)
class UserModel with _$UserModel{
  factory UserModel({
    required String email,
    required String phone,
    String? password,
    required String id,
    @Default('USER') String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
