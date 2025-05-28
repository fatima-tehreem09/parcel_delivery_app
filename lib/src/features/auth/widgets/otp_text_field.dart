import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/colors.dart';

class AppOtpTextField extends ConsumerStatefulWidget {
  const AppOtpTextField({
    super.key,
    required this.enabled,
    required this.onCompleted,
    required this.validator,
  });

  final bool enabled;
  final ValueChanged<String> onCompleted;
  final FormFieldValidator<String> validator;

  @override
  ConsumerState createState() => _AppOtpTextFieldState();
}

class _AppOtpTextFieldState extends ConsumerState<AppOtpTextField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    TextStyle getStyle(Color color) {
      return GoogleFonts.urbanist(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
        decoration: TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.transparent,
        decorationThickness: 0,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OtpTextField(
          onCodeChanged: (String pin) {
            setState(() {
              errorText = widget.validator(pin);
            });
          },
          onSubmit: (String pin) {
            setState(() {
              errorText = widget.validator(pin);
            });
            if (errorText == null) {
              widget.onCompleted(pin);
            }
          },
          enabled: widget.enabled,
          fieldHeight: 48,
          fieldWidth: 48,
          filled: true,
          fillColor: AppColors.bgWhite,
          numberOfFields: 4,
          disabledBorderColor: const Color(0xffD9D9D9),
          enabledBorderColor: const Color(0xffD9D9D9),
          focusedBorderColor: AppColors.greenPrimary,
          borderColor: const Color(0xffD9D9D9),
          textStyle: getStyle(AppColors.blackPrimary),
          cursorColor: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(12),
          borderWidth: 1,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
          decoration: InputDecoration(
            hintText: "0",
            counterText: '',
            hintStyle: getStyle(AppColors.greySecondary),
          ),
          showFieldAsBox: true,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
