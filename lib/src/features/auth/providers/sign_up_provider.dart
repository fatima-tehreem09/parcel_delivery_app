import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/data/dto/sign_up/sign_up_dto.dart';
import '../../../core/auth/domain/repositories/auth/auth_repository.dart';
import '../../../shared/app_exception.dart';
import '../../../shared/states/app_loading_state.dart';

part 'sign_up_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  @override
  AppLoadingState build() => const AppLoadingState();

  Future<void> signUp(
      String emailAddress, String phone, String password) async {
    try {
      state = const AppLoadingState.loading();
      debugPrint('BEFORE');

      final result = await ref.read(authRepository).signUp(SignUpDto(
            email: emailAddress,
            password: password,
            phone: phone,
          ));
      debugPrint('$result.id');

      debugPrint('AFTER');

      state = const AppLoadingState();
    } catch (e) {
      state = const AppLoadingState();
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          throw AppException(
            title: 'Invalid User Data',
            error: 'User with this email already exists',
          );
        } else if (e.response?.statusCode == 404) {
          throw AppException(
            title: 'Invalid Group Code',
            error: 'This group code dose not exist.',
          );
        }
      }
      rethrow;
    }
  }
}
