import 'package:abiola_along_client_app/src/core/auth/data/dto/sign_in/sign_in_dto.dart';
import 'package:abiola_along_client_app/src/widgets/snack_bar/app_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/data/dto/sign_up/sign_up_dto.dart';
import '../../../core/auth/domain/repositories/auth/auth_repository.dart';
import '../../../core/local/local_storage_repository.dart';
import '../../../shared/app_exception.dart';
import '../../../shared/states/app_loading_state.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AppLoadingState build() => const AppLoadingState();

  Future<void> signUp(
      String emailAddress, String phone, String password,{String vehicle_model="",String license_plate_number=""}) async {
    try {
      state = const AppLoadingState.loading();
      print('BEFORE');
      String role = ref.read(localDataProvider).getUserType.toUpperCase();
      final result = await ref.read(authRepository).signUp(SignUpDto(
            email: emailAddress,
            password: password,
            phone: phone,
            role: role,
        vehicle_model: vehicle_model,license_plate_number:license_plate_number
          ));
      print('${result.accessToken}');
      // if(result.accessToken.isNotEmpty){
      //   await ref.read(localDataProvider).setAccessToken(result.accessToken);
      //   // response=true;
      // }
      print('AFTER');

      state = const AppLoadingState();
    } catch (e) {
      print('Error ${e}');

      state = const AppLoadingState();
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          AppSnackBar.showErrorSnackBar("Invalid Request!");

        } else  if (e.response?.statusCode == 401) {
          AppSnackBar.showErrorSnackBar("Username or Password is incorrect");

        } else if (e.response?.statusCode == 404) {
          AppSnackBar.showErrorSnackBar("Request not found");
          // throw AppException(
          //   title: 'Invalid Group Code',
          //   error: 'This group code dose not exist.',
          // );
        }
      }
    }
  }

  Future<bool> signIn(BuildContext context,String emailAddress, String password) async {
     bool response=false;
    // try {
      state = const AppLoadingState.loading();
      print('BEFORE');
      final result = await ref.read(authRepository).signIn(SignInDto(
            username: emailAddress,
            password: password,
          ));
      if(result.accessToken.isNotEmpty){
        await ref.read(localDataProvider).setAccessToken(result.accessToken);
        await ref.read(localDataProvider).saveUserType(result.user.role.toLowerCase());
        response=true;
      }

      print('AFTER');

      state = const AppLoadingState();

    // } catch (e) {
    //   print('Error ${e}');
    //
    //   state = const AppLoadingState();
    //   if (e is DioException) {
    //     if (e.response?.statusCode == 400) {
    //       $showSnackBar(context: context, message: "Invalid Request!", backColor: Colors.red);
    //
    //     } else  if (e.response?.statusCode == 401) {
    //       $showSnackBar(context: context, message: "Username or Password is incorrect", backColor: Colors.red);
    //     }else{
    //       $showSnackBar(context: context, message: "Something went wrong!", backColor: Colors.red);
    //     }
    //   }else{
    //     $showSnackBar(context: context, message: "Something went wrong!", backColor: Colors.red);
    //   }
    // }

return response;
  }
}
