import 'package:dio/dio.dart';

import '../../../data/api/auth_api.dart';
import '../../../data/dto/sign_up/sign_up_dto.dart';
import '../../models/auth/user_model.dart';
import 'auth_repository.dart';

/// Register user to our rest backend
class AuthApiRepository implements AuthenticationRepository {
  AuthApiRepository(this.client);

  final Dio client;

  @override
  Future<UserModel> signUp(SignUpDto request) async {
    return await AuthApi(client).signUp(request);
  }
}
