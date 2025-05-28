// ignore_for_file: unnecessary_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_dto.freezed.dart';
part 'sign_up_dto.g.dart';

@Freezed(toJson: true, fromJson: false)
class SignUpDto with _$SignUpDto {
  factory SignUpDto({
    required String email,
    required String name,
    required String phone,
    @JsonKey(includeIfNull: false) String? password,
    @JsonKey(includeIfNull: false) String? confirmPassword,
  }) = _SignUpDto;

  @override
  Map<String, dynamic> toJson() => super.toJson();
}
