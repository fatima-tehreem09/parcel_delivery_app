import 'package:abiola_along_client_app/src/core/auth/data/dto/sign_in/sign_in_dto.dart';
import 'package:abiola_along_client_app/src/core/auth/domain/models/auth/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/auth/domain/repositories/auth/auth_repository.dart';
import '../../../../core/client/api_interceptor.dart';
import '../../../../core/handler/error_handler.dart';
import '../../../../core/local/local_storage_repository.dart';
import '../../../../shared/states/app_loading_state.dart';

part 'sign_in_provider.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  AppLoadingState build() => const AppLoadingState();

  Future<UserModel> signIn(UserModel request) async {
    state = const AppLoadingState.loading();
    try {
      final result = await ref.read(authRepository).signIn(
            SignInDto(email: request.email, password: request.password ?? ""),
          );
      final localData = ref.watch(localDataProvider);
      await localData.saveUsername(result.name ?? "");
      ref.refresh(authInterceptorProvider);
      ref.refresh(localDataProvider);
      return result;
    } catch (e) {
      throw ErrorHandler.errorHandler(error: e);
    } finally {
      state = const AppLoadingState();
    }
  }
}
