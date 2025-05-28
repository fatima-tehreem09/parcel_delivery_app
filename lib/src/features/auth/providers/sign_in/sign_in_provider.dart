// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../../../core/local/local_storage_repository.dart';
//
// part 'sign_in_provider.g.dart';
//
// @riverpod
// class SignIn extends _$SignIn {
//   @override
//   AppLoadingState build() => const AppLoadingState();
//
//   Future<SignInDataModel> signIn(SignInModel request) async {
//     state = const AppLoadingState.loading();
//     try {
//       final result = await ref.read(authRepositoryProvider).signIn(request);
//       final token = result.token ?? "";
//       final localData = ref.watch(localDataProvider);
//       await localData.setAccessToken(token);
//       await localData.saveUserId(result.user?.id ?? '');
//       await localData.saveUsername(result.user?.name ?? "");
//       ref.refresh(authInterceptorProvider);
//       ref.refresh(localDataProvider);
//       return result;
//     } catch (e) {
//       throw ErrorHandler.errorHandler(error: e);
//       // if (e is DioException) {
//       //   if (e.response?.statusCode == 400) {
//       //     throw e.response?.data['message'];
//       //   }
//       //   if (e.response?.statusCode == 500) {
//       //     throw "Invalid email or password";
//       //   } else {
//       //     log(e.response!.statusCode.toString());
//       //     log(e.response.toString());
//       //     throw e.response?.data['message'] ?? 'Unknown error occurred';
//       //   }
//       // }
//       // throw "An error occurred. Please try again later.";
//     } finally {
//       state = const AppLoadingState();
//     }
//   }
// }
