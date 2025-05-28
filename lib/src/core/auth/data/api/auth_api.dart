import 'package:abiola_along_client_app/src/core/auth/data/dto/sign_in/sign_in_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/models/auth/user_model.dart';
import '../dto/sign_up/sign_up_dto.dart';

part 'auth_api.g.dart';

@RestApi()
abstract interface class AuthApi {
  factory AuthApi(Dio client) => _AuthApi(client);

  @POST('sign-up')
  Future<UserModel> signUp(@Body() SignUpDto signUpDto);

  @POST('sign-in')
  Future<UserModel> signIn(@Body() SignInDto signUpDto);
}
