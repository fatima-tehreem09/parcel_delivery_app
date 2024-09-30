import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../text_widget.dart';


sealed class AppSnackBar {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar(String text) {
    final messenger = snackbarKey.currentState;
    messenger?.removeCurrentSnackBar();
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(
        content:
        OnestText(
          text,
          size: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),


        backgroundColor: AppColors.primaryBlue,
      ),
    );
  }

  static void showErrorSnackBar([String? text]) {
    text ??= 'Something went wrong. Please try again.';
    final messenger = snackbarKey.currentState;
    messenger?.removeCurrentSnackBar();
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(
        content:      OnestText(
          text,
          size: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.red,
      ),
    );
  }

// static void showSnackbarForContext(BuildContext context, String text) {
//   // final messenger = snackbarKey.currentState;
//   // messenger?.removeCurrentSnackBar();
//   // messenger?.hideCurrentSnackBar();
//   ScaffoldMessenger.of(context).removeCurrentSnackBar();
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: NotoSansText(text, color: AppColors.white),
//       backgroundColor: AppColors.primary,
//     ),
//   );
// }
}
