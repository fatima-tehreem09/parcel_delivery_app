import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppOtpTextField extends ConsumerStatefulWidget {
  const AppOtpTextField({
    super.key,
    required this.enabled,
  });
  final bool enabled;

  @override
  ConsumerState createState() => _AppOtpTextFieldState();
}

class _AppOtpTextFieldState extends ConsumerState<AppOtpTextField> {
  @override
  Widget build(BuildContext context) {
    textStyle(Color color) {
      return TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
    }

    InputBorder getBorder(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );
    }

    return OtpTextField(
      enabled: widget.enabled,
      fieldHeight: 48,
      fieldWidth: 48,
      filled: true,
      fillColor: AppColors.bgWhite,
      numberOfFields: 4,
      textStyle: textStyle(Color(0xff010101)),
      cursorColor: AppColors.greenPrimary,
      borderRadius: BorderRadius.circular(12),
      borderWidth: 1,
      hasCustomInputDecoration: true,
      borderColor: Color(0xffD9D9D9),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      decoration: InputDecoration(
        hintText: "-",
        counterText: '',
        hintStyle: textStyle(AppColors.textGrey),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: BorderSide(
        //     color: mode ? const Color(0xff212C42) : Colors.white,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: BorderSide(
        //     color: mode ? const Color(0xff212C42) : Colors.white,
        //   ),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: BorderSide(
        //     color: mode ? const Color(0xff212C42) : Colors.white,
        //   ),
        // ),
      ),
      focusedBorderColor: AppColors.greenPrimary,
      showFieldAsBox: true,
      onCodeChanged: (String value) {},
    );
  }
}
