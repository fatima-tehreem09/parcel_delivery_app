import 'dart:async';

import 'package:abiola_along_client_app/src/core/local/shared_preference_repository.dart';
import 'package:abiola_along_client_app/src/core/local/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract interface class SharedPrefService {
  Future<bool> setAccessToken(String token);

  String? get accessToken;

  Future<void> setIsFirstTime(bool value);

  bool getIsFirstTime();

  Future<void> saveUsername(String username);

  String? get username;

  Future<void> saveUserRole(String role);

  String get roleOfUser;

  Future<bool> clearAllData();

  Future<void> saveHeaderCookie(String headerCookie);

  String get getHeaderCookie;

  Future<void> saveUserId(String userId);

  String get getUserId;
}

final localDataProvider = Provider<SharedPrefService>(
  (ref) => SharedPreferencesService(ref.read(preferencesProvider)),
);
