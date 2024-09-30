//
//
// import 'package:flutter/foundation.dart';
//
// import 'auth_repository.dart';
//
//
// /// A Firebase Repostiroy that implements the AuthRepository
// class AuthRepositoryImpl implements AuthRepository {
//   AuthRepositoryImpl(this.localDataService);
//
//   final LocalDataService localDataService;
//
//   late AuthStatus _status;
//
//   /// Checks if the user is currently logged in
//   @override
//   bool get isLogin => true;
//
//   /// Sign in a user using email and password
//   @override
//   Future<User> handleSignIn(String email, String password) async {
//     UserCredential result =
//         await auth.signInWithEmailAndPassword(email: email, password: password);
//     final User user = result.user!;
//     // get token:
//     // final token = await user.getIdToken();
//     // debugPrint("------------token while signin---------------- $token");
//
//     return user;
//   }
//
//   /// Sign up a user using email and password
//   @override
//   Future<User> handleSignUp(email, password) async {
//     UserCredential result = await auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     final User user = result.user!;
//     // get token:
//     final token = await user.getIdToken();
//     debugPrint("------------token while signup---------------- $token");
//
//     return user;
//   }
//
//   /// Use firebase to handle forget password scenario
//   @override
//   Future<AuthStatus> handleForgetPassword(String emailAddress) async {
//     await auth
//         .sendPasswordResetEmail(email: emailAddress)
//         .then((value) => _status = AuthStatus.successful);
//
//     return _status;
//   }
//
//
//
//   /// Get the auth token of the user
//   @override
//   Future<String?> refreshToken() async {
//
//     return "";
//   }
//
//
//   /// Handle logout of the user
//   @override
//   Future<void> logout() async {
//     // if (isLogin) {
//     //   await auth.signOut();
//     //
//     // }
//     await localDataService.logout();
//   }
//
//
//   // /// Delete user account from firebase
//   // @override
//   // Future<void> deleteAccount() async {
//   //   await auth.currentUser?.delete();
//   // }
//
//
//
//
//   // verifyAuthToken() {
//   //   return FirebaseAuth.instance.id;
//   // }
//
//   /// Get the current access token from firebase
//   @override
//   Future<String?> accessToken() async {
//     // FirebaseAuth.instance.authStateChanges();
//     return await FirebaseAuth.instance.currentUser?.getIdToken();
//   }
// }
//
// /// Auth status based on the sign in errors by firebase
// enum AuthStatus {
//   successful,
//   wrongPassword,
//   emailAlreadyExists,
//   invalidEmail,
//   weakPassword,
//   unknown,
// }
