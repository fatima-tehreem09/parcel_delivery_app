// import 'package:dio/dio.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'get_user_by_id_provider.g.dart';
//
// @riverpod
// class UserById extends _$UserById {
//   @override
//   Future<GetUserModel> build(String id) async {
//     return await getUserByIDMethod(id);
//   }
//
//   Future<GetUserModel> getUserByIDMethod(String id) async {
//     try {
//       final result = await ref.read(authRepositoryProvider).getUserById(id);
//       return result;
//     } catch (e) {
//       if (e is DioException) {
//         if (e.response?.statusCode == 400) {
//           throw "Failed to get the user";
//         } else {
//           throw "Internet connection error";
//         }
//       }
//       rethrow;
//     }
//   }
// }
