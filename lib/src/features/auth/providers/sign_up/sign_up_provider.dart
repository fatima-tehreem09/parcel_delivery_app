// import 'dart:typed_data';
//
// import 'package:image_picker/image_picker.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:surgemate_client_app/src/core/auth/domain/models/sign_up_model/signup.dart';
// import 'package:surgemate_client_app/src/core/auth/domain/repositories/auth_repository.dart';
// import 'package:surgemate_client_app/src/core/handler/error_handler.dart';
// import 'package:surgemate_client_app/src/features/auth/providers/sign_up/signup_state.dart';
//
// import '../../../../core/auth/domain/models/sign_in_model/sign_in_model.dart';
// import '../../../../core/user/user_model.dart';
// import '../sign_in/sign_in_provider.dart';
//
// part 'sign_up_provider.g.dart';
//
// @riverpod
// class SignUp extends _$SignUp {
//   @override
//   SignupState build() => SignupState.initial();
//
//   void changeName(String? v) {
//     state = state.copyWith(request: state.request.copyWith(name: v));
//   }
//
//   void changeBirth(String? v) {
//     state = state.copyWith(request: state.request.copyWith(dateOfBirth: v));
//   }
//
//   void changeEmail(String? v) {
//     state = state.copyWith(request: state.request.copyWith(email: v));
//   }
//
//   void changePassword(String? v) {
//     state = state.copyWith(request: state.request.copyWith(password: v));
//   }
//
//   void changeEmployment(EmploymentType? v) {
//     state = state.copyWith(request: state.request.copyWith(employmentType: v));
//   }
//
//   void changeImage(XFile? image) {
//     state = state.copyWith(image: image);
//   }
//
//   void changeSelectedDate(DateTime selectedDate) {
//     state = state.copyWith(selectedDate: selectedDate);
//   }
//
//   void changeCountry(String country) {
//     state = state.copyWith(
//       request: state.request.copyWith(country: country),
//     );
//   }
//
//   Future<UserModelData?> signUp() async {
//     state = state.copyWith(isLoading: true);
//     try {
//       String nameOfImage = '';
//       if (state.image != null) {
//         final String fileName = state.image!.name;
//         final Uint8List fileBytes = await state.image!.readAsBytes();
//         final imageName = await ref.read(authRepositoryProvider).uploadDocument(
//               fileBytes,
//               fileName,
//             );
//         nameOfImage = imageName.file ?? '';
//       }
//       state = state.copyWith(
//         request: state.request.copyWith(
//           profilePictureKey: nameOfImage,
//           gradationYear: state.selectedDate?.year.toString() ?? '',
//           role: "user",
//         ),
//       );
//
//       await ref.read(authRepositoryProvider).signUp(state.request);
//
//       final result = await ref.read(signInProvider.notifier).signIn(
//             SignInModel(
//               password: state.request.password,
//               email: state.request.email,
//             ),
//           );
//       return result.user;
//     } catch (e) {
//       throw ErrorHandler.errorHandler(error: e);
//       // if (e is DioException) {
//       //   if (e.response?.statusCode == 500) {
//       //     throw "User with this email already exists.";
//       //   } else {
//       //     throw "Internet connection error";
//       //   }
//       // }
//       // rethrow;
//     } finally {
//       state = state.copyWith(isLoading: false);
//     }
//   }
// }
