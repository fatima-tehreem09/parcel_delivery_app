import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/models/auth/user_model.dart';
import '../dto/sign_up/sign_up_dto.dart';

part 'auth_api.g.dart';

@RestApi()
abstract interface class AuthApi {
  factory AuthApi(Dio client) => _AuthApi(client, baseUrl: '/auth/');

  @POST('sign-up')
  Future<UserModel> signUp(@Body() SignUpDto signUpDto);

  @POST('social-sign-up')
  Future<void> socialSignUp(@Body() SignUpDto signUpDto);
}
