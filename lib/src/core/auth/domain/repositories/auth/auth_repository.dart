import 'package:abiola_along_client_app/src/core/auth/data/dto/sign_up/sign_up_dto.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../client/client.dart';
import '../../models/auth/user_model.dart';
import 'auth_api_repository.dart';

abstract interface class AuthenticationRepository {
  Future<UserModel> signUp(SignUpDto request);

}

final authRepository = Provider<AuthenticationRepository>(
  (ref) => AuthApiRepository(ref.read(client)),
);
