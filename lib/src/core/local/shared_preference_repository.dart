import 'package:abiola_along_client_app/src/modals/card_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_repository.dart';

class SharedPreferencesService implements SharedPrefService {
  SharedPreferencesService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  final _tokenKey = 'access-token';
  final _isFirstTimeKey = 'is-first-time';
  final _cookiesKey = 'header-cookie-key';
  final name = 'name-user';
  final userRole = 'role-user';
  final idKey = 'id-user';
  final userTypeKey = 'type-user';

  @override
  String? get accessToken => sharedPreferences.getString(_tokenKey);

  @override
  Future<bool> setAccessToken(String token) async {
    return await sharedPreferences.setString(_tokenKey, token);
  }

  @override
  Future<void> saveUsername(String username) {
    return sharedPreferences.setString(name, username);
  }

  @override
  String? get username => sharedPreferences.getString(name);

  @override
  bool getIsFirstTime() {
    return sharedPreferences.getBool(_isFirstTimeKey) ?? true;
  }

  @override
  Future<void> setIsFirstTime(bool value) async {
    await sharedPreferences.setBool(_isFirstTimeKey, value);
  }

  @override
  Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }

  @override
  Future<void> saveHeaderCookie(String headerCookie) async {
    await sharedPreferences.setString(_cookiesKey, headerCookie);
  }

  @override
  String get roleOfUser => sharedPreferences.getString(userRole) ?? "";

  @override
  Future<void> saveUserRole(String role) async {
    await sharedPreferences.setString(userRole, role);
  }

  @override
  String get getUserId => sharedPreferences.getString(idKey) ?? "";

  @override
  Future<void> saveUserId(String userId) {
    return sharedPreferences.setString(idKey, userId);
  }

  @override
  String get getHeaderCookie => sharedPreferences.getString(_cookiesKey) ?? "";

  @override
  String get getUserType => sharedPreferences.getString(userTypeKey) ?? "";

  @override
  Future<void> saveUserType(String userType) {
    return sharedPreferences.setString(userTypeKey, userType);
  }

  @override
  CardModal? get getUserCard {
    return null;
  }

  @override
  Future<void> saveUserCard(CardModal modal) {
    return Future.value();
  }
}
