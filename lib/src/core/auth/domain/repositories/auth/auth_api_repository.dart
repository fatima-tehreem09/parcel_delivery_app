import 'package:abiola_along_client_app/src/core/auth/data/dto/sign_in/sign_in_dto.dart';
import 'package:dio/dio.dart';

import '../../../data/api/auth_api.dart';
import '../../../data/dto/sign_up/sign_up_dto.dart';
import '../../models/auth/user_model.dart';
import 'auth_repository.dart';

class AuthApiRepository implements AuthenticationRepository {
  AuthApiRepository(this.client);
  final Dio client;

  @override
  Future<UserModel> signUp(SignUpDto request) async {
    return await AuthApi(client).signUp(request);
  }

  @override
  Future<UserModel> signIn(SignInDto request) async {
    return await AuthApi(client).signIn(request);
  }
}
