import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HelperText extends StatelessWidget {
  const HelperText({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  final String? text;
  final String? linkText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    textStyle(Color color) {
      return TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Text.rich(
        TextSpan(
          text: text,
          style: textStyle(AppColors.textGrey),
          children: [
            TextSpan(
              text: linkText,
              recognizer: TapGestureRecognizer()..onTap = onTap,
              style: textStyle(AppColors.greenPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
