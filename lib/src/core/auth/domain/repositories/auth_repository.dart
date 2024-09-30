// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../local_data/shared_preference_service.dart';
// import 'auth_repository_impl.dart';
// import 'firebase_auth_repository.dart';
//
// abstract interface class AuthRepository {
//   bool get isLogin;
//
//   Future<User> handleSignIn(String emailAddress, String password);
//
//   Future handleSignUp(String emailAddress, String password);
//
//   Future handleForgetPassword(String emailAddress);
//
//
//
//   Future<String?> refreshToken();
//
//   Future<void> logout();
//
//   Future<void> deleteAccount();
//
//
//   Future<String?> accessToken();
// }
//
// final authRepositoryProvider = Provider<AuthRepository>(
//   (ref) => AuthRepositoryImpl(ref.read(localDataProvider)),
// );
